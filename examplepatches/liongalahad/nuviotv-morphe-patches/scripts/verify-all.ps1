[CmdletBinding()]
param()

. "$PSScriptRoot\Common.ps1"
Initialize-NuvioEnvironment | Out-Null
$repo = Get-RepoRoot
$manifests = Get-ChildItem (Join-Path $repo 'testing\patches') -Recurse -Filter patch.json |
    ForEach-Object { Get-Content $_.FullName -Raw | ConvertFrom-Json }
if (-not $manifests) { throw 'No patch compartments were found.' }

& "$PSScriptRoot\build.ps1" -Patch $manifests[0].id
if ($LASTEXITCODE -ne 0) { throw 'Combined bundle build failed.' }

$results = foreach ($manifest in $manifests) {
    foreach ($asset in @('x86_64', 'universal')) {
        $run = New-PatchRunDirectory $manifest.id $asset
        & "$PSScriptRoot\patch.ps1" -Patch $manifest.id -Abi $asset -RunDirectory $run -NoBuild
        if ($LASTEXITCODE -ne 0) { throw "Isolated $asset application failed for $($manifest.id)." }
        [pscustomobject]@{ Patch = $manifest.id; Asset = $asset; Run = $run; Result = 'PASS' }
    }
}
$results | Format-Table -AutoSize
