param([string]$AndroidSdk = "$env:LOCALAPPDATA\Android\Sdk", [string]$Jdk = 'C:\Program Files\Android\Android Studio\jbr')
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$env:JAVA_HOME = $Jdk
& .\BuildThemes.ps1 -AndroidSdk $AndroidSdk -Jdk $Jdk
if ($LASTEXITCODE) { throw 'Theme patch build failed.' }
$apk = 'dist\waze-5.24.5.0-themes-moods-badges-arm64.apk'
& "$Jdk\bin\java.exe" -Xmx1536m -jar tools\morphe-desktop.jar patch --bytecode-mode STRIP_SAFE -p dist\waze-theme-selector-1.12.0.mpp -o $apk -r dist\patch-result-themes-arm64.json downloads\waze-5.24.5.0-arm64.apkm
if ($LASTEXITCODE) { throw 'Combined patching failed.' }
& "$AndroidSdk\build-tools\36.0.0\zipalign.exe" -f -P 16 4 $apk build\themes-aligned.apk
if ($LASTEXITCODE) { throw 'APK alignment failed.' }
python ci/alignment.py build/themes-aligned.apk
if ($LASTEXITCODE) { throw 'Native alignment metadata update failed.' }
& "$Jdk\bin\javac.exe" -cp tools\morphe-desktop.jar tools\SignAligned.java
if ($LASTEXITCODE) { throw 'Signing helper compilation failed.' }
& "$Jdk\bin\java.exe" -cp 'tools;tools/morphe-desktop.jar' SignAligned build\themes-aligned.apk $apk
if ($LASTEXITCODE) { throw 'APK signing failed.' }
& "$AndroidSdk\build-tools\36.0.0\zipalign.exe" -c -P 16 4 $apk
if ($LASTEXITCODE) { throw 'APK alignment verification failed.' }
& "$AndroidSdk\build-tools\36.0.0\apksigner.bat" verify $apk
if ($LASTEXITCODE) { throw 'APK signature verification failed.' }
