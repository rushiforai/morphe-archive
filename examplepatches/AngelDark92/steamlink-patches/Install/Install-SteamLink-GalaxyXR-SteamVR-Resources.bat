@echo off
setlocal EnableExtensions DisableDelayedExpansion
cd /d "%~dp0"

if not exist "%~dp0Install-SteamLink-GalaxyXR-SteamVR-Resources.ps1" (
    echo.
    echo  [ERROR] Install-SteamLink-GalaxyXR-SteamVR-Resources.ps1 not found.
    pause
    exit /b 2
)

echo.
echo  ================================================
echo   Steam Link GalaxyXR ^| SteamVR Resources Install
echo  ================================================
echo   Running -- progress shown below
echo  ================================================
echo.

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0Install-SteamLink-GalaxyXR-SteamVR-Resources.ps1" %*
set "RES_EXIT=%ERRORLEVEL%"

echo.
if "%RES_EXIT%"=="0" (
    echo  ================================================
    echo   SUCCESS -- SteamVR resources installed.
    echo  ================================================
) else (
    echo  ================================================
    echo   FAILED  -- Exit code: %RES_EXIT%
    echo  ================================================
)
echo.
pause
exit /b %RES_EXIT%
