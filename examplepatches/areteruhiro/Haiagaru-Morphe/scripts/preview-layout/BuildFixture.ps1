param(
    [Parameter(Mandatory=$true)][string]$Serial,
    [string]$Sdk=$env:ANDROID_HOME,
    [string]$Java=$env:JAVA_HOME,
    [string]$Baseline='1.13.0-dev.2'
)
$ErrorActionPreference='Stop'
$android=Join-Path $Sdk 'platforms/android-36/android.jar'
$source='extensions/chmate/src/main/java/app/morphe/extension/chmate'
$before='build/preview-layout-before'
New-Item -ItemType Directory -Force -Path $before | Out-Null
foreach($file in @('XPostPreview.java','SiteCards.java')){
    $content=& git show "${Baseline}:$source/$file"
    if($LASTEXITCODE -ne 0){throw "Cannot read baseline $Baseline"}
    Set-Content -LiteralPath "$before/$file" -Value $content -Encoding utf8
}
foreach($mode in @('baseline','fixed')){
    $output="build/preview-layout-$mode-current"
    New-Item -ItemType Directory -Force -Path $output | Out-Null
    $selected=if($mode -eq 'baseline'){$before}else{$source}
    & "$Java/bin/javac.exe" -encoding UTF-8 -cp $android -d $output `
        scripts/preview-layout/FixtureTypes.java scripts/preview-layout/LayoutRestoreTest.java `
        scripts/x-post-preview/PerformanceTest.java scripts/x-post-preview/RetryTest.java `
        "$selected/XPostPreview.java" "$selected/SiteCards.java" `
        "$source/XPostPreviewPosition.java" "$source/XPostPreviewCard.java" "$source/SiteCardSpan.java" "$source/PreviewUrls.java"
    if($LASTEXITCODE -ne 0){throw "Compilation failed: $mode"}
    & "$Java/bin/jar.exe" cf "$output/fixture.jar" -C $output app
    if($LASTEXITCODE -ne 0){throw "Packaging failed: $mode"}
    & "$Java/bin/java.exe" -cp "$Sdk/build-tools/36.0.0/lib/d8.jar" com.android.tools.r8.D8 --min-api 21 --lib $android --output $output "$output/fixture.jar"
    if($LASTEXITCODE -ne 0){throw "DEX compilation failed: $mode"}
    $target="/data/local/tmp/haiagaru-preview-layout-$mode-v2.dex"
    & "$Sdk/platform-tools/adb.exe" -s $Serial shell "if [ -f $target ]; then chmod 644 $target; fi"
    & "$Sdk/platform-tools/adb.exe" -s $Serial push "$output/classes.dex" $target
    if($LASTEXITCODE -ne 0){throw "Transfer failed: $mode"}
    & "$Sdk/platform-tools/adb.exe" -s $Serial shell chmod 444 $target
    if($LASTEXITCODE -ne 0){throw "Read-only marking failed: $mode"}
}
