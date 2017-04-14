" nocompatible has to be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-superman'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

filetype plugin indent on

" ~~~~~~~~~~~~~~~~~~~ Plugin specific settings ~~~~~~~~~~~~~~~~~~~

colorscheme dracula

" ---- whitespace shortcut ----



" ---- jez/vim-superman ----

noremap K :SuperMan <cword><CR>

" ---- Raimondi/delimitMate ----

let delimitMate_expand_cr=1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nexting_quotes=["`"]
	au FileType tex let b:delimitMate_quotes=""
	au FileType tex let b:delimitMAte_matchpairs="(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes=['"', "'"]
augroup END

" ---- airblade/vim-gitgutter settings ----

" in vim-airline only display hunks if the diff is non zero
let g:airline#entensions#hunks#non_zero_only=1

" ---- scrooloose/syntastic settings ----

let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='▲'
let g:syntastic_javascript_checkers=['jshint']

augroup mySyntastic
	au!
	au FileType text let b:syntastic_mode='passive'
augroup END

" ---- NERDTree settings ----

let NERDTreeShowHidden=1

" ---- xolox/vim-easytags settings ----
" where to looks for tagfiles

set tags=./tags;,~/.vimtags

" sensible default

let g:easytags_events=['BufReadPost', 'BufWritePost']
let g:easytags_async=1
let g:easytags_dynamic_files=2
let g:easytags_resolve_links=1
let g:easytags_suppress_ctags_warning=1

" ---- majutsushi/tagbar settings ----
" open tabbar with \b

nmap <silent> <leader>b :TagbarToggle<CR>

" fix whitespace with \w

nmap <silent> <leader>w :FixWhitespace<CR>

" ---- indentation guide ----

let g:indent_guides_start_level=0
let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
hi IndentGuidesEven ctermbg=lightgrey

" --- General settings ---

set laststatus=2
set backspace=indent,eol,start
set ruler " show the cursor position all the time
set number " line numbers
set showcmd " display incomplete commands
set incsearch " do incremental searching
set hlsearch
set mouse=a
set t_Co=256 "tell vim to use 256 colors
set ts=2 sw=2 et "ts=tabspace sw

syntax on

" Needs to be set for plugins like Syntastic and vim-gitgutter which put
" symbols
hi clear SignColumn

let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='dracula'

" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" Open NERDTree on startup
" let g:nerdtree_tabs_open_on_console_startup=1


