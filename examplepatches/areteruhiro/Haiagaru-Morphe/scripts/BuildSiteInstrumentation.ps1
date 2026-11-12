param(
    [string]$Java='C:/Users/narum/jdk-21.0.9+10',
    [string]$Sdk='C:/Users/narum/AppData/Local/Android/Sdk',
    [string]$Bundle='build/site-native-roots.mpp',
    [string]$Key='C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore',
    [string]$Cli='C:/Users/narum/morphe-chmate-local/tools/morphe-cli-1.16.0-all.jar',
    [ValidateSet('native','gateway')][string]$Suite='native'
)
$ErrorActionPreference='Stop'
$env:JAVA_HOME=$Java
$native=$Suite -eq 'native'
$dir=if($native){'build/site-native-inst'}else{'build/site-boards-inst'}
$class=if($native){'SiteNativeBoardsInstrumentation'}else{'SiteBoardGatewayInstrumentation'}
$stem=if($native){'nativeboards'}else{'sitegateway'}
New-Item -ItemType Directory -Force "$dir/classes","$dir/dex" | Out-Null
& "$Java/bin/javac.exe" -J-Xmx128m -encoding UTF-8 -source 8 -target 8 -classpath "$Sdk/platforms/android-36/android.jar" -d "$dir/classes" "scripts/$class.java"
if($LASTEXITCODE){throw 'Instrumentation compilation failed'}
& "$Java/bin/jar.exe" cf "$dir/classes.jar" -C "$dir/classes" .
& "$Sdk/build-tools/36.0.0/d8.bat" --lib "$Sdk/platforms/android-36/android.jar" --output "$dir/dex" "$dir/classes.jar"
if($LASTEXITCODE){throw 'Instrumentation dex conversion failed'}
foreach($version in @(191,226,242)){
    $manifest='<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.haiagaru.tests.'+$stem+$version+'" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="26" android:targetSdkVersion="34"/><application android:label="Haiagaru isolated site tests"/><instrumentation android:name="app.haiagaru.tests.sites.'+$class+'" android:targetPackage="jp.co.airfront.android.a2chMate.haiagaru.reporter'+$version+'"/></manifest>'
    [IO.File]::WriteAllText((Join-Path $PWD "$dir/AndroidManifest.xml"),$manifest)
    $assets=if($native){@()}else{@('-A',"$dir/assets")}
    & "$Sdk/build-tools/36.0.0/aapt2.exe" link -I "$Sdk/platforms/android-36/android.jar" --manifest "$dir/AndroidManifest.xml" @assets -o "$dir/unsigned$version.apk"
    if($LASTEXITCODE){throw 'Instrumentation packaging failed'}
    Push-Location "$dir/dex"
    try { & "$Java/bin/jar.exe" uf "../unsigned$version.apk" classes.dex } finally { Pop-Location }
    & "$Java/bin/java.exe" -Xms16m -Xmx192m -XX:+UseSerialGC -jar $Cli patch --exclusive -p $Bundle --keystore $Key -o "$dir/tests$version.apk" "$dir/unsigned$version.apk" *> "$dir/sign$version.log"
    if($LASTEXITCODE){throw "Instrumentation signing failed: $version"}
    Write-Output "Prepared $Suite instrumentation $version"
}
