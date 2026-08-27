[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$DecodedDirectory
)

$ErrorActionPreference = 'Stop'

$workspace = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$decoded = (Resolve-Path -LiteralPath $DecodedDirectory).Path
$patch = Join-Path $PSScriptRoot 'patch.patch'
$decodedRelative = [IO.Path]::GetRelativePath($workspace, $decoded).Replace('\', '/') + '/'

if ($decodedRelative.StartsWith('../', [StringComparison]::Ordinal)) {
    throw "The decoded directory must be inside the repository: $decoded"
}
if (-not (Test-Path -LiteralPath $patch)) {
    throw "The multi-account diff does not exist: $patch"
}

Push-Location $workspace
try {
    & git apply --check --ignore-space-change "--directory=$decodedRelative" $patch
    if ($LASTEXITCODE -ne 0) {
        throw 'The multi-account patch is incompatible with this decoded APK.'
    }

    & git apply --ignore-space-change "--directory=$decodedRelative" $patch
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to apply the multi-account patch.'
    }
}
finally {
    Pop-Location
}
