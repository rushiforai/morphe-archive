# Compiles the Java extensions of both apps into raw DEX files.
#
# KICK (Android TV):
#   extension\dex\kick-seyttings\classes.dex    - base SEYTTINGS module
#   extension\dex\kick-emotes\classes.dex       - EMOTES feature module
#   extension\dex\kick-chatsize\classes.dex     - CHAT SIZE feature module
#   extension\dex\kick-chattext\classes.dex     - CHAT TEXT SIZE feature module
#   extension\dex\kick-chatexpand\classes.dex   - EXPAND CHAT feature module
#   extension\dex\kick-hidepinned\classes.dex   - HIDE PINNED feature module
#   extension\dex\kick-maturewarning\classes.dex - SKIP 18+ WARNING feature module
#
# Twitch (Android TV):
#   extension\dex\twitch-seyttings\classes.dex  - base SEYTTINGS module
#   extension\dex\twitch-emotes\classes.dex     - EMOTES feature module
#   extension\dex\twitch-expandchat\classes.dex - EXPAND CHAT feature module
#   extension\dex\twitch-adblock\classes.dex    - AD BLOCK feature module
#   extension\dex\twitch-amoled\classes.dex     - AMOLED feature module
#   extension\dex\twitch-maturewarning\classes.dex - SKIP 18+ WARNING feature module
#   extension\dex\twitch-hidepinned\classes.dex - HIDE PINNED feature module
#
# The AD BLOCK, AMOLED, SKIP 18+ WARNING and HIDE PINNED scripts live in
# extension\js. This script turns them into AdBlockScript.java,
# AmoledScript.java, MatureWarningScript.java and PinnedChatScript.java (String
# arrays) before compiling, so the Java sources stay readable and the DEX
# carries the script.
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

$sdkRoot = Get-AndroidSdkRoot
$androidJar = Get-AndroidJar $sdkRoot
$buildTools = Get-BuildToolsDir $sdkRoot
$d8 = Join-Path $buildTools 'd8.bat'
$kotlinStdlib = Get-KotlinStdlib

if (-not (Test-Path $d8)) {
    throw "d8.bat not found in $buildTools."
}

$srcRoot = Join-Path $script:RepoRoot 'extension\src'
$classesRoot = Join-Path $script:RepoRoot 'extension\classes'
$dexRoot = Join-Path $script:RepoRoot 'extension\dex'
$generatedRoot = Join-Path $script:RepoRoot 'extension\generated'

Remove-Item $classesRoot, $dexRoot, $generatedRoot -Recurse -Force -ErrorAction SilentlyContinue

function Get-Sources([string[]]$directories, [string]$label) {
    $files = @()
    foreach ($directory in $directories) {
        if (-not (Test-Path $directory)) {
            throw "$label source directory not found: $directory"
        }
        $files += Get-ChildItem $directory -Recurse -Filter '*.java' | ForEach-Object { $_.FullName }
    }
    if (-not $files) {
        throw "No $label Java sources found in $($directories -join ', ')."
    }
    return $files
}

