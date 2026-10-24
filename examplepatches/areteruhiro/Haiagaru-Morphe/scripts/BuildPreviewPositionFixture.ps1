param([string]$Serial='emulator-5554')
$ErrorActionPreference='Stop'
$sdk='C:/Users/narum/AppData/Local/Android/Sdk'
$java='C:/Users/narum/jdk-21.0.9+10/bin'
$out=Join-Path ([IO.Path]::GetTempPath()) ('haiagaru-position-'+[guid]::NewGuid().ToString('N'))
$null=New-Item -ItemType Directory -Path $out
$android="$sdk/platforms/android-36/android.jar"
& "$java/javac.exe" -encoding UTF-8 -cp $android -d $out scripts/x-post-preview/PositionTest.java extensions/chmate/src/main/java/app/morphe/extension/chmate/XPostPreviewPosition.java
if($LASTEXITCODE -ne 0){throw 'Position fixture compilation failed'}
& "$java/jar.exe" cf "$out/fixture.jar" -C $out app
& "$java/java.exe" -cp "$sdk/build-tools/36.0.0/lib/d8.jar" com.android.tools.r8.D8 --min-api 21 --lib $android --output $out "$out/fixture.jar"
if($LASTEXITCODE -ne 0){throw 'Position DEX failed'}
& "$sdk/platform-tools/adb.exe" -s $Serial push "$out/classes.dex" /data/local/tmp/haiagaru-position-fixture.dex
if($LASTEXITCODE -ne 0){throw 'Position transfer failed'}
& "$sdk/platform-tools/adb.exe" -s $Serial shell chmod 444 /data/local/tmp/haiagaru-position-fixture.dex
Write-Output "Fixture retained: $out"
