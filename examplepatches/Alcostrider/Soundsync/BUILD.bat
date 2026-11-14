@echo off
setlocal
title Build SoundSync patches
cd /d "%~dp0"

echo.
echo  ==================================================================
echo   SoundSync patches - build the Morphe patch bundle
echo  ==================================================================
echo.
echo  No installing and no admin rights needed. If Java and the Android
echo  tools aren't on this PC, they're downloaded into this folder
echo  (_tools). Delete the whole folder later and nothing is left behind.
echo.
echo  The first build takes 5-15 minutes. Later builds are quicker.
echo.

set "TOOLS=%~dp0_tools"
set "GRADLE_USER_HOME=%TOOLS%\gradle-home"
rem Use the PC's proxy settings, as office networks often need
set "GRADLE_OPTS=-Djava.net.useSystemProxies=true"
set "SDKMANAGER_OPTS=-Djava.net.useSystemProxies=true"
if not exist "%TOOLS%" mkdir "%TOOLS%"

rem ------------------------------------------------------------ Java
if defined JAVA_HOME if exist "%JAVA_HOME%\bin\java.exe" goto java_ok
set "JAVA_HOME=%ProgramFiles%\Android\Android Studio\jbr"
if exist "%JAVA_HOME%\bin\java.exe" goto java_ok
set "JAVA_HOME=%LOCALAPPDATA%\Programs\Android Studio\jbr"
if exist "%JAVA_HOME%\bin\java.exe" goto java_ok
call :find_portable_java
if defined JAVA_HOME goto java_ok

echo  [1/2] Downloading Java (Eclipse Temurin 21, about 190 MB)...
call :download "https://api.adoptium.net/v3/binary/latest/21/ga/windows/x64/jdk/hotspot/normal/eclipse" "%TOOLS%\jdk.zip"
if errorlevel 1 goto download_failed
call :unzip "%TOOLS%\jdk.zip" "%TOOLS%"
if errorlevel 1 goto unzip_failed
del "%TOOLS%\jdk.zip"
call :find_portable_java
if not defined JAVA_HOME goto unzip_failed
:java_ok
echo  Java:        %JAVA_HOME%

rem ------------------------------------------------------------ Android SDK
if defined ANDROID_HOME if exist "%ANDROID_HOME%\licenses" goto sdk_ok
set "ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk"
if exist "%ANDROID_HOME%\licenses" goto sdk_ok
set "ANDROID_HOME=%TOOLS%\android-sdk"
if exist "%ANDROID_HOME%\licenses\android-sdk-license" goto sdk_ok

echo.
echo  The build downloads parts of Google's Android SDK. They come under
echo  the Android SDK License Agreement:
echo      https://developer.android.com/studio/terms
echo.
choice /c YN /m " Do you accept it and want to continue"
if errorlevel 2 goto cancelled

if not exist "%ANDROID_HOME%" mkdir "%ANDROID_HOME%"
echo  [2/2] Downloading the Android SDK tools (about 150 MB)...
set "CLZIP=%TOOLS%\cmdline-tools.zip"
call :download "https://dl.google.com/android/repository/commandlinetools-win-13114758_latest.zip" "%CLZIP%"
if errorlevel 1 call :download "https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip" "%CLZIP%"
if errorlevel 1 goto licenses_by_hand
if exist "%TOOLS%\cltmp" rmdir /s /q "%TOOLS%\cltmp"
mkdir "%TOOLS%\cltmp"
call :unzip "%CLZIP%" "%TOOLS%\cltmp"
if errorlevel 1 goto licenses_by_hand
if not exist "%ANDROID_HOME%\cmdline-tools" mkdir "%ANDROID_HOME%\cmdline-tools"
if exist "%ANDROID_HOME%\cmdline-tools\latest" rmdir /s /q "%ANDROID_HOME%\cmdline-tools\latest"
move "%TOOLS%\cltmp\cmdline-tools" "%ANDROID_HOME%\cmdline-tools\latest" >nul
rmdir /s /q "%TOOLS%\cltmp"
del "%CLZIP%"
echo  Recording that you accepted the licenses...
(for /l %%i in (1,1,40) do @echo y) | "%ANDROID_HOME%\cmdline-tools\latest\bin\sdkmanager.bat" --sdk_root="%ANDROID_HOME%" --licenses >nul 2>&1
if exist "%ANDROID_HOME%\licenses\android-sdk-license" goto sdk_ok

