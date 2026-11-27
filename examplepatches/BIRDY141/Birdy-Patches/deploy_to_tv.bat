@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"

echo ======================================================================
echo          BirdyTV: Automated Morphe Patch ^& ADB TV Deployment
echo ======================================================================
echo.

rem 1. Setup PATH for tools (Git, ADB, Java)
if exist "%~dp0tools\git\cmd\git.exe" (
    set "PATH=%~dp0tools\git\cmd;!PATH!"
) else if exist "%~dp0..\git\cmd\git.exe" (
    set "PATH=%~dp0..\git\cmd;!PATH!"
)

if exist "%~dp0tools\platform-tools\adb.exe" (
    set "ADB_EXE=%~dp0tools\platform-tools\adb.exe"
) else if exist "%~dp0..\tv clean up\platform-tools\adb.exe" (
    set "ADB_EXE=%~dp0..\tv clean up\platform-tools\adb.exe"
) else (
    where adb >nul 2>&1
    if !errorlevel! equ 0 (
        set "ADB_EXE=adb"
    ) else (
        echo [Notice] ADB not found. Downloading Android Platform-Tools...
        powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ErrorActionPreference = 'Stop'; $zip = Join-Path '%~dp0tools' 'platform-tools.zip'; New-Item -ItemType Directory -Force -Path '%~dp0tools' | Out-Null; Invoke-WebRequest -Uri 'https://dl.google.com/android/repository/platform-tools-latest-windows.zip' -OutFile $zip; Expand-Archive -Path $zip -DestinationPath '%~dp0tools' -Force; Remove-Item $zip -Force"
        if exist "%~dp0tools\platform-tools\adb.exe" (
            set "ADB_EXE=%~dp0tools\platform-tools\adb.exe"
        ) else (
            echo [ERROR] Could not download ADB platform-tools.
            pause
            exit /b 1
        )
    )
)

set "JAVA_EXE="
if exist "%~dp0tools\jdk\bin\java.exe" (
    set "JAVA_EXE=%~dp0tools\jdk\bin\java.exe"
) else if defined JAVA_HOME if exist "%JAVA_HOME%\bin\java.exe" (
    set "JAVA_EXE=%JAVA_HOME%\bin\java.exe"
) else (
    where java >nul 2>&1
    if !errorlevel! equ 0 set "JAVA_EXE=java"
)

if defined JAVA_EXE (
    powershell -NoProfile -Command "$out = (& '!JAVA_EXE!' -version 2>&1) -join ' '; if ($out -match 'version \x22(\d+)') { if ([int]$Matches[1] -ge 21) { exit 0 } }; exit 1"
    if !errorlevel! neq 0 set "JAVA_EXE="
)

if not defined JAVA_EXE (
    echo [Notice] Java 21+ not found. Downloading portable Temurin Java 21...
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ErrorActionPreference = 'Stop'; $tools = '%~dp0tools'; $zip = Join-Path $tools 'jdk21.zip'; $tmp = Join-Path $tools '_jdk_tmp'; New-Item -ItemType Directory -Force -Path $tools | Out-Null; if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }; Invoke-WebRequest -Uri 'https://api.adoptium.net/v3/binary/latest/21/ga/windows/x64/jre/hotspot/normal/eclipse' -OutFile $zip; Expand-Archive -Path $zip -DestinationPath $tmp -Force; $dir = Get-ChildItem -Path $tmp -Directory | Select-Object -First 1; if (-not $dir) { throw 'Extracted JRE folder not found' }; $dest = Join-Path $tools 'jdk'; if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }; Move-Item -Path $dir.FullName -Destination $dest; Remove-Item $tmp -Recurse -Force; Remove-Item $zip -Force"
    if exist "%~dp0tools\jdk\bin\java.exe" (
        set "JAVA_EXE=%~dp0tools\jdk\bin\java.exe"
    ) else (
        echo [ERROR] Could not download Java 21 runtime.
        pause
        exit /b 1
    )
)

rem 2. TV IP Configuration
set "TV_IP="
if exist "tv_ip.txt" (
    set /p TV_IP=<tv_ip.txt
)
if "!TV_IP!"=="" (
    echo Enter your Android TV IP address [Settings - Network]:
    set /p "TV_IP=IP Address: "
    if not "!TV_IP!"=="" (
        echo !TV_IP!>tv_ip.txt
    )
)

if "!TV_IP!"=="" (
    echo [ERROR] No TV IP entered. Aborting.
    pause
    exit /b 1
)

:adb_connect_loop
echo [Target TV] !TV_IP!:5555
echo Connecting to TV via ADB before starting...
"!ADB_EXE!" connect !TV_IP!:5555
"!ADB_EXE!" devices | findstr /r /c:"!TV_IP!:5555[ 	]*device" >nul 2>&1
if !errorlevel! neq 0 (
    echo.
    echo [ERROR] Could not connect to !TV_IP!:5555.
    echo Make sure TV ADB Debugging is ON and check the IP address.
    set "NEW_IP="
    set /p "NEW_IP=Enter TV IP address (or press Enter to retry !TV_IP!): "
    if not "!NEW_IP!"=="" (
        set "TV_IP=!NEW_IP!"
        echo !TV_IP!>tv_ip.txt
    )
    echo.
    goto adb_connect_loop
)
echo [OK] Connected to !TV_IP!:5555
echo (To change TV IP, edit or delete 'tv_ip.txt')
echo.

