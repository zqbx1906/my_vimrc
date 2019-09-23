"-----------------------------------------------------------------
"
" basic - 常用配置相关
"
" N/A
"
"-----------------------------------------------------------------

set nocompatible                        " 关闭 vi 兼容模式
set nolist          " 不显示换行符
filetype plugin indent on   " 开启插件
set fileformat=unix

colorscheme molokai         " 设定配色方案

set t_Co=256                " t_Co即terminal Color之意,开启256颜色之后，colorschema在vim里好看了许多
set background=dark
set cursorline              " 突出显示当前行
set cursorcolumn            " 高亮显示光标列
highlight CursorLine cterm=none ctermbg=236
highlight CursorColumn cterm=none ctermbg=236

set number                  " 显示行号
syntax on                   " 自动语法高亮

set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃

set nobackup                " 覆盖文件时不备份
set noswapfile

set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4

set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

"set ruler                   " 打开状态栏标尺
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                            " 设置在状态行显示的信息

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
					" 用<F2>开启/关闭行号显示





"-----------------------------------------------------------------
"
" plugin - alt+left,right
"
" 窗口移动及resize
"
"-----------------------------------------------------------------
nnoremap <c-h>  <esc><c-w>h<esc>
nnoremap <c-j>  <esc><c-w>j<esc>
nnoremap <c-k>  <esc><c-w>k<esc>
nnoremap <c-l>  <esc><c-w>l<esc>

map <a-left>   <esc><c-w>h<esc>
map <a-down>   <esc><c-w>j<esc>
map <a-up>     <esc><c-w>k<esc>
map <a-right>  <esc><c-w>l<esc>

map  <M-Right> <c-w>l
map  <M-Left>  <c-w>h
map  <M-Up>    <c-w>k
map  <M-Down>  <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left>  <ESC><c-w>h
imap <M-Up>    <ESC><c-w>k
imap <M-Down>  <ESC><c-w>j


nmap v=    <esc>:resize +3<cr><esc>
nmap v-    <esc>:resize -3<cr><esc>
nmap v,    <esc>:vertical resize +3<cr><esc>
nmap v.    <esc>:vertical resize -3<cr><esc>





"-----------------------------------------------------------------
"
" plugin - quickfix
"
" F8 打开隐藏
"
"-----------------------------------------------------------------
let g:quickfixname = 1
function QuickfixFunc()
	if g:quickfixname
		let g:quickfixname = 0
		exec ":copen 20"
	else
		let g:quickfixname = 1
		exec ":ccl"
	endif
endfunction

nnoremap <F8>    <ESC>:call QuickfixFunc()<CR><ESC>
nnoremap <F9>    <ESC>:cn<CR><ESC>    "下一项
nnoremap <F10>   <ESC>:cp<CR><ESC>    "上一项







"-----------------------------------------------------------------
"
" plugin - taglist.vim  查看函数列表，需要ctags程序
"
" F4 打开隐藏taglist窗口
"
"-----------------------------------------------------------------
nnoremap <F4>  :TlistToggle<CR>

let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1




"-----------------------------------------------------------------
"
" plugin - winmanager.vim  查看函数列表，需要ctags程序
"
" F3 打开隐藏taglist窗口
"
"-----------------------------------------------------------------
let g:winManagerWindowLayout='TagList|FileExplorer'
let g:winManagerWidth = 50
let g:bufExplorerMaxHeight=20
nnoremap <F3>   <ESC>:WMToggle<CR><ESC>






"-----------------------------------------------------------------
"
" plugin - NERD_commenter.vim   注释代码用的，
"
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
"
" 注：count参数可选，无则默认为选中行或当前行
"
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看






"-----------------------------------------------------------------
"
" plugin - bufexplorer.vim  查看函数列表，需要ctags程序
"
" F12 打开隐藏taglist窗口
"
"-----------------------------------------------------------------
nnoremap <F12>   <esc>:ToggleBufExplorer<CR><esc>



"-----------------------------------------------------------------
"
" plugin - ctags 设定
"
" N/A
"
"-----------------------------------------------------------------
set tags=tags;
set autochdir





"-----------------------------------------------------------------
"
" plugin - cscope 设定
"
" N/A
"
"-----------------------------------------------------------------
if has("cscope")  
    set csprg=/usr/bin/cscope  
    set csto=0 
    set cst  
    set csverb  
    set cspc=3 
    "add any database in current dir  
    if filereadable("cscope.out")  
        cs add cscope.out  
    "else search cscope.out elsewhere  
    else 
        let cscope_file=findfile("cscope.out",".;")  
        let cscope_pre=matchstr(cscope_file,".*/")  
        if !empty(cscope_file) && filereadable(cscope_file)  
            exe "cs add" cscope_file cscope_pre  
        endif        
    endif
    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "    0或者s   —— 查找这个C符号
    "    1或者g  —— 查找这个定义
    "    2或者d  —— 查找被这个函数调用的函数（们）
    "    3或者c  —— 查找调用这个函数的函数（们）
    "    4或者t   —— 查找这个字符串
    "    6或者e  —— 查找这个egrep匹配模式
    "    7或者f   —— 查找这个文件
    "    8或者i   —— 查找#include这个文件的文件（们）
    "
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "
    nmap qs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap qg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap qc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap qt :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap qe :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap qf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap qi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap qd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif













