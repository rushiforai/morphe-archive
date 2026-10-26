# Build the bundle, write patches-bundle.json and publish a GitHub release with the .mpp.
# Usage: scripts\release.ps1 "release notes"   (the version comes from gradle.properties)
param([string]$Notes = "Pixkk Patches")

$ErrorActionPreference = "Stop"

function Check($step) {
    if ($LASTEXITCODE -ne 0) { throw "$step failed (exit code $LASTEXITCODE)" }
}

$env:JAVA_HOME = "C:\Users\User\.jdks\openjdk-21.0.2"
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$env:GITHUB_ACTOR = "pixkk"
$env:GITHUB_TOKEN = (gh auth token)
Check "gh auth token"

Set-Location (Split-Path -Parent $PSScriptRoot)

$version = ((Get-Content gradle.properties | Where-Object { $_ -match '^\s*version\s*=' }) -replace '^\s*version\s*=\s*', '').Trim()
$repo = gh repo view --json nameWithOwner -q .nameWithOwner
Check "gh repo view"

.\gradlew.bat --no-daemon -q :patches:buildAndroid
Check "build"
$mpp = "patches\build\libs\patches-$version.mpp"
if (-not (Test-Path $mpp)) { throw "no $mpp" }

$bundle = [ordered]@{
    created_at             = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss")
    description            = $Notes
    download_url           = "https://github.com/$repo/releases/download/v$version/patches-$version.mpp"
    signature_download_url = ""
    version                = $version
}
$json = ($bundle | ConvertTo-Json) + "`n"
[System.IO.File]::WriteAllText((Join-Path (Get-Location) "patches-bundle.json"), $json, (New-Object System.Text.UTF8Encoding($false)))

git add patches-bundle.json gradle.properties
Check "git add"
git commit -m "release v$version"
Check "git commit"
git push
Check "git push"
gh release create "v$version" $mpp --title "v$version" --notes $Notes
Check "gh release create"
Write-Host "Released v$version"
