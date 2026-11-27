# Builds our patch bundle (bundle/) in the Docker toolbox and copies the .mpp into work/bundles.
# Needs: Docker running, image ytm-patches-tools (docker build -t ytm-patches-tools docker),
#        gh logged in with the read:packages scope (Morphe's Gradle packages).
$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot -Parent
$work = Join-Path $root "work"
New-Item -ItemType Directory -Force "$work\gradle-home", "$work\bundles" | Out-Null

# The token goes to Docker through the environment (-e NAME with no value), never on a command
# line where process listings would show it. A GITHUB_TOKEN already set is put back afterwards.
$hadToken = Test-Path Env:GITHUB_TOKEN
$oldToken = $env:GITHUB_TOKEN
$env:GITHUB_TOKEN = (gh auth token)
if ($LASTEXITCODE -ne 0 -or -not $env:GITHUB_TOKEN) {
    if ($hadToken) { $env:GITHUB_TOKEN = $oldToken } else { Remove-Item Env:GITHUB_TOKEN -ErrorAction SilentlyContinue }
    throw "gh auth token failed: log in with gh auth login (read:packages scope)"
}
# Gradle logs on stderr; PowerShell 5.1 would treat that as errors, so judge by the exit code only.
$ErrorActionPreference = "Continue"
try {
    docker run --rm -e GITHUB_ACTOR=ayhamo -e GITHUB_TOKEN `
        -v "${root}\bundle:/src" -v "${work}\gradle-home:/gradle" -w /src `
        ytm-patches-tools sh -c "rm -f patches/build/libs/*.mpp && sh ./gradlew buildAndroid --no-daemon --console=plain -q"
    if ($LASTEXITCODE -ne 0) { throw "Gradle build failed" }
} finally {
    if ($hadToken) { $env:GITHUB_TOKEN = $oldToken } else { Remove-Item Env:GITHUB_TOKEN -ErrorAction SilentlyContinue }
}

$mpp = Get-ChildItem "$root\bundle\patches\build\libs\patches-*.mpp" | Select-Object -First 1
Copy-Item $mpp.FullName "$work\bundles\ayham-$($mpp.Name)" -Force
Write-Host "Built $work\bundles\ayham-$($mpp.Name)"
