BOOK_CODE_PATH = "H:/rover/rover-self-work/cpp/book-code"
THIRD_PARTY = "H:/rover/rover-self-work/cpp/book-code/3rdparty"
WORK_PATH = os.getcwd()
print(WORK_PATH)

includeexternal (BOOK_CODE_PATH .. "/premake-vs-include.lua")
    

workspace "sqlite3"
    language "C++"
    location "build/%{_ACTION}/%{wks.name}"    
    if _ACTION == "vs2015" then
        toolset "v140_xp"
    end   

    group "sqlite3"

        project "libsqlite3"            
            kind "StaticLib"     
            removeconfigurations "TRACE*"    
            defines 
            {
                "CODEC_TYPE=CODEC_TYPE_AES256",         -- aes256
                --"CODEC_TYPE=CODEC_TYPE_AES128",       -- aes128
                "_LIB",
                "THREADSAFE=1",
                "SQLITE_SOUNDEX",
                "SQLITE_ENABLE_COLUMN_METADATA",
                "SQLITE_HAS_CODEC",
                "SQLITE_SECURE_DELETE",
                "SQLITE_ENABLE_FTS3",
                "SQLITE_ENABLE_FTS3_PARENTHESIS",
                "SQLITE_ENABLE_FTS4",
                "SQLITE_ENABLE_FTS5",
                "SQLITE_ENABLE_JSON1",
                "SQLITE_ENABLE_RTREE",
                "SQLITE_CORE",
                "SQLITE_ENABLE_EXTFUNC",
                "SQLITE_ENABLE_CSV",
                "SQLITE_ENABLE_SHA3",
                "SQLITE_USE_URI",
                "SQLITE_USER_AUTHENTICATION"
            }         
            files
            {
                "src/sqlite/sqlite3secure.c", 
                "src/sqlite/**.h",
                
                     
                               
            }     
            vpaths 
            {
                ["Header Files"] = { "**.h" },
                ["Source Files"] = { "**/sqlite3secure.c", "**.def", "**.rc" }
            }
            includedirs
            {
               
                
            }


        project "sqlite3shell"
            kind "ConsoleApp"
            removeconfigurations "TRACE*"      
            defines 
            {
                "SQLITE_SHELL_IS_UTF8",
                "SQLITE_HAS_CODEC",
                "SQLITE_USER_AUTHENTICATION"
            }
            files 
            { 
                "src/sqlite/sqlite3.h", 
                "src/sqlite/shell.c", 
                "src/sqlite/sqlite3shell.rc" 
            }
            vpaths 
            {
                ["Header Files"] = { "**.h" },
                ["Source Files"] = { "**.c", "**.rc" }
            }       
            links 
            { 
                "libsqlite3" 
            }

        

        
    

    group "test"       
        


        create_console_project("test-encrypted-sqlite", "src")
            defines { "SQLITE_HAS_CODEC" }
            includedirs
            {
                "src/sqlite"
            }
            link_libs
            {
                "libsqlite3-s.lib"
            }