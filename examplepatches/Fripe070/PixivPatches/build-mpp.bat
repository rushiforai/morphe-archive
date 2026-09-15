@echo off
setlocal enabledelayedexpansion

echo ======================================================================
echo   Pixiv Morphe Patch Repository - Local/Offline Build Pipeline
echo ======================================================================

set "REPO_ROOT=%~dp0"
if "%REPO_ROOT:~-1%"=="\" set "REPO_ROOT=%REPO_ROOT:~0,-1%"
cd /d "%REPO_ROOT%"

:: ----------------------------------------------------------------------
:: 1. Locate Android SDK tools (d8.bat, android.jar)
:: ----------------------------------------------------------------------
set "D8_BAT="
set "ANDROID_JAR="

if exist "%LOCALAPPDATA%\Android\Sdk\build-tools" (
    for /f "delims=" %%F in ('dir /b /s /o-n "%LOCALAPPDATA%\Android\Sdk\build-tools\d8.bat" 2^>nul') do (
        if not defined D8_BAT set "D8_BAT=%%F"
    )
)
if not defined D8_BAT if defined ANDROID_HOME (
    for /f "delims=" %%F in ('dir /b /s /o-n "%ANDROID_HOME%\build-tools\d8.bat" 2^>nul') do (
        if not defined D8_BAT set "D8_BAT=%%F"
    )
)

if exist "%LOCALAPPDATA%\Android\Sdk\platforms" (
    for /f "delims=" %%F in ('dir /b /s /o-n "%LOCALAPPDATA%\Android\Sdk\platforms\android.jar" 2^>nul') do (
        if not defined ANDROID_JAR set "ANDROID_JAR=%%F"
    )
)
if not defined ANDROID_JAR if defined ANDROID_HOME (
    for /f "delims=" %%F in ('dir /b /s /o-n "%ANDROID_HOME%\platforms\android.jar" 2^>nul') do (
        if not defined ANDROID_JAR set "ANDROID_JAR=%%F"
    )
)

if not defined D8_BAT (
    echo [ERROR] d8.bat not found. Please install Android SDK build-tools.
    exit /b 1
)
if not defined ANDROID_JAR (
    echo [ERROR] android.jar not found. Please install Android SDK platforms.
    exit /b 1
)

echo [OK] Using D8: %D8_BAT%
echo [OK] Using android.jar: %ANDROID_JAR%

:: ----------------------------------------------------------------------
:: 2. Locate Tools (kotlinc, kotlin-stdlib, morphe-cli.jar)
:: ----------------------------------------------------------------------
set "TOOLS_DIR=%REPO_ROOT%\..\tools"
if not exist "%TOOLS_DIR%" set "TOOLS_DIR=%REPO_ROOT%\tools"

set "KOTLINC="
if exist "%TOOLS_DIR%\kotlinc\bin\kotlinc.bat" set "KOTLINC=%TOOLS_DIR%\kotlinc\bin\kotlinc.bat"
if not defined KOTLINC (
    where kotlinc >nul 2>nul
    if !errorlevel! equ 0 set "KOTLINC=kotlinc"
)
if not defined KOTLINC (
    echo [ERROR] kotlinc not found in %TOOLS_DIR%\kotlinc or system PATH.
    exit /b 1
)

set "KOTLIN_STDLIB="
if exist "%TOOLS_DIR%\kotlinc\lib\kotlin-stdlib.jar" set "KOTLIN_STDLIB=%TOOLS_DIR%\kotlinc\lib\kotlin-stdlib.jar"
if not defined KOTLIN_STDLIB (
    echo [ERROR] kotlin-stdlib.jar not found in %TOOLS_DIR%\kotlinc\lib.
    exit /b 1
)

set "MORPHE_CLI_JAR="
if exist "%TOOLS_DIR%\morphe-cli.jar" set "MORPHE_CLI_JAR=%TOOLS_DIR%\morphe-cli.jar"
if not defined MORPHE_CLI_JAR if exist "%REPO_ROOT%\libs\morphe-cli.jar" set "MORPHE_CLI_JAR=%REPO_ROOT%\libs\morphe-cli.jar"
if not defined MORPHE_CLI_JAR (
    echo [ERROR] morphe-cli.jar not found in %TOOLS_DIR% or %REPO_ROOT%\libs.
    exit /b 1
)

where jar >nul 2>nul
if !errorlevel! neq 0 (
    if defined JAVA_HOME if exist "%JAVA_HOME%\bin\jar.exe" set "PATH=%JAVA_HOME%\bin;!PATH!"
)
where jar >nul 2>nul
if !errorlevel! neq 0 (
    echo [ERROR] jar command not found in PATH or JAVA_HOME.
    exit /b 1
)

echo [OK] Using kotlinc: %KOTLINC%
echo [OK] Using morphe-cli: %MORPHE_CLI_JAR%

:: ----------------------------------------------------------------------
:: 3. Prepare Staging & Build Directories
:: ----------------------------------------------------------------------
echo [1/5] Preparing build directories...
set "BUILD_DIR=%REPO_ROOT%\build\local"
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%\extension_classes"
mkdir "%BUILD_DIR%\extension_dex"
mkdir "%BUILD_DIR%\patch_classes"
mkdir "%BUILD_DIR%\patch_dex"
mkdir "%BUILD_DIR%\staging\extensions"
mkdir "%BUILD_DIR%\staging\META-INF"
if not exist "%REPO_ROOT%\patches\build\libs" mkdir "%REPO_ROOT%\patches\build\libs"

