@echo off
setlocal
cd /d "%~dp0"

rem Check if portable git exists in tools\git\cmd\git.exe or ..\git\cmd\git.exe
if exist "%~dp0tools\git\cmd\git.exe" (
    set "PATH=%~dp0tools\git\cmd;%PATH%"
) else if exist "%~dp0..\git\cmd\git.exe" (
    set "PATH=%~dp0..\git\cmd;%PATH%"
)

echo ===================================================
echo   Birdy Patches: Automated GitHub Sync
echo ===================================================
echo.

:: 1. Run local test suite to prevent pushing broken code
echo [1/3] Running tests...
powershell -NoProfile -ExecutionPolicy Bypass -File "verify_tests.ps1"
if %errorlevel% neq 0 (
    echo [ERROR] Tests failed! Aborting push to keep GitHub releases clean.
    if not "%NO_PAUSE%"=="1" pause
    exit /b %errorlevel%
)

:: 2. Check for git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or found in PATH.
    if not "%NO_PAUSE%"=="1" pause
    exit /b 1
)

:: 3. Check for changes
echo [2/3] Checking for modified files...
git status -s

:: 4. Pull remote changes first to prevent rebase conflicts with semantic-release bot
echo Pulling latest remote changes...
git pull origin main

:: 5. Commit and push
set /p "msg=Enter commit message (press Enter for default): "
if "%msg%"=="" set "msg=feat: update patches"

git add .
git diff --quiet --cached
if %errorlevel% neq 0 (
    git commit -m "%msg%" >nul 2>&1
)

echo.
echo [3/3] Pushing changes to GitHub...
git push origin main
if %errorlevel% equ 0 (
    echo.
    echo ===================================================
    echo  SUCCESS: Pushed to GitHub!
    echo  GitHub Actions is now compiling your Morphe release.
    echo ===================================================
) else (
    echo.
    echo [ERROR] Push failed. Check your network or GitHub credentials.
    if not "%NO_PAUSE%"=="1" pause
    exit /b 1
)

if not "%NO_PAUSE%"=="1" pause
