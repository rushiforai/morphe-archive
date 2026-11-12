param([string]$Bundle='build/canonical-backup-ng.mpp')
$ErrorActionPreference='Stop'
$java='C:/Users/narum/jdk-21.0.9+10/bin'
$sdk='C:/Users/narum/AppData/Local/Android/Sdk'
$cli='C:/Users/narum/morphe-chmate-local/tools/morphe-cli-1.16.0-all.jar'
$dir='build/canonical-backup-ng-inst'
$env:JAVA_HOME='C:/Users/narum/jdk-21.0.9+10'
$env:JAVA_TOOL_OPTIONS='-Xms16m -Xmx192m -XX:+UseSerialGC -XX:ReservedCodeCacheSize=48m'
New-Item -ItemType Directory -Force "$dir/classes","$dir/dex" | Out-Null
$assets=@()
& "$java/javac.exe" -encoding UTF-8 -source 8 -target 8 -cp "$sdk/platforms/android-36/android.jar" -d "$dir/classes" scripts/CanonicalBackupNgInstrumentation.java
if($LASTEXITCODE){throw 'Test compilation failed'}
& "$java/jar.exe" cf "$dir/classes.jar" -C "$dir/classes" .
& "$sdk/build-tools/36.0.0/d8.bat" --lib "$sdk/platforms/android-36/android.jar" --output "$dir/dex" "$dir/classes.jar"
if($LASTEXITCODE){throw 'Test DEX conversion failed'}
foreach($v in @(191,226,242)){
 $manifest='<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.haiagaru.tests.backupng'+$v+'" android:versionCode="1" android:versionName="1"><uses-sdk android:minSdkVersion="26" android:targetSdkVersion="34"/><application android:label="Haiagaru isolated regressions"/><instrumentation android:name="app.haiagaru.tests.backupng.CanonicalBackupNgInstrumentation" android:targetPackage="jp.co.airfront.android.a2chMate.haiagaru.reporter'+$v+'"/></manifest>'
 [IO.File]::WriteAllText((Join-Path $PWD "$dir/AndroidManifest.xml"),$manifest)
 & "$sdk/build-tools/36.0.0/aapt2.exe" link -I "$sdk/platforms/android-36/android.jar" --manifest "$dir/AndroidManifest.xml" @assets -o "$dir/unsigned$v.apk"
 if($LASTEXITCODE){throw 'Test packaging failed'}
 Push-Location "$dir/dex";try{& "$java/jar.exe" uf "../unsigned$v.apk" classes.dex}finally{Pop-Location}
 & "$java/java.exe" -jar $cli patch --exclusive -p $Bundle --keystore 'C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore' -o "$dir/tests$v.apk" "$dir/unsigned$v.apk" *> "$dir/sign$v.log"
 if($LASTEXITCODE){throw "Test signing failed $v"}
 Write-Output "Prepared canonical backup/NG tests $v"
}

