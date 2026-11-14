param(
    [string]$Sdk='D:/Android/Sdk',
    [string]$Bundle='patches/build/libs/patches-1.27.5.mpp',
    [string]$Key='C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore',
    [string]$Cli='C:/Users/narum/morphe-chmate-local/tools/morphe-cli-1.16.0-all.jar'
)
$ErrorActionPreference='Stop'
$testDir='build/local-image-inst'
New-Item -ItemType Directory -Force "$testDir/classes","$testDir/dex" | Out-Null
javac -encoding UTF-8 -source 8 -target 8 -cp "$Sdk/platforms/android-36/android.jar" -d "$testDir/classes" scripts/LocalImageArchiveInstrumentation.java *> "$testDir/compile.log"
if($LASTEXITCODE){throw 'Instrumentation compilation failed'}
jar cf "$testDir/classes.jar" -C "$testDir/classes" .
& "$Sdk/build-tools/36.0.0/d8.bat" --lib "$Sdk/platforms/android-36/android.jar" --output "$testDir/dex" "$testDir/classes.jar"
if($LASTEXITCODE){throw 'Instrumentation DEX failed'}
$manifest='<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.haiagaru.tests.localimages" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="26" android:targetSdkVersion="34"/><application android:label="Local image regression"><provider android:name="app.haiagaru.tests.localimages.LocalImageArchiveInstrumentation$ImagesProvider" android:authorities="app.haiagaru.tests.localimages.documents" android:exported="true" android:grantUriPermissions="true"/></application><instrumentation android:name="app.haiagaru.tests.localimages.LocalImageArchiveInstrumentation" android:targetPackage="jp.co.airfront.android.a2chMate.haiagaru.sitefix242"/></manifest>'
[IO.File]::WriteAllText((Join-Path $PWD "$testDir/AndroidManifest.xml"),$manifest)
& "$Sdk/build-tools/36.0.0/aapt2.exe" link -I "$Sdk/platforms/android-36/android.jar" --manifest "$testDir/AndroidManifest.xml" -o "$testDir/unsigned.apk"
if($LASTEXITCODE){throw 'Instrumentation resources failed'}
jar uf "$testDir/unsigned.apk" -C "$testDir/dex" classes.dex
java -Xmx192m -jar $Cli patch --exclusive -p $Bundle --keystore $Key -o "$testDir/tests.apk" "$testDir/unsigned.apk" *> "$testDir/sign.log"
if($LASTEXITCODE){throw 'Instrumentation signing failed'}