# Turns the readable JavaScript into a Java String array. Each line becomes one
# literal, so no class file hits the 64 KB constant limit.
function New-JsSource {
    param(
        [string]$JsPath,
        [string]$OutDir,
        [string]$Package,
        [string]$ClassName
    )

    if (-not (Test-Path $JsPath)) {
        throw "JavaScript source not found: $JsPath"
    }

    $lines = [System.IO.File]::ReadAllLines($JsPath, [System.Text.Encoding]::UTF8)
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("package $Package;")
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('/** Generated from extension/js/' + (Split-Path $JsPath -Leaf) + ' by build-extension.ps1. Do not edit. */')
    [void]$sb.AppendLine("final class $ClassName {")
    [void]$sb.AppendLine('    private static final String[] LINES = {')
    foreach ($line in $lines) {
        $escaped = $line.Replace('\', '\\').Replace('"', '\"').Replace("`t", '\t')
        [void]$sb.AppendLine('        "' + $escaped + '",')
    }
    [void]$sb.AppendLine('    };')
    [void]$sb.AppendLine()
    [void]$sb.AppendLine("    private $ClassName() {")
    [void]$sb.AppendLine('    }')
    [void]$sb.AppendLine()
    [void]$sb.AppendLine('    static String get() {')
    [void]$sb.AppendLine('        return String.join("\n", LINES);')
    [void]$sb.AppendLine('    }')
    [void]$sb.AppendLine('}')

    $packageDir = Join-Path $OutDir ($Package -replace '\.', '\')
    New-Item $packageDir -ItemType Directory -Force | Out-Null
    $outFile = Join-Path $packageDir ($ClassName + '.java')
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($outFile, $sb.ToString(), $utf8)
    Write-Host "$ClassName generated from $JsPath ($($lines.Count) lines)"
    return $outFile
}

function New-Dex([string]$outDir, [string[]]$classFiles, [string]$classpath, [string]$label) {
    $arguments = @('--min-api', '26', '--lib', $androidJar, '--output', $outDir)
    if ($classpath) {
        $arguments += @('--classpath', $classpath)
    }
    $arguments += $classFiles

    & $d8 @arguments
    if ($LASTEXITCODE -ne 0) {
        throw "d8 failed on the $label extension with exit code $LASTEXITCODE."
    }

    $dex = Join-Path $outDir 'classes.dex'
    if (-not (Test-Path $dex)) {
        throw "d8 did not produce $dex."
    }
    Write-Host "$label extension DEX: $dex ($((Get-Item $dex).Length) bytes)"
    return $dex
}

function Build-Module {
    param(
        [string]$Label,
        [string[]]$SourceDir,
        [string]$ClassesDir,
        [string]$DexDir,
        [string]$BaseClasses
    )

    New-Item $ClassesDir, $DexDir -ItemType Directory -Force | Out-Null
    $sources = Get-Sources $SourceDir $Label

    Write-Host "Compiling $Label extension ($($sources.Count) files)..."
    $classpath = "$androidJar;$kotlinStdlib"
    if ($BaseClasses) {
        $classpath += ";$BaseClasses"
    }
    & javac --release 8 -encoding UTF-8 -classpath $classpath -d $ClassesDir $sources
    if ($LASTEXITCODE -ne 0) {
        throw "javac failed on the $Label extension with exit code $LASTEXITCODE."
    }

    $classFiles = Get-ChildItem $ClassesDir -Recurse -Filter '*.class' | ForEach-Object { $_.FullName }
    $null = New-Dex -outDir $DexDir -classFiles $classFiles -classpath $BaseClasses -label $Label
}

$kickBaseSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\base'
$kickEmoteSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\emotes'
$kickChatSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\chat'
$kickChatTextSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\chattext'
$kickChatExpandSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\chatexpand'
$kickHidePinnedSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\hidepinned'
$kickMatureWarningSrc = Join-Path $srcRoot 'app\morphe\extension\kicktv\maturewarning'

$twitchBaseSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\base'
$twitchEmoteSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\emotes'
$twitchExpandChatSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\expandchat'
$twitchAdBlockSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\adblock'
$twitchAmoledSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\amoled'
$twitchMatureWarningSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\maturewarning'
$twitchHidePinnedSrc = Join-Path $srcRoot 'app\morphe\extension\twitch\hidepinned'

$adBlockGeneratedRoot = Join-Path $generatedRoot 'adblock'
$amoledGeneratedRoot = Join-Path $generatedRoot 'amoled'
$matureWarningGeneratedRoot = Join-Path $generatedRoot 'maturewarning'
$hidePinnedGeneratedRoot = Join-Path $generatedRoot 'hidepinned'

$adBlockScript = New-JsSource `
    -JsPath (Join-Path $script:RepoRoot 'extension\js\twitch-adblock.js') `
    -OutDir $adBlockGeneratedRoot `
    -Package 'app.morphe.extension.twitch.adblock' `
    -ClassName 'AdBlockScript'
if (-not (Test-Path $adBlockScript)) {
    throw "Failed to generate $adBlockScript."
}

$amoledScript = New-JsSource `
    -JsPath (Join-Path $script:RepoRoot 'extension\js\twitch-amoled.js') `
    -OutDir $amoledGeneratedRoot `
    -Package 'app.morphe.extension.twitch.amoled' `
    -ClassName 'AmoledScript'
if (-not (Test-Path $amoledScript)) {
    throw "Failed to generate $amoledScript."
}

$matureWarningScript = New-JsSource `
    -JsPath (Join-Path $script:RepoRoot 'extension\js\twitch-maturewarning.js') `
    -OutDir $matureWarningGeneratedRoot `
    -Package 'app.morphe.extension.twitch.maturewarning' `
    -ClassName 'MatureWarningScript'
if (-not (Test-Path $matureWarningScript)) {
    throw "Failed to generate $matureWarningScript."
}

$hidePinnedScript = New-JsSource `
    -JsPath (Join-Path $script:RepoRoot 'extension\js\twitch-hidepinned.js') `
    -OutDir $hidePinnedGeneratedRoot `
    -Package 'app.morphe.extension.twitch.hidepinned' `
    -ClassName 'PinnedChatScript'
if (-not (Test-Path $hidePinnedScript)) {
    throw "Failed to generate $hidePinnedScript."
}

$kickBaseClasses = Join-Path $classesRoot 'kick-base'
$twitchBaseClasses = Join-Path $classesRoot 'twitch-base'

Build-Module -Label 'KICK base' -SourceDir $kickBaseSrc `
    -ClassesDir $kickBaseClasses -DexDir (Join-Path $dexRoot 'kick-seyttings')

Build-Module -Label 'Twitch base' -SourceDir $twitchBaseSrc `
    -ClassesDir $twitchBaseClasses -DexDir (Join-Path $dexRoot 'twitch-seyttings')

Build-Module -Label 'KICK emotes' -SourceDir $kickEmoteSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-emotes') `
    -DexDir (Join-Path $dexRoot 'kick-emotes') -BaseClasses $kickBaseClasses

Build-Module -Label 'KICK chat size' -SourceDir $kickChatSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-chatsize') `
    -DexDir (Join-Path $dexRoot 'kick-chatsize') -BaseClasses $kickBaseClasses

Build-Module -Label 'KICK chat text' -SourceDir $kickChatTextSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-chattext') `
    -DexDir (Join-Path $dexRoot 'kick-chattext') -BaseClasses $kickBaseClasses

Build-Module -Label 'KICK expand chat' -SourceDir $kickChatExpandSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-chatexpand') `
    -DexDir (Join-Path $dexRoot 'kick-chatexpand') -BaseClasses $kickBaseClasses

Build-Module -Label 'KICK hide pinned' -SourceDir $kickHidePinnedSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-hidepinned') `
    -DexDir (Join-Path $dexRoot 'kick-hidepinned') -BaseClasses $kickBaseClasses

Build-Module -Label 'KICK mature warning' -SourceDir $kickMatureWarningSrc `
    -ClassesDir (Join-Path $classesRoot 'kick-maturewarning') `
    -DexDir (Join-Path $dexRoot 'kick-maturewarning') -BaseClasses $kickBaseClasses

Build-Module -Label 'Twitch emotes' -SourceDir $twitchEmoteSrc `
    -ClassesDir (Join-Path $classesRoot 'twitch-emotes') `
    -DexDir (Join-Path $dexRoot 'twitch-emotes') -BaseClasses $twitchBaseClasses

Build-Module -Label 'Twitch expand chat' -SourceDir $twitchExpandChatSrc `
    -ClassesDir (Join-Path $classesRoot 'twitch-expandchat') `
    -DexDir (Join-Path $dexRoot 'twitch-expandchat') -BaseClasses $twitchBaseClasses

Build-Module -Label 'Twitch ad block' -SourceDir @($twitchAdBlockSrc, $adBlockGeneratedRoot) `
    -ClassesDir (Join-Path $classesRoot 'twitch-adblock') `
    -DexDir (Join-Path $dexRoot 'twitch-adblock') -BaseClasses $twitchBaseClasses

Build-Module -Label 'Twitch amoled' -SourceDir @($twitchAmoledSrc, $amoledGeneratedRoot) `
    -ClassesDir (Join-Path $classesRoot 'twitch-amoled') `
    -DexDir (Join-Path $dexRoot 'twitch-amoled') -BaseClasses $twitchBaseClasses

Build-Module -Label 'Twitch mature warning' -SourceDir @($twitchMatureWarningSrc, $matureWarningGeneratedRoot) `
    -ClassesDir (Join-Path $classesRoot 'twitch-maturewarning') `
    -DexDir (Join-Path $dexRoot 'twitch-maturewarning') -BaseClasses $twitchBaseClasses

Build-Module -Label 'Twitch hide pinned' -SourceDir @($twitchHidePinnedSrc, $hidePinnedGeneratedRoot) `
    -ClassesDir (Join-Path $classesRoot 'twitch-hidepinned') `
    -DexDir (Join-Path $dexRoot 'twitch-hidepinned') -BaseClasses $twitchBaseClasses
