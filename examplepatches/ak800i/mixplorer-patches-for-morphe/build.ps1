param([string[]]$Tasks = @(':patches:test', ':patches:buildAndroid', ':patches:generatePatchesList'))

$ErrorActionPreference = 'Stop'
$oldToken = $env:GITHUB_TOKEN
$oldActor = $env:GITHUB_ACTOR
try {
    if (-not $env:GITHUB_TOKEN -and (Get-Command gh -ErrorAction SilentlyContinue)) {
        $token = & gh auth token 2>$null
        if ($LASTEXITCODE -eq 0 -and $token) {
            $env:GITHUB_TOKEN = $token
            if (-not $env:GITHUB_ACTOR) {
                $env:GITHUB_ACTOR = & gh api user --jq .login
                if ($LASTEXITCODE -ne 0) {
                    throw 'Unable to resolve the GitHub Packages account.'
                }
            }
        }
    }
    $wrapper = Join-Path $PSScriptRoot 'gradlew.bat'
    if (-not (Test-Path $wrapper)) {
        $installed = Get-ChildItem "$env:USERPROFILE\.gradle\wrapper\dists" -Filter 'gradle.bat' -Recurse -ErrorAction SilentlyContinue |
            Sort-Object FullName -Descending | Select-Object -First 1
        if (-not $installed) {
            throw 'A Gradle wrapper or an installed Gradle distribution is required.'
        }
        $wrapper = $installed.FullName
    }
    & $wrapper -p $PSScriptRoot @Tasks --console=plain --no-daemon
    if ($LASTEXITCODE -ne 0) {
        throw "Gradle failed with exit code $LASTEXITCODE."
    }
} finally {
    $env:GITHUB_TOKEN = $oldToken
    $env:GITHUB_ACTOR = $oldActor
    $token = $null
}