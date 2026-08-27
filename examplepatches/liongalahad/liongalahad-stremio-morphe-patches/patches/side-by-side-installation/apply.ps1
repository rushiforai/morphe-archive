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
    throw "The side-by-side installation diff does not exist: $patch"
}

Push-Location $workspace
try {
    & git apply --check --ignore-space-change "--directory=$decodedRelative" $patch
    if ($LASTEXITCODE -ne 0) {
        throw 'The side-by-side installation patch is incompatible with the preceding patch output.'
    }

    & git apply --ignore-space-change "--directory=$decodedRelative" $patch
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to apply the side-by-side installation patch.'
    }
}
finally {
    Pop-Location
}
