# Build the standalone add-on from the same Android classes as the main project.
param([string] $LocalMaven = "$PSScriptRoot/../build/local-m2")
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
$repo = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$addon = Join-Path $repo 'bilibili-addon'
if (-not $env:JAVA_HOME -or -not $env:ANDROID_HOME) { throw 'Set JAVA_HOME and ANDROID_HOME first.' }
# The settings plugin evaluates these as fallbacks even when -Pgpr.* is given (Gradle 9 rejects null).
if (-not $env:GITHUB_ACTOR) { $env:GITHUB_ACTOR = 'local' }
if (-not $env:GITHUB_TOKEN) { $env:GITHUB_TOKEN = 'local' }
$d8 = Join-Path $env:ANDROID_HOME 'build-tools/36.1.0/d8.bat'
$androidJar = Join-Path $env:ANDROID_HOME 'platforms/android-36/android.jar'
if (-not (Test-Path -LiteralPath $d8) -or -not (Test-Path -LiteralPath $androidJar)) { throw 'Android SDK platform 36 and build-tools 36.1.0 are required.' }
$gradle = Join-Path $repo 'gradlew.bat'
$mavenArg = '-Dmaven.repo.local=' + ([System.IO.Path]::GetFullPath($LocalMaven) -replace '\\','/')
$common = @($mavenArg, '-Pgpr.user=local', '-Pgpr.key=local', '--no-daemon', '--offline', '--console', 'plain')
Push-Location $repo
try {
    & $gradle ':extensions:youtube:testDebugUnitTest' @common
    if ($LASTEXITCODE -ne 0) { throw 'Extension tests failed.' }
    $classes = Join-Path $repo 'extensions/youtube/build/intermediates/javac/debug/compileDebugJavaWithJavac/classes'
    $package = Join-Path $classes 'app/morphe/extension/youtube/bilibilidanmaku'
    $staging = Join-Path $addon 'build/standalone-classes'
    $target = Join-Path $staging 'app/morphe/extension/youtube/bilibilidanmaku'
    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Get-ChildItem -LiteralPath $package -Filter '*.class' | Where-Object { $_.Name -notlike 'BilibiliDanmakuToggleButton*' } | Copy-Item -Destination $target -Force
    $jar = Join-Path $addon 'build/bilibili-extension.jar'
    & (Join-Path $env:JAVA_HOME 'bin/jar.exe') cf $jar -C $staging .
    if ($LASTEXITCODE -ne 0) { throw 'Extension jar creation failed.' }
    $dex = Join-Path $addon 'build/dex'
    New-Item -ItemType Directory -Path $dex -Force | Out-Null
    & $d8 --min-api 26 --lib $androidJar --output $dex $jar
    if ($LASTEXITCODE -ne 0) { throw 'Extension DEX compilation failed.' }
    $resources = Join-Path $addon 'build/generated/resources/extensions'
    New-Item -ItemType Directory -Path $resources -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $dex 'classes.dex') -Destination (Join-Path $resources 'bilibili-danmaku.mpe') -Force
    $env:MORPHE_SIGNING_KEY = (Get-Content -LiteralPath (Join-Path $repo 'morphe-signing.key') -Raw).Trim()
    & $gradle -p $addon ':patches:buildAndroid' @common
    if ($LASTEXITCODE -ne 0) { throw 'Standalone bundle build failed.' }
} finally {
    Remove-Item Env:MORPHE_SIGNING_KEY -ErrorAction SilentlyContinue
    Pop-Location
}
