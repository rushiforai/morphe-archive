#requires -Version 5.1
[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$repository = 'AsrOfficialDev/Saiyan007'
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repository/releases/latest" -Headers @{
    Accept = 'application/vnd.github+json'
    'User-Agent' = 'Saiyan007-source-updater'
}

if ($release.draft -or $release.prerelease -or -not $release.published_at) {
    throw 'The source feed requires a published stable release.'
}
if ($release.tag_name -notmatch '^v?(\d+\.\d+\.\d+)$') {
    throw "Expected a release tag such as v1.1.0, got: $($release.tag_name)"
}
$version = $Matches[1]
$assets = @($release.assets | Where-Object { $_.name -like '*.mpp' })
if ($assets.Count -ne 1) {
    throw 'Attach exactly one .mpp collection bundle to the latest release.'
}
$asset = $assets[0]
if ($asset.name -cne "Saiyan007-$version.mpp" -or $asset.state -ne 'uploaded' -or $asset.size -le 0) {
    throw "Expected a completed upload named Saiyan007-$version.mpp."
}

$publishedAt = [DateTimeOffset]$release.published_at
$description = [string]$release.body
if ([string]::IsNullOrWhiteSpace($description)) {
    $description = "Saiyan007 $version - custom Android app patches for Morphe."
}
$metadata = [ordered]@{
    # Morphe expects a UTC LocalDateTime, without a trailing Z or timezone offset.
    created_at = $publishedAt.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
    description = $description
    download_url = $asset.browser_download_url
    signature_download_url = ''
    version = $version
    page_url = $release.html_url
}

$output = Join-Path $PSScriptRoot 'patches-bundle.json'
$json = ($metadata | ConvertTo-Json -Depth 5).Replace("`r`n", "`n") + "`n"
[System.IO.File]::WriteAllText($output, $json, [System.Text.UTF8Encoding]::new($false))
Write-Host "Updated patches-bundle.json for Saiyan007 $version. Commit and push it to main."
