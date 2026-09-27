param()

$ErrorActionPreference = 'Stop'
$repo = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$source = Join-Path $repo 'recovered/1.3.5'
$build = Join-Path $repo 'build/recovered-1.3.5'
$baseline = Join-Path $source 'original-local-2.12.mpp'
$release = Join-Path $source 'patches-1.3.5.mpp'
$expectedHash = '20E4F160BDC67A38F01CF45A63625A87880F8210D7B4785F08D44FC33E4DB2A5'
if ((Get-FileHash -LiteralPath $release -Algorithm SHA256).Hash -ne $expectedHash) {
    throw 'Release MPP hash differs from the reviewed artifact'
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Read-Entry([IO.Compression.ZipArchiveEntry] $entry) {
    $stream = New-Object IO.MemoryStream
    $inputStream = $entry.Open()
    try { $inputStream.CopyTo($stream); return ,$stream.ToArray() }
    finally { $inputStream.Dispose(); $stream.Dispose() }
}
function Extract-Entry([IO.Compression.ZipArchiveEntry] $entry, [string] $path) {
    $inputStream = $entry.Open()
    $outputStream = [IO.File]::Create($path)
    try { $inputStream.CopyTo($outputStream) }
    finally { $inputStream.Dispose(); $outputStream.Dispose() }
}

$old = [IO.Compression.ZipFile]::OpenRead($baseline)
$new = [IO.Compression.ZipFile]::OpenRead($release)
try {
    $oldNames = @($old.Entries | ForEach-Object FullName | Sort-Object)
    $newNames = @($new.Entries | ForEach-Object FullName | Sort-Object)
    if (@(Compare-Object $oldNames $newNames).Count -ne 0 -or $oldNames.Count -ne 72) {
        throw 'MPP entry inventory changed'
    }
    $changed = @()
    foreach ($name in $oldNames) {
        $before = Read-Entry ($old.GetEntry($name))
        $after = Read-Entry ($new.GetEntry($name))
        if ([Linq.Enumerable]::SequenceEqual([byte[]]$before, [byte[]]$after)) { continue }
        $changed += $name
        if ($name -eq 'META-INF/MANIFEST.MF') {
            $expected = [Text.Encoding]::UTF8.GetString($before).Replace('Version: 1.4.0-local.2.12', 'Version: 1.3.5')
            if ($expected -cne [Text.Encoding]::UTF8.GetString($after)) { throw 'Manifest changed beyond version' }
        } elseif ($name -like 'captionlocales/*/caption_addon_strings.xml') {
            $expected = [Text.Encoding]::UTF8.GetString($before).Replace('12–18', '8–15').Replace('12～18', '8～15')
            if ($expected -cne [Text.Encoding]::UTF8.GetString($after)) { throw "Unexpected locale edit: $name" }
        } elseif ($name -notin @('classes.dex', 'extensions/extension.mpe')) {
            throw "Unexpected MPP entry edit: $name"
        }
    }
    if ($changed.Count -ne 17) { throw "Expected 17 edited entries, got $($changed.Count)" }
    New-Item -ItemType Directory -Path $build -Force | Out-Null
    foreach ($pair in @(@('classes.dex', 'patch'), @('extensions/extension.mpe', 'extension'))) {
        Extract-Entry $old.GetEntry($pair[0]) (Join-Path $build ($pair[1] + '-original.dex'))
        Extract-Entry $new.GetEntry($pair[0]) (Join-Path $build ($pair[1] + '-release.dex'))
    }
}
finally { $old.Dispose(); $new.Dispose() }

$deps = Join-Path $build 'tools'
$jars = @('baksmali.jar','smali.jar','dexlib2.jar','util.jar','jcommander.jar','guava.jar','antlr-runtime.jar') | ForEach-Object { Join-Path $deps $_ }
foreach ($jar in $jars) { if (-not (Test-Path -LiteralPath $jar)) { throw 'Run rebuild_recovered_135.ps1 first' } }
$classPath = $jars -join [IO.Path]::PathSeparator

function Verify-Dex([string] $kind, [string[]] $allowed) {
    $oldDir = Join-Path $build ($kind + '-original-smali')
    $newDir = Join-Path $build ($kind + '-release-smali')
    & java -cp $classPath org.jf.baksmali.Main d (Join-Path $build ($kind + '-original.dex')) -o $oldDir
    if ($LASTEXITCODE -ne 0) { throw "Failed to disassemble original $kind" }
    & java -cp $classPath org.jf.baksmali.Main d (Join-Path $build ($kind + '-release.dex')) -o $newDir
    if ($LASTEXITCODE -ne 0) { throw "Failed to disassemble release $kind" }
    $files = @(Get-ChildItem -LiteralPath $oldDir -Recurse -Filter '*.smali' -File)
    $newFiles = @(Get-ChildItem -LiteralPath $newDir -Recurse -Filter '*.smali' -File)
    if ($files.Count -ne $newFiles.Count) { throw "$kind class count changed" }
    $modified = @()
    foreach ($file in $files) {
        $relative = $file.FullName.Substring($oldDir.Length + 1)
        $counterpart = Join-Path $newDir $relative
        if (-not (Test-Path -LiteralPath $counterpart)) { throw "Missing $kind class: $relative" }
        if ((Get-FileHash -LiteralPath $file.FullName).Hash -ne (Get-FileHash -LiteralPath $counterpart).Hash) {
            $modified += $relative.Replace('\', '/')
        }
    }
    $allowedNames = @($allowed | Sort-Object)
    if (@(Compare-Object @($modified | Sort-Object) $allowedNames).Count -ne 0) {
        throw "$kind changed classes differ from reviewed list: $($modified -join ', ')"
    }
    Write-Output "$kind verified: $($files.Count) classes, $($modified.Count) intentional edits"
}

Verify-Dex 'extension' @(
    'app/yydarlinker/deepseekcaptions/CaptionDiagnostics.smali',
    'app/yydarlinker/deepseekcaptions/CaptionTranslationCatalog.smali',
    'app/yydarlinker/deepseekcaptions/DeepSeekConfig.smali',
    'app/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference.smali',
    'app/yydarlinker/deepseekcaptions/DeepSeekSliderPreference.smali'
)
Verify-Dex 'patch' @('app/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt.smali')
Write-Output "Release content verified: 72 entries, 17 intentional entry edits, SHA-256 $expectedHash"
