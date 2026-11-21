param([string]$Serial = 'emulator-5554',
      [string]$Sdk = 'C:/Users/narum/AppData/Local/Android/Sdk',
      [string]$Java = 'C:/Users/narum/jdk-21.0.9+10')
$ErrorActionPreference = 'Stop'
$output = Join-Path ([IO.Path]::GetTempPath()) ('haiagaru-x-preview-' + [guid]::NewGuid().ToString('N'))
$null = New-Item -ItemType Directory -Path $output
$android = Join-Path $Sdk 'platforms/android-36/android.jar'
$compiled = 'extensions/chmate/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes'
$kotlinCompiled = 'extensions/chmate/build/intermediates/built_in_kotlinc/release/compileReleaseKotlin/classes'
& "$Java/bin/javac.exe" -encoding UTF-8 -cp "$android;$compiled;$kotlinCompiled" -d $output `
    scripts/x-post-preview/Haiagaru.java scripts/x-post-preview/XPostMetadata.java `
    scripts/x-post-preview/PreviewTest.java `
    extensions/chmate/src/main/java/app/morphe/extension/chmate/XPostLength.java `
    extensions/chmate/src/main/java/app/morphe/extension/chmate/XPostPreview.java `
    extensions/chmate/src/main/java/app/morphe/extension/chmate/XPostPreviewCard.java
if ($LASTEXITCODE -ne 0) { throw 'Fixture compilation failed' }
$packagePath = 'app/morphe/extension/chmate'
Get-ChildItem -LiteralPath "$compiled/$packagePath" -Filter 'XMediaAttachments*.class' | Copy-Item -Destination "$output/$packagePath"
Copy-Item -LiteralPath "$compiled/$packagePath/DirectVideoUrls.class" -Destination "$output/$packagePath"
& "$Java/bin/jar.exe" cf "$output/fixture.jar" -C $output app
if ($LASTEXITCODE -ne 0) { throw 'Fixture packaging failed' }
& "$Java/bin/java.exe" -cp "$Sdk/build-tools/36.0.0/lib/d8.jar" com.android.tools.r8.D8 `
    --min-api 21 --lib $android --output $output "$output/fixture.jar"
if ($LASTEXITCODE -ne 0) { throw 'DEX compilation failed' }
& "$Sdk/platform-tools/adb.exe" -s $Serial push "$output/classes.dex" /data/local/tmp/haiagaru-x-preview-test.dex
if ($LASTEXITCODE -ne 0) { throw 'Fixture transfer failed' }
& "$Sdk/platform-tools/adb.exe" -s $Serial shell 'CLASSPATH=/data/local/tmp/haiagaru-x-preview-test.dex app_process /system/bin app.morphe.extension.chmate.PreviewTest'
if ($LASTEXITCODE -ne 0) { throw 'Android preview verification failed' }
Write-Output "Fixture build retained at $output"