rem 3. Step 1: Run Tests & Sync with GitHub
echo [1/5] Running tests and syncing patches with GitHub...
if exist "verify_tests.ps1" (
    powershell -NoProfile -ExecutionPolicy Bypass -File "verify_tests.ps1"
    if !errorlevel! neq 0 (
        echo [ERROR] Tests failed! Aborting push and TV deployment.
        pause
        exit /b !errorlevel!
    )
)

where git >nul 2>&1
if !errorlevel! neq 0 (
    echo [ERROR] Git is not installed or found in PATH.
    pause
    exit /b 1
)

git status -s
echo Pulling latest remote changes...
git pull origin main
if !errorlevel! neq 0 (
    echo [ERROR] Git pull failed! Aborting TV deployment.
    pause
    exit /b !errorlevel!
)

set "msg="
set /p "msg=Enter commit message (press Enter for default): "
if "!msg!"=="" set "msg=feat: update patches"

git add .
git diff --quiet --cached
if !errorlevel! neq 0 (
    git commit -m "!msg!"
    if !errorlevel! neq 0 (
        echo [ERROR] Git commit failed!
        pause
        exit /b 1
    )
)

echo Pushing changes to GitHub...
git push origin main
if !errorlevel! neq 0 (
    echo [ERROR] Push failed. Check your network or GitHub credentials.
    pause
    exit /b 1
)
echo [OK] Pushed to GitHub!

rem 3b. Step 2: Verify GitHub Actions Build
echo.
echo [2/5] Checking GitHub Actions build status...
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ErrorActionPreference = 'Stop'; $repo = 'BIRDY141/Birdy-Patches'; try { $u = (& git remote get-url origin 2>$null); if ($LASTEXITCODE -eq 0 -and $u -match 'github\.com[:/]([^/]+/[^/.]+?)(?:\.git)?$') { $repo = $Matches[1] } } catch {}; $sha = $null; try { $s = (& git rev-parse HEAD 2>$null); if ($LASTEXITCODE -eq 0 -and $s) { $sha = $s.Trim() } } catch {}; $tok = $env:GITHUB_TOKEN; if (-not $tok) { try { $c = (('protocol=https' + [char]10 + 'host=github.com' + [char]10) | & git credential fill 2>$null); foreach ($l in $c) { if ($l -match '^password=(.+)$') { $tok = $Matches[1]; break } } } catch {} }; $hdr = @{ 'User-Agent' = 'BirdyTV-Deploy'; 'Accept' = 'application/vnd.github+json' }; if ($tok) { $hdr['Authorization'] = ('Bearer ' + $tok) }; Write-Host ('[GitHub Build] Checking release.yml for ' + $repo + '...'); $run = $null; $waitEnd = (Get-Date).AddSeconds(40); if ($sha) { while ((Get-Date) -lt $waitEnd -and -not $run) { $r = Invoke-RestMethod -Uri ('https://api.github.com/repos/' + $repo + '/actions/workflows/release.yml/runs?head_sha=' + $sha + '&per_page=5') -Headers $hdr; if ($r.workflow_runs.Count -gt 0) { $run = $r.workflow_runs[0]; break }; Write-Host '[GitHub Build] Waiting for workflow run to register...'; Start-Sleep 10 } }; if (-not $run) { $r = Invoke-RestMethod -Uri ('https://api.github.com/repos/' + $repo + '/actions/workflows/release.yml/runs?branch=main&per_page=1') -Headers $hdr; if ($r.workflow_runs.Count -gt 0) { $run = $r.workflow_runs[0] } }; if (-not $run) { Write-Host '[ERROR] No GitHub Actions runs found.'; [Environment]::Exit(1) }; $end = (Get-Date).AddMinutes(15); while ($run.status -ne 'completed') { if ((Get-Date) -ge $end) { Write-Host ('[ERROR] Timed out waiting for build #' + $run.run_number); [Environment]::Exit(1) }; Write-Host ('[GitHub Build] Run #' + $run.run_number + ' is ' + $run.status + '... waiting 20s'); Start-Sleep 20; $run = Invoke-RestMethod -Uri $run.url -Headers $hdr }; if ($run.conclusion -eq 'success') { Write-Host ('[OK] GitHub build #' + $run.run_number + ' succeeded: ' + $run.html_url); [Environment]::Exit(0) } else { Write-Host ('[ERROR] GitHub build #' + $run.run_number + ' FAILED (' + $run.conclusion + '): ' + $run.html_url); [Environment]::Exit(1) }"
if errorlevel 1 (
    echo.
    echo [ERROR] GitHub build failed or could not be verified. Aborting TV deployment.
    pause
    exit /b 1
)

