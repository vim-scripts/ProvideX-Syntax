" Vim syntax file
" Language:		ProvideX
" Maintainer:	Leonard J. Clark <lclark@2bdx.net>
" Last Change:	2005 Feb 14
" Remark:		The language blows.  But working with it doesn't have to.

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn case ignore

" ProvideX Directives
syn keyword pvxDirective	ACCEPT ADDR AUTO BEGIN BREAK BUTTON BYE CALL 
syn keyword pvxDirective	CASE CHART CHECK_BOX CLEAR CLIP_BOARD CLOSE 
syn keyword pvxDirective	CONTINUE CUSTOM_VBX CWDIR DATA DAY_FORMAT 
syn keyword pvxDirective	DEFAULT DEFCTL DEFPRT DEFTTY DELETE DICTIONARY 
syn keyword pvxDirective	DIM DIRECT DIRECTORY DISABLE DISABLE CONTROL 
syn keyword pvxDirective	DROP DROP_BOX DUMP EDIT ENABLE END END_IF 
syn keyword pvxDirective	ENDTRACE ENTER ERASE ERROR_HANDLER ESCAPE 
syn keyword pvxDirective	EXECUTE EXIT EXITTO EXTRACT FILE FIND 
syn keyword pvxDirective	FLOATINGPOINT FOR FUNCTION GET_FILE_BOX GOSUB 
syn keyword pvxDirective	GOTO GRID H_SCROLLBAR HIDE IF THEN ELSE INDEXED 
syn keyword pvxDirective	INPUT INSERT INVOKE IOLIST KEYED LET LIKE 
syn keyword pvxDirective	LINE_SWITCH LIST LIST_BOX LOAD LOCAL LOCK
syn keyword pvxDirective	LONG_FORM MENU_BAR MERGE MESSAGE_LIB MNEMONIC 
syn keyword pvxDirective	MSGBOX MULTI_LINE MULTI_MEDIA NEXT OBTAIN OPEN 
syn keyword pvxDirective	PASSWORD PERFORM POP POPUP_MENU PRECISION PREFIX 
syn keyword pvxDirective	PREINPUT PRINT PROCESS PROGRAM PROPERTY PURGE 
syn keyword pvxDirective	QUIT RADIO_BUTTON RANDOMIZE READ REDIM REFILE 
syn keyword pvxDirective	RELEASE REM REMOVE RENAME RENUMBER REPEAT RESET 
syn keyword pvxDirective	RESTORE RETRY RETURN ROUND RUN SAVE SELECT SERIAL 
syn keyword pvxDirective	SET_FOCUS SET_NBF SET_PARAM SETCTL SETDAY SETDEV 
syn keyword pvxDirective	SETDRIVE SETERR SETESC SETFID SETMOUSE SETTIME 
syn keyword pvxDirective	SETTRACE SHORT_FORM SHOW SORT START STATIC STOP 
syn keyword pvxDirective	SWITCH SYSTEM_HELP SYSTEM_JRNL TABLE TRANSLATE 
syn keyword pvxDirective	TRISTATE_BOX UNLOCK UNTIL UPDATE USER_LEX 
syn keyword pvxDirective	VARDROP_BOX VARLIST_BOX V_SCROLLBAR VIA 
syn keyword pvxDirective	VIDEO_PALETTE WAIT WEND WHILE WINPRT_SETUP WRITE 
syn keyword pvxDirective	ADD INDEX CREATE TABLE DEF CLASS CVS DTE LCS UCS 
syn keyword pvxDirective	GID UID MSG OBJECT DELETE DROP CLASS INDEX 
syn keyword pvxDirective	OBJECT ON ENABLE CONTROL SWITCH EXTRACT FIND 
syn keyword pvxDirective	RECORD KEYED LOAD CLASS DATA EVENT PROCESS 
syn keyword pvxDirective	SERVER DATA RECORD RENAME DATA FILE SETDEV 
syn keyword pvxDirective	PROGRAM TSK USER_LEX PROCEED

