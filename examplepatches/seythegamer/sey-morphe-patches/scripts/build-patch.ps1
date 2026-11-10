# Builds one Morphe bundle that contains every KICK (Android TV) and
# Twitch (Android TV) patch as a separate entry. Morphe Manager groups the
# entries by app, so one source can patch both apps.
#
# Output: dist\SeyMorphe-<version>.mpp
#
# The bundle carries both the JVM .class files (Desktop/CLI) and a classes.dex
# (Morphe Manager on Android), plus one extension DEX per feature.
[CmdletBinding()]
param(
    [string]$Version = '1.2.2'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

& (Join-Path $PSScriptRoot 'build-extension.ps1')

$kotlinc = Get-Kotlinc
$patcherJar = Join-Path $script:RepoRoot 'tools\morphe-desktop.jar'
$androidJar = Get-AndroidJar
$d8 = Join-Path (Get-BuildToolsDir) 'd8.bat'

if (-not (Test-Path $patcherJar)) {
    throw "Morphe patcher JAR not found: $patcherJar"
}

$classesDir = Join-Path $script:RepoRoot 'patch-classes'
$stageRoot = Join-Path $script:RepoRoot 'build\mpp-stage'
Remove-Item $classesDir, $stageRoot -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Compiling Kotlin patches for KICK and Twitch..."
& $kotlinc (Join-Path $script:RepoRoot 'patches\src\main\kotlin') `
    -classpath $patcherJar `
    -jvm-target 17 `
    -d $classesDir
if ($LASTEXITCODE -ne 0) {
    throw "kotlinc failed with exit code $LASTEXITCODE."
}

$kickPatchRoot = Join-Path $classesDir 'app\morphe\patches\kicktv'
$twitchPatchRoot = Join-Path $classesDir 'app\morphe\patches\twitch'
foreach ($patchRoot in @($kickPatchRoot, $twitchPatchRoot)) {
    if (-not (Test-Path $patchRoot)) {
        throw "Patch classes were not produced in $patchRoot."
    }
}

$classFiles = @(Get-ChildItem $classesDir -Recurse -Filter '*.class' | Sort-Object FullName)
if (-not $classFiles) {
    throw "No patch class files were produced."
}

$patchDexDir = Join-Path $script:RepoRoot 'patch-dex\all'
New-Item $patchDexDir -ItemType Directory -Force | Out-Null
$classPaths = $classFiles | ForEach-Object { $_.FullName }

Write-Host "Dexing patch classes for Morphe Manager..."
& $d8 --min-api 26 --lib $androidJar --output $patchDexDir @classPaths | Out-Host
if ($LASTEXITCODE -ne 0) {
    throw "d8 failed on the patch classes with exit code $LASTEXITCODE."
}
$patchDex = Join-Path $patchDexDir 'classes.dex'
if (-not (Test-Path $patchDex)) {
    throw "d8 did not produce $patchDex."
}

$extensions = @(
    @{ Name = 'extensions/KickSeyttings.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\kick-seyttings\classes.dex') },
    @{ Name = 'extensions/KickEmotes.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\kick-emotes\classes.dex') },
    @{ Name = 'extensions/KickChatSize.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\kick-chatsize\classes.dex') },
    @{ Name = 'extensions/KickChatText.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\kick-chattext\classes.dex') },
    @{ Name = 'extensions/KickChatExpand.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\kick-chatexpand\classes.dex') },
    @{ Name = 'extensions/TwitchSeyttings.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\twitch-seyttings\classes.dex') },
    @{ Name = 'extensions/TwitchEmotes.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\twitch-emotes\classes.dex') },
    @{ Name = 'extensions/TwitchExpandChat.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\twitch-expandchat\classes.dex') },
    @{ Name = 'extensions/TwitchAdBlock.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\twitch-adblock\classes.dex') },
    @{ Name = 'extensions/TwitchAmoled.mpe'; Source = (Join-Path $script:RepoRoot 'extension\dex\twitch-amoled\classes.dex') }
)
foreach ($extension in $extensions) {
    if (-not (Test-Path $extension.Source)) {
        throw "Extension DEX not found: $($extension.Source)"
    }
}

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$mppPath = Join-Path $script:RepoRoot "dist\SeyMorphe-$Version.mpp"

$stageDir = Join-Path $stageRoot 'bundle'
$metaDir = Join-Path $stageDir 'META-INF'
New-Item $metaDir -ItemType Directory -Force | Out-Null
Copy-Item (Join-Path $classesDir 'META-INF\main.kotlin_module') $metaDir -Force

$timestamp = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
$manifest = @"
Manifest-Version: 1.0
Name: Sey Morphe Patches
Description: Morphe patches for KICK (Android TV) and Twitch (Android TV) - Sey (SEYTTINGS, EMOTES, CHAT SIZE, CHAT TEXT SIZE, EXPAND CHAT, AD BLOCK and AMOLED)
Version: $Version
Timestamp: $timestamp
Source: https://github.com/seythegamer/sey-morphe-patches
Author: sey
Contact: na
Website: na
License: GPLv3
Patcher-Version: 2.3.0

"@
Set-Content -Path (Join-Path $metaDir 'MANIFEST.MF') -Value $manifest -Encoding ASCII

New-Item (Split-Path $mppPath -Parent) -ItemType Directory -Force | Out-Null
if (Test-Path $mppPath) {
    Remove-Item $mppPath -Force
}

Write-Host "Packaging $mppPath..."
$zip = [System.IO.Compression.ZipFile]::Open($mppPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    # Manifest first keeps the bundle readable by JarInputStream-style loaders.
    $entries = @(
        @{ Name = 'META-INF/MANIFEST.MF'; Source = (Join-Path $metaDir 'MANIFEST.MF') },
        @{ Name = 'META-INF/main.kotlin_module'; Source = (Join-Path $metaDir 'main.kotlin_module') },
        @{ Name = 'classes.dex'; Source = $patchDex }
    )
    $entries += $extensions

    foreach ($file in $classFiles) {
        $relative = $file.FullName.Substring($classesDir.Length + 1) -replace '\\', '/'
        $entries += @{ Name = $relative; Source = $file.FullName }
    }

    foreach ($entry in $entries) {
        try {
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
                $zip, $entry.Source, $entry.Name,
                [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
        }
        catch {
            throw "Failed to add bundle entry '$($entry.Name)' from '$($entry.Source)': $($_.Exception.Message)"
        }
    }
}
finally {
    $zip.Dispose()
}

Write-Host "Patch bundle: $mppPath ($((Get-Item $mppPath).Length) bytes)"
