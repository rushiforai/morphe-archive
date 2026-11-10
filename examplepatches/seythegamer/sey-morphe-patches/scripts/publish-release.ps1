# Creates or updates the GitHub release for one CHANGELOG.md version and
# uploads the matching .mpp asset. Morphe shows a release card (with the
# release body as notes) for every GitHub release of a patch source, so this
# keeps the in-app changelog readable next to the bundle download.
#
# The token is read from `git credential fill` and is never printed.
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Owner,
    [Parameter(Mandatory = $true)][string]$Repo,
    [Parameter(Mandatory = $true)][string]$Version,
    [string]$Branch = 'main',
    [string]$AssetPath,
    [switch]$Prerelease
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

$changelogPath = Join-Path $script:RepoRoot 'CHANGELOG.md'
if (-not (Test-Path $changelogPath)) {
    throw "CHANGELOG.md not found: $changelogPath"
}

if (-not $AssetPath) {
    $AssetPath = Join-Path $script:RepoRoot "SeyMorphe-$Version.mpp"
    if (-not (Test-Path $AssetPath)) {
        $AssetPath = Join-Path $script:RepoRoot "dist\SeyMorphe-$Version.mpp"
    }
}
if (-not (Test-Path $AssetPath)) {
    throw "Patch bundle not found for $Version. Build it first or pass -AssetPath."
}

# Take the section between this version heading and the next version heading.
# Read as UTF-8 explicitly: Windows PowerShell 5.1 Get-Content defaults to the
# ANSI code page, which would turn the section emoji into mojibake.
$markdown = [System.IO.File]::ReadAllText($changelogPath, [System.Text.Encoding]::UTF8)
$escaped = [regex]::Escape($Version)
$pattern = "(?ms)^##\s+(?:\[$escaped\]\([^)]*\)|$escaped)\s+\(\d{4}-\d{2}-\d{2}\)\s*\r?\n(.*?)(?=^##\s+|\z)"
$match = [regex]::Match($markdown, $pattern)
if (-not $match.Success) {
    throw "No CHANGELOG.md entry found for $Version."
}
$notes = $match.Groups[1].Value.Trim()
if (-not $notes) {
    throw "The CHANGELOG.md entry for $Version is empty."
}

$cred = "protocol=https`nhost=github.com`n`n" | git credential fill
$token = ($cred -split "`n" | Where-Object { $_ -like 'password=*' }) -replace '^password=', ''
if (-not $token) {
    throw 'No GitHub token available from git credential fill.'
}

$headers = @{
    Authorization = "Bearer $token"
    'User-Agent'  = 'opencode'
    Accept        = 'application/vnd.github+json'
}
$tag = "v$Version"
$releaseName = "Sey Morphe Patches $Version"

$release = $null
$body = @{
    tag_name         = $tag
    target_commitish = $Branch
    name             = $releaseName
    body             = $notes
    draft            = $false
    prerelease       = [bool]$Prerelease
} | ConvertTo-Json -Depth 4
try {
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases" `
        -Headers $headers -Method Post `
        -Body ([System.Text.Encoding]::UTF8.GetBytes($body)) -ContentType 'application/json'
    Write-Host "Created release $tag"
}
catch {
    if ($_.Exception.Response.StatusCode.value__ -ne 422) { throw }
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/tags/$tag" -Headers $headers
    $update = @{
        name       = $releaseName
        body       = $notes
        prerelease = [bool]$Prerelease
    } | ConvertTo-Json -Depth 4
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/$($release.id)" `
        -Headers $headers -Method Patch `
        -Body ([System.Text.Encoding]::UTF8.GetBytes($update)) -ContentType 'application/json'
    Write-Host "Updated release $tag"
}

$assetName = Split-Path $AssetPath -Leaf
foreach ($asset in @($release.assets | Where-Object { $_.name -eq $assetName })) {
    Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repo/releases/assets/$($asset.id)" `
        -Headers $headers -Method Delete | Out-Null
    Write-Host "Replaced asset $assetName"
}

$uploadUrl = "https://uploads.github.com/repos/$Owner/$Repo/releases/$($release.id)/assets?name=$([uri]::EscapeDataString($assetName))"
$uploadHeaders = $headers.Clone()
$uploadHeaders['Content-Type'] = 'application/octet-stream'
Invoke-RestMethod -Uri $uploadUrl -Headers $uploadHeaders -Method Post -InFile $AssetPath | Out-Null
Write-Host "Uploaded asset $assetName"
Write-Host "Release: https://github.com/$Owner/$Repo/releases/tag/$tag"