rem 4. Step 2: Locate or Download Morphe CLI, Patches Bundle & Base APK
set "MORPHE_CLI=morphe-cli.jar"
set "PATCHES_MPP=patches.mpp"
set "BASE_APK=youtube-tv.apk"
set "OUTPUT_APK=birdytv-patched.apk"

if not exist "%MORPHE_CLI%" (
    echo.
    echo [Notice] '%MORPHE_CLI%' not found.
    echo Downloading latest Morphe CLI...
    powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ErrorActionPreference = 'Stop'; $r = Invoke-RestMethod -Uri 'https://api.github.com/repos/MorpheApp/morphe-cli/releases/latest' -Headers @{ 'User-Agent' = 'BirdyTV-Deploy' }; $a = $r.assets | Where-Object { $_.name -like '*.jar' } | Select-Object -First 1; if (-not $a) { throw 'No jar asset found in latest release' }; Invoke-WebRequest -Uri $a.browser_download_url -OutFile '%MORPHE_CLI%'"
    if not exist "%MORPHE_CLI%" (
        echo [ERROR] Could not download morphe-cli.jar.
        echo Please download it manually and place 'morphe-cli.jar' in this folder.
        pause
        exit /b 1
    )
)

echo.
echo Downloading latest patch bundle from GitHub...
powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ErrorActionPreference = 'Stop'; $repo = 'BIRDY141/Birdy-Patches'; try { $u = (& git remote get-url origin 2>$null); if ($LASTEXITCODE -eq 0 -and $u -match 'github\.com[:/]([^/]+/[^/.]+?)(?:\.git)?$') { $repo = $Matches[1] } } catch {}; $url = $null; try { $url = (Invoke-RestMethod -Uri ('https://raw.githubusercontent.com/' + $repo + '/main/patches-bundle.json')).download_url } catch {}; if (-not $url) { $url = (Get-Content '%~dp0patches-bundle.json' | ConvertFrom-Json).download_url }; for ($i = 1; $i -le 3; $i++) { try { Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile '%PATCHES_MPP%'; break } catch { if ($i -eq 3) { throw }; Write-Host ('[Retry ' + $i + '/3] Download failed, retrying in 3s...'); Start-Sleep 3 } }"
if !errorlevel! neq 0 (
    echo [ERROR] Could not download patches.mpp.
    pause
    exit /b 1
)

if not exist "%BASE_APK%" (
    echo.
    echo ======================================================================
    echo  [ACTION REQUIRED] Stock YouTube TV APK not found!
    echo ======================================================================
    echo  Please place your stock clean YouTube TV apk as:
    echo  '%cd%\%BASE_APK%'
    echo ======================================================================
    echo.
    pause
    exit /b 1
)

rem 5. Step 3: Patch APK using Morphe CLI
echo.
echo [3/5] Patching YouTube TV using Morphe CLI...
if not defined JAVA_EXE (
    echo [ERROR] Java runtime not found!
    echo Please install Java 21+ or keep portable Java in tools\jdk\.
    pause
    exit /b 1
)

echo Using Java: "!JAVA_EXE!"
"!JAVA_EXE!" -jar "%MORPHE_CLI%" patch --patches "%PATCHES_MPP%" -o "%OUTPUT_APK%" "%BASE_APK%"
if %errorlevel% neq 0 (
    echo [ERROR] Morphe CLI patching failed!
    pause
    exit /b %errorlevel%
)

rem 6. Step 4: ADB Connect and Install
echo.
echo [4/5] Connecting to TV at !TV_IP!:5555...
"!ADB_EXE!" connect !TV_IP!:5555

echo.
echo [5/5] Installing %OUTPUT_APK% on your TV...
"!ADB_EXE!" -s !TV_IP!:5555 install -r "%OUTPUT_APK%"
set "ADB_ERR=!errorlevel!"
if !ADB_ERR! neq 0 (
    echo [Notice] Update failed (signature mismatch with previously installed version).
    echo Reinstalling fresh copy...
    "!ADB_EXE!" -s !TV_IP!:5555 uninstall app.tvpatches.android.youtube.tv >nul 2>&1
    "!ADB_EXE!" -s !TV_IP!:5555 install "%OUTPUT_APK%"
    set "ADB_ERR=!errorlevel!"
)

if !ADB_ERR! equ 0 (
    echo.
    echo ======================================================================
    echo  SUCCESS: BirdyTV installed on your TV!
    echo ======================================================================
    echo.
    echo Launching BirdyTV on TV screen...
    "!ADB_EXE!" -s !TV_IP!:5555 shell monkey -p app.tvpatches.android.youtube.tv 1 >nul 2>&1
) else (
    echo.
    echo [ERROR] ADB installation failed.
    echo Make sure:
    echo 1. Your TV is on the same Wi-Fi network.
    echo 2. Network/ADB Debugging is ON in TV Developer Options.
    echo 3. You accepted the 'Allow Debugging' prompt on your TV screen.
)

pause
