@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"

where powershell.exe >nul 2>&1
if errorlevel 1 (
    echo.
    echo  [ERROR] Windows PowerShell was not found.
    pause
    exit /b 1
)

echo.
echo  ================================================
echo   Steam Link GalaxyXR ^| Apply PC Settings
echo  ================================================
echo   Running -- progress shown below
echo  ================================================
echo.

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0Apply-SteamLink-GalaxyXR-PC-Settings.ps1" %*
set "EXITCODE=%ERRORLEVEL%"

echo.
if "%EXITCODE%"=="0" (
    echo  ================================================
    echo   SUCCESS -- Settings applied.
    echo  ================================================
) else (
    echo  ================================================
    echo   FAILED  -- Exit code: %EXITCODE%
    echo  ================================================
)
echo.
pause
exit /b %EXITCODE%
