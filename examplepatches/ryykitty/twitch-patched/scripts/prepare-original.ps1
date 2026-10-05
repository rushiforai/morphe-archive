[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $InputBundle,
    [Parameter(Mandatory)][string] $OriginalBaseApk
)
. "$PSScriptRoot/common.ps1"
$inputPath = (Resolve-Path -LiteralPath $InputBundle).Path
$basePath = (Resolve-Path -LiteralPath $OriginalBaseApk).Path
$inputHash = (Get-FileHash -LiteralPath $inputPath -Algorithm SHA256).Hash.ToLowerInvariant()
$baseHash = (Get-FileHash -LiteralPath $basePath -Algorithm SHA256).Hash.ToLowerInvariant()
$morphe = Get-MorphePath
$toolHash = (Get-FileHash -LiteralPath $morphe -Algorithm SHA256).Hash.ToLowerInvariant()
$cacheRoot = [IO.Path]::GetFullPath((Get-ProjectPath '.local/cache/originals'))
$directory = Join-Path $cacheRoot "$inputHash-$($toolHash.Substring(0,12))"
$output = [IO.Path]::GetFullPath((Join-Path $directory 'original-merged.apk'))
if (-not $output.StartsWith($cacheRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Merged target escaped the local original cache.'
}
New-Item -ItemType Directory -Path $directory -Force | Out-Null
$metadataPath = Join-Path $directory 'provenance.json'
if (Test-Path -LiteralPath $metadataPath) {
    $metadata = Get-Content -LiteralPath $metadataPath -Raw | ConvertFrom-Json
    if ($metadata.inputSha256 -ne $inputHash -or $metadata.baseSha256 -ne $baseHash -or $metadata.toolSha256 -ne $toolHash -or
        -not (Test-Path -LiteralPath $output) -or $metadata.mergedSha256 -ne (Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash.ToLowerInvariant()) {
        throw 'Cached original provenance/hash mismatch. Inspect the cache before preparing another original.'
    }
    Write-Host "Verified cached original: $output"
    Write-Output $output
    return
}
& java '-Xmx4g' '--class-path' $morphe (Join-Path $PSScriptRoot 'verification/MergeOriginal.java') $inputPath $basePath $output 2>&1 |
    Tee-Object -FilePath (Join-Path $directory 'merge.log') | Out-Host
if ($LASTEXITCODE -ne 0) { throw 'Preparing the original failed; no cache metadata was accepted.' }
[ordered]@{
    inputSha256 = $inputHash
    baseSha256 = $baseHash
    toolSha256 = $toolHash
    mergedSha256 = (Get-FileHash -LiteralPath $output -Algorithm SHA256).Hash.ToLowerInvariant()
    originalDex = 'byte-identical to supplied base'
    note = 'Derived local input; merging changes resources/signatures. Not an official signed APK.'
} | ConvertTo-Json | Set-Content -LiteralPath $metadataPath -Encoding utf8
Write-Host "Prepared original: $output"
Write-Output $output
