[CmdletBinding()]
param([Parameter(Mandatory)][string] $InputApk, [switch] $Decompile)
. "$PSScriptRoot/common.ps1"
$inputPath = (Resolve-Path -LiteralPath $InputApk).Path
if ([IO.Path]::GetExtension($inputPath) -notin @('.apk', '.apkm', '.apks', '.xapk')) {
    throw 'Input must be an original APK or complete split bundle.'
}
$sdk = Get-AndroidSdk
$aapt = Join-Path $sdk 'build-tools/36.0.0/aapt2.exe'
if (-not (Test-Path -LiteralPath $aapt)) { throw 'Install Android SDK Build-Tools 36.0.0.' }
$run = New-RunDirectory 'inspect'
$apks = [Collections.Generic.List[string]]::new()
Add-Type -AssemblyName System.IO.Compression.FileSystem
if ([IO.Path]::GetExtension($inputPath) -eq '.apk') {
    $apks.Add($inputPath)
} else {
    $archive = [IO.Compression.ZipFile]::OpenRead($inputPath)
    try {
        $index = 0
        foreach ($entry in $archive.Entries) {
            if ($entry.FullName.EndsWith('.apk', [StringComparison]::OrdinalIgnoreCase)) {
                $path = Join-Path $run ('part-{0:D3}.apk' -f $index)
                [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $path)
                $apks.Add($path)
                $index++
            }
        }
    } finally { $archive.Dispose() }
    if (-not $apks.Count) { throw 'Bundle contains no APK entries.' }
}
$inventory = [Collections.Generic.List[string]]::new()
foreach ($apk in $apks) {
    $badging = @(& $aapt dump badging $apk)
    if ($LASTEXITCODE -ne 0) { throw 'aapt2 could not inspect an APK part.' }
    $inventory.Add("APK part: $([IO.Path]::GetFileName($apk))")
    $inventory.AddRange([string[]]$badging)
    $archive = [IO.Compression.ZipFile]::OpenRead($apk)
    try {
        foreach ($entry in $archive.Entries) {
            if ($entry.FullName -match '(^classes\d*\.dex$|^lib/[^/]+/.+\.so$)') {
                $inventory.Add("Entry: $($entry.FullName); bytes=$($entry.Length)")
            }
        }
    } finally { $archive.Dispose() }
}
$inventory | Set-Content -LiteralPath (Join-Path $run 'inventory.txt') -Encoding utf8
[ordered]@{
    inputSha256 = (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash
    createdUtc = [DateTime]::UtcNow.ToString('o')
    apkParts = $apks.Count
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $run 'input.json') -Encoding utf8
if ($Decompile) {
    $config = Get-Content -Raw (Get-ProjectPath 'config/toolchain.json') | ConvertFrom-Json
    $jadx = Get-ProjectPath ".local/tools/jadx-$($config.jadx.version)/bin/jadx.bat"
    if (-not (Test-Path -LiteralPath $jadx)) { throw 'Run bootstrap-tools.ps1 first.' }
    $arguments = @('--no-res', '-d', (Join-Path $run 'decompiled')) + $apks.ToArray()
    & $jadx @arguments 2>&1 | Tee-Object -FilePath (Join-Path $run 'jadx.log')
    if ($LASTEXITCODE -ne 0) {
        throw "JADX reported errors. Some sources may exist; inspect $run/jadx.log."
    }
}
Write-Host "Inspection: $run"
