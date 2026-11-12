param(
 [Parameter(Mandatory=$true)][string]$Serial,
 [string]$Source='extensions/chmate/src/main/java/app/morphe/extension/chmate/VideoThumbnailRetry.java',
 [switch]$Baseline
)
$ErrorActionPreference='Stop'
if($Serial -notlike 'emulator-*'){throw 'This synthetic regression runs on an emulator only'}
$jdk='C:/Users/narum/jdk-21.0.9+10/bin'
$sdk='C:/Users/narum/AppData/Local/Android/Sdk'
$dir='build/thumbnail-layout-regression'
New-Item -ItemType Directory -Force "$dir/classes","$dir/dex" | Out-Null
& "$jdk/javac.exe" -J-Xmx256m -encoding UTF-8 -source 8 -target 8 -classpath "$sdk/platforms/android-36/android.jar" -d "$dir/classes" scripts/layout-regression/LayoutHarness.java scripts/layout-regression/Dependencies.java scripts/LayoutMutationInstrumentation.java $Source
if($LASTEXITCODE){throw 'javac failed'}
& "$sdk/build-tools/36.0.0/aapt2.exe" link -I "$sdk/platforms/android-36/android.jar" --manifest scripts/layout-regression/AndroidManifest.xml -o "$dir/unsigned.apk"
if($LASTEXITCODE){throw 'aapt failed'}
& "$jdk/jar.exe" cf "$dir/classes.jar" -C "$dir/classes" .
& "$sdk/build-tools/36.0.0/d8.bat" --min-api 26 --lib "$sdk/platforms/android-36/android.jar" --output "$dir/dex" "$dir/classes.jar"
if($LASTEXITCODE){throw 'd8 failed'}
& "$jdk/jar.exe" uf "$dir/unsigned.apk" -C "$dir/dex" classes.dex
& "$sdk/build-tools/36.0.0/apksigner.bat" -JXmx128m sign --ks 'C:/Users/narum/.android/debug.keystore' --ks-pass pass:android --out "$dir/test.apk" "$dir/unsigned.apk"
if($LASTEXITCODE){throw 'test signing failed'}
& "$sdk/platform-tools/adb.exe" -s $Serial install -r "$dir/test.apk"
if($LASTEXITCODE){throw 'test install failed; do not uninstall'}
$extra=if($Baseline){@('-e','baseline','true')}else{@()}
$result=& "$sdk/platform-tools/adb.exe" -s $Serial shell am instrument -w @extra app.haiagaru.tests.layoutmutation/app.morphe.extension.chmate.LayoutMutationInstrumentation
$result | Tee-Object "$dir/runtime.log"
if(!($result -match 'INSTRUMENTATION_RESULT: result=PASS')){throw 'layout regression failed'}
