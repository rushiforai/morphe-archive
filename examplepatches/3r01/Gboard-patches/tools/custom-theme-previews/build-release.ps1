[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PreviewDirectory,

    [Parameter(Mandatory = $true)]
    [string]$CatalogPath,

    [Parameter(Mandatory = $true)]
    [string]$OutputDirectory,

    [string]$Version = 'v1'
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$previewRoot = (Resolve-Path -LiteralPath $PreviewDirectory).Path
$catalogFile = (Resolve-Path -LiteralPath $CatalogPath).Path
$outputRoot = [System.IO.Path]::GetFullPath($OutputDirectory)
$bundleName = "custom-theme-previews-$Version"
$archivePath = Join-Path $outputRoot "$bundleName.zip"
$releaseManifestPath = Join-Path $outputRoot "$bundleName-manifest.json"
$fixedTimestamp = [DateTimeOffset]::new(2000, 1, 1, 0, 0, 0, [TimeSpan]::Zero)

if (-not (Test-Path -LiteralPath $outputRoot -PathType Container)) {
    [System.IO.Directory]::CreateDirectory($outputRoot) | Out-Null
}

$previewFiles = @(Get-ChildItem -LiteralPath $previewRoot -Recurse -File |
    Where-Object { $_.Extension.ToLowerInvariant() -in @('.jpg', '.jpeg', '.png', '.webp') } |
    Sort-Object { $_.FullName.Substring($previewRoot.Length).Replace('\', '/') })

if ($previewFiles.Count -eq 0) {
    throw "No preview images were found under $previewRoot"
}

$catalog = Get-Content -LiteralPath $catalogFile -Raw -Encoding UTF8 | ConvertFrom-Json
$referenced = @($catalog.packs.themes |
    ForEach-Object { $_.preview } |
    Where-Object { $_ -and $_ -ne 'null' } |
    ForEach-Object {
        $path = [string]$_
        if (-not $path.StartsWith('gboard-custom-themes/previews/', [StringComparison]::Ordinal)) {
            throw "Unexpected catalog preview path: $path"
        }
        $path.Substring('gboard-custom-themes/'.Length)
    } |
    Sort-Object -Unique)

$available = @($previewFiles | ForEach-Object {
    'previews/' + $_.FullName.Substring($previewRoot.Length).TrimStart('\', '/').Replace('\', '/')
})
$missing = @($referenced | Where-Object { $_ -notin $available })
$unreferenced = @($available | Where-Object { $_ -notin $referenced })
if ($missing.Count -gt 0 -or $unreferenced.Count -gt 0) {
    throw "Catalog/preview mismatch: missing=$($missing.Count), unreferenced=$($unreferenced.Count)"
}

$totalBytes = [long](($previewFiles | Measure-Object -Property Length -Sum).Sum)
$internalManifest = [ordered]@{
    schemaVersion = 1
    bundleVersion = $Version
    previewCount = $previewFiles.Count
    totalUncompressedBytes = $totalBytes
    source = [string]$catalog.source
    sourceCommit = [string]$catalog.commit
    attribution = 'Rboard PackRepoBeta theme previews, redistributed with permission.'
}
$internalManifestJson = ($internalManifest | ConvertTo-Json -Depth 4) + "`n"

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

if (Test-Path -LiteralPath $archivePath) {
    Remove-Item -LiteralPath $archivePath -Force
}

$archiveStream = [System.IO.File]::Open(
    $archivePath,
    [System.IO.FileMode]::CreateNew,
    [System.IO.FileAccess]::ReadWrite,
    [System.IO.FileShare]::None)
try {
    $archive = [System.IO.Compression.ZipArchive]::new(
        $archiveStream,
        [System.IO.Compression.ZipArchiveMode]::Create,
        $true)
    try {
        $manifestEntry = $archive.CreateEntry(
            'manifest.json',
            [System.IO.Compression.CompressionLevel]::Optimal)
        $manifestEntry.LastWriteTime = $fixedTimestamp
        $manifestStream = $manifestEntry.Open()
        try {
            $manifestBytes = [System.Text.Encoding]::UTF8.GetBytes($internalManifestJson)
            $manifestStream.Write($manifestBytes, 0, $manifestBytes.Length)
        }
        finally {
            $manifestStream.Dispose()
        }

        foreach ($file in $previewFiles) {
            $relativePath = 'previews/' +
                $file.FullName.Substring($previewRoot.Length).TrimStart('\', '/').Replace('\', '/')
            $entry = $archive.CreateEntry(
                $relativePath,
                [System.IO.Compression.CompressionLevel]::Optimal)
            $entry.LastWriteTime = $fixedTimestamp
            $entryStream = $entry.Open()
            $inputStream = $file.OpenRead()
            try {
                $inputStream.CopyTo($entryStream)
            }
            finally {
                $inputStream.Dispose()
                $entryStream.Dispose()
            }
        }
    }
    finally {
        $archive.Dispose()
    }
}
finally {
    $archiveStream.Dispose()
}

$archiveFile = Get-Item -LiteralPath $archivePath
$archiveSha256 = (Get-FileHash -LiteralPath $archivePath -Algorithm SHA256).Hash.ToLowerInvariant()
$releaseManifest = [ordered]@{
    schemaVersion = 1
    bundleVersion = $Version
    asset = $archiveFile.Name
    sha256 = $archiveSha256
    compressedBytes = $archiveFile.Length
    previewCount = $previewFiles.Count
    totalUncompressedBytes = $totalBytes
    source = [string]$catalog.source
    sourceCommit = [string]$catalog.commit
    attribution = 'Rboard PackRepoBeta theme previews, redistributed with permission.'
}
[System.IO.File]::WriteAllText(
    $releaseManifestPath,
    ($releaseManifest | ConvertTo-Json -Depth 4) + "`n",
    [System.Text.UTF8Encoding]::new($false))

[pscustomobject]@{
    Archive = $archivePath
    Manifest = $releaseManifestPath
    Sha256 = $archiveSha256
    CompressedBytes = $archiveFile.Length
    PreviewCount = $previewFiles.Count
    TotalUncompressedBytes = $totalBytes
}
