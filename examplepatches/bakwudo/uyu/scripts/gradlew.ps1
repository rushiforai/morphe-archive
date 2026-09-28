<#
.SYNOPSIS
    Runs the Gradle wrapper with GitHub Packages credentials taken from the GitHub CLI.

.DESCRIPTION
    Morphe's Gradle plugin and libraries are served from GitHub Packages, which requires a token
    with the read:packages scope even for public packages. Instead of storing a token in
    gradle.properties, this script exports GITHUB_ACTOR / GITHUB_TOKEN from `gh` for this process only.

    One-time setup:  gh auth refresh -h github.com -s read:packages

.EXAMPLE
    ./scripts/gradlew.ps1 buildAndroid
#>
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

if (-not $env:GITHUB_TOKEN) {
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        throw 'GitHub CLI (gh) was not found. Install it, or set GITHUB_ACTOR and GITHUB_TOKEN yourself.'
    }

    # The X-Oauth-Scopes response header lists the scopes of the current gh token.
    $headers = (gh api --include user) -join "`n"
    if ($LASTEXITCODE -ne 0) {
        throw 'gh is not logged in. Run: gh auth login'
    }
    if ($headers -notmatch '(?im)^X-Oauth-Scopes:.*\bread:packages\b') {
        throw 'The gh token lacks the read:packages scope. Run: gh auth refresh -h github.com -s read:packages'
    }

    $env:GITHUB_TOKEN = (gh auth token).Trim()
}

if (-not $env:GITHUB_ACTOR) {
    $env:GITHUB_ACTOR = (gh api user --jq .login).Trim()
}

# Android Studio's default SDK location, used to build the extension modules.
if (-not $env:ANDROID_HOME) {
    $defaultSdk = Join-Path $env:LOCALAPPDATA 'Android\Sdk'
    if (Test-Path $defaultSdk) {
        $env:ANDROID_HOME = $defaultSdk
    }
}

& (Join-Path $root 'gradlew.bat') -p $root @args
exit $LASTEXITCODE