:licenses_by_hand
rem The SDK tools couldn't be fetched or run: record the accepted license directly.
rem The build then downloads what it needs by itself.
if not exist "%ANDROID_HOME%\licenses" mkdir "%ANDROID_HOME%\licenses"
>"%ANDROID_HOME%\licenses\android-sdk-license" echo 24333f8a63b6825ea9c5514f83c2829b004d1fee
:sdk_ok
echo  Android SDK: %ANDROID_HOME%
echo.

rem ------------------------------------------------------------ GitHub login
rem Morphe's build tools are downloaded from GitHub's package store, which
rem needs a GitHub username and a token with only the read:packages permission.
if defined GITHUB_TOKEN goto gh_ok
set "GHFILE=%~dp0github-login.txt"
if not exist "%GHFILE%" goto gh_ask
set /p GITHUB_ACTOR=<"%GHFILE%"
for /f "usebackq skip=1 delims=" %%L in ("%GHFILE%") do if not defined GITHUB_TOKEN set "GITHUB_TOKEN=%%L"
if defined GITHUB_TOKEN goto gh_ok

:gh_ask
echo  Morphe's build tools come from GitHub. Enter your GitHub username and
echo  the token you made (classic token, only "read:packages" ticked).
echo  To paste in this window, right-click.
echo.
set /p "GITHUB_ACTOR= GitHub username: "
set /p "GITHUB_TOKEN= Token: "
if not defined GITHUB_TOKEN goto gh_missing
echo.
choice /c YN /m " Remember them in github-login.txt in this folder, so you're not asked again"
if errorlevel 2 goto gh_ok
>"%GHFILE%" echo %GITHUB_ACTOR%
>>"%GHFILE%" echo %GITHUB_TOKEN%
echo  Saved. Keep that file private, like a password.
:gh_ok
echo.

rem ------------------------------------------------------------ build
echo  Building the patch bundle. Lots of scrolling text is normal.
echo.
call gradlew.bat --no-daemon buildAndroid
if errorlevel 1 goto build_failed

set "MPP="
for %%F in ("patches\build\libs\patches-*.mpp") do set "MPP=%%F"
if not defined MPP goto build_failed
copy /y "%MPP%" "SoundSync-patches.mpp" >nul
echo.
echo  ------------------------------------------------------------------
echo   Done: SoundSync-patches.mpp is in this folder.
echo   Copy it to the phone, then in Morphe Manager: Add patch source,
echo   Local, and pick that file.
echo  ------------------------------------------------------------------
explorer /select,"%~dp0SoundSync-patches.mpp"
pause
exit /b 0

rem ============================================================ helpers

:find_portable_java
set "JAVA_HOME="
for /d %%D in ("%TOOLS%\jdk-*") do if exist "%%D\bin\java.exe" set "JAVA_HOME=%%D"
exit /b 0

:download
rem %1 = URL, %2 = file. PowerShell first (it uses the PC's proxy), then curl.
if exist "%~2" del "%~2"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; try { Invoke-WebRequest -UseBasicParsing -Uri '%~1' -OutFile '%~2'; exit 0 } catch { Write-Host ('   ' + $_.Exception.Message); exit 1 }"
if not errorlevel 1 if exist "%~2" exit /b 0
curl.exe -fsSL --retry 2 -o "%~2" "%~1"
if not errorlevel 1 if exist "%~2" exit /b 0
if exist "%~2" del "%~2"
exit /b 1

:unzip
rem %1 = zip, %2 = folder. Windows' built-in tar is fast; PowerShell as a fallback.
tar -xf "%~1" -C "%~2" >nul 2>&1
if not errorlevel 1 exit /b 0
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Expand-Archive -Force -LiteralPath '%~1' -DestinationPath '%~2'; exit 0 } catch { exit 1 }"
exit /b %errorlevel%

rem ============================================================ problems

:gh_missing
echo.
echo  No token entered. Make one on github.com: profile picture, Settings,
echo  Developer settings, Personal access tokens, Tokens (classic), tick
echo  only "read:packages". Then run this again.
goto fail

:download_failed
echo.
echo  A download failed. The network may block it: try another network.
goto fail

:unzip_failed
echo.
echo  Couldn't unpack a downloaded file. Check there's free disk space and
echo  run this again.
goto fail

:cancelled
echo.
echo  Cancelled. Nothing was downloaded.
goto fail

:build_failed
echo.
echo  ------------------------------------------------------------------
echo   The build failed. Scroll up to the first lines that say "error",
echo   "FAILURE" or "What went wrong", screenshot them and send them to
echo   Claude.
echo   If they mention "401" or "Unauthorized": the GitHub username or
echo   token is wrong or expired. Delete github-login.txt and run again.
echo  ------------------------------------------------------------------
:fail
pause
exit /b 1
