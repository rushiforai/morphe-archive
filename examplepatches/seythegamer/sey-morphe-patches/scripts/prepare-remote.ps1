param(
    [Parameter(Mandatory = $true)]
    [string]$Owner,

    [Parameter(Mandatory = $true)]
    [string]$Repo,

    [string]$Branch = 'main',

    [string]$Version = '1.2.2'
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot '_common.ps1')
Set-Location $script:RepoRoot

$repoUrl = "https://github.com/$Owner/$Repo"
$rawBase = "https://raw.githubusercontent.com/$Owner/$Repo/$Branch"
$remoteDir = Join-Path $script:RepoRoot 'remote'
$mppName = "SeyMorphe-$Version.mpp"
$sourceMpp = Join-Path $script:RepoRoot "dist\$mppName"

if (-not (Test-Path $sourceMpp)) {
    throw "Patch bundle not found: $sourceMpp. Run scripts\build-patch.ps1 first."
}

New-Item $remoteDir -ItemType Directory -Force | Out-Null
Copy-Item $sourceMpp (Join-Path $remoteDir $mppName) -Force

# Morphe reads the repository patch list from patches-list.json.
& (Join-Path $PSScriptRoot 'generate-patches-list.ps1') -Version $Version
$patchList = Join-Path $script:RepoRoot 'patches-list.json'
Copy-Item $patchList (Join-Path $remoteDir 'patches-list.json') -Force

$manifest = [ordered]@{
    created_at   = (Get-Date -Format 'yyyy-MM-ddTHH:mm:ss')
    description  = 'Sey Morphe Patches: KICK (Android TV) + Twitch (Android TV) - ' +
                   'SEYTTINGS, EMOTES, CHAT SIZE, CHAT TEXT SIZE, EXPAND CHAT, AD BLOCK and AMOLED'
    download_url = "$rawBase/$mppName"
    version      = $Version
    page_url     = $repoUrl
}

# ASCII avoids the UTF-8 BOM that Windows PowerShell 5 writes by default.
$manifestPath = Join-Path $remoteDir 'patches-bundle.json'
$manifest | ConvertTo-Json | Set-Content -Path $manifestPath -Encoding ASCII

# README.md, CHANGELOG.md and patches-bundle.png are maintained at the
# repository root. Morphe Manager fetches CHANGELOG.md from the repository
# source URL, so it must be uploaded next to the other files.
Copy-Item (Join-Path $script:RepoRoot 'README.md') (Join-Path $remoteDir 'README.md') -Force
Copy-Item (Join-Path $script:RepoRoot 'CHANGELOG.md') (Join-Path $remoteDir 'CHANGELOG.md') -Force
Copy-Item (Join-Path $script:RepoRoot 'patches-bundle.png') (Join-Path $remoteDir 'patches-bundle.png') -Force

@"
Sey Morphe patches - remote source
==================================

Upload these files to the root of a PUBLIC GitHub repository
(branch '$Branch'):

  patches-list.json
  patches-bundle.json
  patches-bundle.png
  $mppName
  README.md
  CHANGELOG.md

Morphe Manager reads CHANGELOG.md from the repository source and shows the
release notes after an update. Add the repository URL (not the raw JSON URL)
if you want the changelog in the app:

  $repoUrl

The manifest URL still installs and updates the patches, but it does not
carry a changelog:

  $rawBase/patches-bundle.json

One bundle patches two apps. After selecting the KICK or Twitch APK, Morphe
Manager shows only the patches that belong to that app:

  KICK:   SEYTTINGS, EMOTES, CHAT SIZE, CHAT TEXT SIZE, EXPAND CHAT
  Twitch: SEYTTINGS, AMOLED, AD BLOCK, EMOTES, EXPAND CHAT

Morphe Manager lists the patches from patches-list.json and downloads the
.mpp from the download_url inside patches-bundle.json. Do not paste a .mpp
link directly.
"@ | Set-Content -Path (Join-Path $remoteDir 'README.txt') -Encoding UTF8

Write-Host "Remote source prepared in: $remoteDir"
Write-Host "  patch list: $(Join-Path $remoteDir 'patches-list.json')"
Write-Host "  manifest : $manifestPath"
Write-Host "  icon     : $(Join-Path $remoteDir 'patches-bundle.png')"
Write-Host "  changelog: $(Join-Path $remoteDir 'CHANGELOG.md')"
Write-Host "  bundle   : $(Join-Path $remoteDir $mppName)"
Write-Host ""
Write-Host "Add as source (repo): $repoUrl"
Write-Host "Add as source (json): $rawBase/patches-bundle.json"
