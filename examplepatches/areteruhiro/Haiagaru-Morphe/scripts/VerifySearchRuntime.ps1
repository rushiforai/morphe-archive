param([string]$Serial='emulator-5554')
$ErrorActionPreference='Stop'
$sdk='C:/Users/narum/AppData/Local/Android/Sdk'
$java='C:/Users/narum/jdk-21.0.9+10/bin'
$out=Join-Path ([IO.Path]::GetTempPath()) ('haiagaru-search-io-'+[guid]::NewGuid().ToString('N'))
$null=New-Item -ItemType Directory -Path $out
$src='extensions/chmate/src/main/java/app/morphe/extension/chmate'
$android="$sdk/platforms/android-36/android.jar"
& "$java/javac.exe" -encoding UTF-8 -cp $android -d $out scripts/search-runtime/WacchoiStorageLimits.java scripts/search-runtime/SearchIoRegression.java "$src/WacchoiPageCache.java" "$src/SearchRequestPacing.java"
if($LASTEXITCODE -ne 0){throw 'Search fixture compilation failed'}
& "$java/jar.exe" cf "$out/fixture.jar" -C $out app
& "$java/java.exe" -cp "$sdk/build-tools/36.0.0/lib/d8.jar" com.android.tools.r8.D8 --min-api 21 --lib $android --output $out "$out/fixture.jar"
if($LASTEXITCODE -ne 0){throw 'Search fixture DEX failed'}
$remote='/data/local/tmp/haiagaru-search-io-'+[guid]::NewGuid().ToString('N')
& "$sdk/platform-tools/adb.exe" -s $Serial shell mkdir $remote
& "$sdk/platform-tools/adb.exe" -s $Serial push "$out/classes.dex" "$remote/classes.dex"
if($LASTEXITCODE -ne 0){throw 'Search fixture transfer failed'}
& "$sdk/platform-tools/adb.exe" -s $Serial shell "CLASSPATH=$remote/classes.dex app_process /system/bin app.morphe.extension.chmate.SearchIoRegression $remote"
if($LASTEXITCODE -ne 0){throw 'Android search IO regression failed'}
Write-Output "Fixture retained: $out ; $remote (test files only)"
