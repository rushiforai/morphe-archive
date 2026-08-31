[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Patch,
    [switch]$SkipTests
)

. "$PSScriptRoot\Common.ps1"
Initialize-NuvioEnvironment | Out-Null
$repo = Get-RepoRoot
$manifest = Get-PatchManifest $Patch

if (-not $env:GITHUB_TOKEN -and (Get-Command gh -ErrorAction SilentlyContinue)) {
    $env:GITHUB_TOKEN = & gh auth token --user liongalahad
    $env:GITHUB_ACTOR = 'liongalahad'
}

Push-Location $repo
try {
    if (-not $SkipTests) {
        & .\gradlew.bat :extensions:extension:test
        if ($LASTEXITCODE -ne 0) { throw 'Extension tests failed.' }
    }
    & .\gradlew.bat :patches:buildAndroid
    if ($LASTEXITCODE -ne 0) { throw 'Morphe bundle build failed.' }
} finally {
    Pop-Location
}

$bundle = Get-PatchBundle
$jar = Get-MorpheJar
& java -jar $jar list-patches --patches $bundle --with-packages --with-versions |
    Select-String -Pattern ([regex]::Escape($manifest.name))
if ($LASTEXITCODE -ne 0) { throw "Built bundle does not list '$($manifest.name)'." }

[pscustomobject]@{
    Patch = $manifest.name
    Bundle = $bundle
    Sha256 = (Get-FileHash $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
}