" ProvideX Functions
syn keyword pvxFunction		ABS ACS AND ARG ASC ASN ATH ATN BIN BSZ CHG CHR COS
syn keyword pvxFunction		CPL CRC CSE CTL CVS DEC DIM DIR DLL DLX DSK DTE ENV
syn keyword pvxFunction		EPT ERR EVN EVS EXP FFN FIB FID FIN FPT GAP GBL GEP
syn keyword pvxFunction		HSA HSH HTA HWN I3E IND INT IOL IOR JUL KEC KEF KEL
syn keyword pvxFunction		KEN KEP KEY KGN LCS LEN LOG LRC LST MAX MEM MID MIN
syn keyword pvxFunction		MNM MOD MSG MSK MXC MXL NEW NOT NUL NUM OBJ OPT PAD
syn keyword pvxFunction		PCK PFX PGM POS PRC PRM PTH PUB RCD RDX REC REF RND
syn keyword pvxFunction		RNO SEP SGN SIN SQR SRT SSZ STK STP STR SUB SWP SYS
syn keyword pvxFunction		TAN TBL TCB TMR TRX TSK TXH TXW UCS UPK VIN VIS XEQ
syn keyword pvxFunction		XFA XOR
syn match	pvxFunction		"@X\|@Y"

syn keyword	pvxArguments	KNO	DOM IND IOL FROM TO WHERE

" System Variables
syn keyword pvxVariables	BKG CHN CTL DAY DLM DSZ EOM ERR ERS ESC GFN GID HFN
syn keyword pvxVariables	HLP HWD LFA LFO LIP LPG LWD MSE MSL NAR NID PFX PGN
syn keyword pvxVariables	PRC PRM PSZ QUO RET RND SEP SID SSN SYS TIM TME TMS
syn keyword pvxVariables	TSM UID UNT WHO

" Comments
syn keyword	pvxTodo	contained	TODO
syn keyword pvxTodo contained	XXX
syn region	pvxComment	start="REM"	end="$"	contains=pvxTodo
syn region	pvxComment	start="!"	end="$" contains=pvxTodo

" Path Modifiers
syn match	pvxPathModifier	contained	"\[[A-Za-z][A-Za-z][A-Za-z]\]"
syn match	pvxPathModifier contained	"\*[A-Za-z]\+\*"

" String Constant
syn region	pvxString		start=+"+	end=+"+	contains=pvxHex,pvxPathModifier

" Numbers
syn match	pvxNumber		"\<\d\+\>"
syn match	pvxNumber		"\<\d\+\.\d*\>"
syn match	pvxNumber		"\.\d\+\>"

" Misc
syn match	pvxFileNumber	"\w*_chan"
syn match	pvxFileNumber	"\w*FH"
syn match	pvxNomadsCtl	"\w*\.ctl"
syn match	pvxFn			"fn%[0-9a-zA-Z_\-]*\$\?"
syn match	pvxHex			"\$[0-9a-fA-F]*\$"
syn match	pvxLabel		"^\w*:"
syn region	pvxLineNumber	start="^\d"	end="\s"
syn match	pvxMnemonic		"'\w*'"
syn match	pvxOperator		"-\|=\|[:<>+\*^/\\]"
syn match	pvxTypeSpec		"[a-zA-Z0-9_][\$%&!#]"ms=s+1

syn match	pvxNewline		"\\$"

" PreProcessor
syn keyword	pvxPreProc		__init_pgm__ __exit_pgm__ __break__ __copyright__

if version >= 508 || !exists("did_basic_syntax_inits")
	if version < 508
		let did_basic_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	"HiLink pvxIfBlock			Comment
	HiLink pvxArguments			Identifier
	HiLink pvxComment			Comment
	HiLink pvxNewline			Special
	HiLink pvxDirective			Statement
	HiLink pvxFileNumber		Type
	HiLink pvxFn				Special
	HiLink pvxFunction			Identifier
	HiLink pvxHex				Special
	HiLink pvxLabel				Label
	HiLink pvxLineNumber		Label
	HiLink pvxMnemonic			Special
	HiLink pvxNumber			Number
	HiLink pvxNomadsCtl			Special
	HiLink pvxOperator			Type
	HiLink pvxPathModifier		Special
	HiLink pvxPreProc			Identifier
	HiLink pvxString			String
	HiLink pvxTodo				Todo
	HiLink pvxTypeSpec			Type
	HiLink pvxVariables			Identifier

	delcommand HiLink
endif

let b:current_syntax = "providex"

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {<cr>}<Esc>O

" Jump outside teh current []/()/{} enclosure
map  /[)}\]]<cr>:noh<cr>a 
inoremap  <Esc>/[)}\]]<cr>:noh<cr>a 
