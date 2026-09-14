<#
.SYNOPSIS
    Read the one exact app target shared by every patch in a generated catalog.

.DESCRIPTION
    Device patching, fixture verification, heap measurements and release validation all need
    the package and version that the bundle supports. Keeping that fact in patches-list.json,
    which is generated from AppCompatibilities.kt, prevents those callers from drifting apart.
#>

function Get-PatchTarget {
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][object]$PatchList)

    $patches = @($PatchList.patches)
    if ($patches.Count -eq 0) { throw 'patches-list.json contains no patches.' }

    $targets = @{}
    foreach ($patch in $patches) {
        if ($null -eq $patch) { throw 'patches-list.json contains a null patch.' }
        $nameProperty = $patch.PSObject.Properties['name']
        $patchName = if ($null -ne $nameProperty -and -not [string]::IsNullOrWhiteSpace([string]$nameProperty.Value)) {
            [string]$nameProperty.Value
        } else {
            '<unnamed patch>'
        }
        $compatible = $patch.PSObject.Properties['compatiblePackages']
        if ($null -eq $compatible -or $null -eq $compatible.Value) {
            throw "$patchName has no compatible package in patches-list.json."
        }
        $packages = @($compatible.Value.PSObject.Properties)
        if ($packages.Count -eq 0) {
            throw "$patchName has no compatible package in patches-list.json."
        }
        foreach ($property in $packages) {
            $versions = @($property.Value | ForEach-Object { [string]$_ } |
                Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
            if ($versions.Count -eq 0) {
                throw "$patchName has no exact compatible version for $($property.Name)."
            }
            if (-not $targets.ContainsKey($property.Name)) { $targets[$property.Name] = @() }
            $targets[$property.Name] += $versions
        }
    }

    $packages = @($targets.Keys | Sort-Object)
    if ($packages.Count -ne 1) {
        throw "Expected one compatible package, found $($packages -join ', ')."
    }
    $packageName = $packages[0]
    $versions = @($targets[$packageName] | Sort-Object -Unique)
    if ($versions.Count -ne 1) {
        throw "Expected one compatible version for $packageName, found $($versions -join ', ')."
    }
    return [pscustomobject]@{
        PackageName = $packageName
        PackageVersion = $versions[0]
    }
}