:: ----------------------------------------------------------------------
:: 4. Compile Extension Sources & Convert to DEX
:: ----------------------------------------------------------------------
echo [2/5] Compiling extension Kotlin sources...
set "EXT_SOURCES="
for /r "%REPO_ROOT%\extensions\pixiv\src\main\kotlin" %%f in (*.kt) do (
    set "EXT_SOURCES=!EXT_SOURCES! "%%f""
)

if not defined EXT_SOURCES (
    echo [WARN] No extension sources found in extensions\pixiv\src\main\kotlin.
) else (
    call "%KOTLINC%" !EXT_SOURCES! -cp "%ANDROID_JAR%" -d "%BUILD_DIR%\extension_classes"
    if !errorlevel! neq 0 (
        echo [ERROR] Extension compilation failed.
        exit /b !errorlevel!
    )

    set "EXT_CLASSES="
    for /r "%BUILD_DIR%\extension_classes" %%f in (*.class) do (
        set "EXT_CLASSES=!EXT_CLASSES! "%%f""
    )

    call "%D8_BAT%" --lib "%ANDROID_JAR%" --output "%BUILD_DIR%\extension_dex" !EXT_CLASSES! "%KOTLIN_STDLIB%"
    if !errorlevel! neq 0 (
        echo [ERROR] Extension DEX conversion failed.
        exit /b !errorlevel!
    )
    copy /y "%BUILD_DIR%\extension_dex\classes.dex" "%BUILD_DIR%\staging\extensions\pixiv.mpe" >nul
)

:: ----------------------------------------------------------------------
:: 5. Compile Patch Sources & Convert to DEX
:: ----------------------------------------------------------------------
echo [3/5] Compiling patch Kotlin sources...
set "PATCH_SOURCES="
for /r "%REPO_ROOT%\patches\src\main\kotlin" %%f in (*.kt) do (
    set "PATCH_SOURCES=!PATCH_SOURCES! "%%f""
)

if not defined PATCH_SOURCES (
    echo [ERROR] No patch sources found in patches\src\main\kotlin.
    exit /b 1
)

call "%KOTLINC%" -jvm-target 11 !PATCH_SOURCES! -cp "%MORPHE_CLI_JAR%" -d "%BUILD_DIR%\patch_classes"
if !errorlevel! neq 0 (
    echo [ERROR] Patch compilation failed.
    exit /b !errorlevel!
)

set "PATCH_CLASSES="
for /r "%BUILD_DIR%\patch_classes" %%f in (*.class) do (
    set "PATCH_CLASSES=!PATCH_CLASSES! "%%f""
)

call "%D8_BAT%" --lib "%ANDROID_JAR%" --output "%BUILD_DIR%\patch_dex" !PATCH_CLASSES!
if !errorlevel! neq 0 (
    echo [ERROR] Patch DEX conversion failed.
    exit /b !errorlevel!
)

copy /y "%BUILD_DIR%\patch_dex\classes.dex" "%BUILD_DIR%\staging\classes.dex" >nul
xcopy /e /y /q "%BUILD_DIR%\patch_classes\*" "%BUILD_DIR%\staging\" >nul

:: ----------------------------------------------------------------------
:: 6. Create Manifest & Package MPP Bundle
:: ----------------------------------------------------------------------
echo [4/5] Packaging .mpp bundle...
(
    echo Manifest-Version: 1.0
    echo Name: Pixiv Patches
    echo Description: Morphe patches for Pixiv Android
    echo Version: 1.0.1
    echo Source: https://github.com/Fripe070/PixivPatches
    echo Author: Fripe070
    echo Website: https://github.com/Fripe070/PixivPatches
    echo License: GNU General Public License v3.0
    echo Patcher-Version: 1.10.0
) > "%BUILD_DIR%\staging\META-INF\MANIFEST.MF"

set "OUTPUT_MPP=%REPO_ROOT%\patches\build\libs\pixiv-patches-1.0.1.mpp"

if exist "%OUTPUT_MPP%" del "%OUTPUT_MPP%"

jar cvfm "%OUTPUT_MPP%" "%BUILD_DIR%\staging\META-INF\MANIFEST.MF" -C "%BUILD_DIR%\staging" . >nul
if !errorlevel! neq 0 (
    echo [ERROR] Failed to package .mpp archive.
    exit /b !errorlevel!
)

copy /y "%OUTPUT_MPP%" "%REPO_ROOT%\pixiv-patches.mpp" >nul

:: ----------------------------------------------------------------------
:: 7. Verify Patch Bundle
:: ----------------------------------------------------------------------
echo [5/5] Verifying bundle with morphe-cli...
java -jar "%MORPHE_CLI_JAR%" list-patches --patches="%OUTPUT_MPP%"
if !errorlevel! neq 0 (
    echo [ERROR] Morphe CLI verification failed.
    exit /b !errorlevel!
)

echo ======================================================================
echo   SUCCESS: %OUTPUT_MPP%
echo   Local mirror: %REPO_ROOT%\pixiv-patches.mpp
echo ======================================================================
exit /b 0
