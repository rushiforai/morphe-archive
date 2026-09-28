<#
.SYNOPSIS
    Read the app target and the exact versions shared by every patch in a generated catalog.

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
    # The first patch to name each package, and the builds it declared. Every other patch has to
    # declare the same ones: a build only some patches support is one the bundle can't fully patch,
    # and a union of them would hand the release scripts that build as a declared target.
    $declaredBy = @{}
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
            $declared = @($versions | Sort-Object -Unique) -join ', '
            if (-not $targets.ContainsKey($property.Name)) {
                $targets[$property.Name] = $versions
                $declaredBy[$property.Name] = @($patchName, $declared)
            } elseif ($declaredBy[$property.Name][1] -ne $declared) {
                throw ("Every patch has to declare the same $($property.Name) builds: " +
                    "$($declaredBy[$property.Name][0]) declares $($declaredBy[$property.Name][1]), " +
                    "but $patchName declares $declared.")
            }
        }
    }

    $packages = @($targets.Keys | Sort-Object)
    if ($packages.Count -ne 1) {
        throw "Expected one compatible package, found $($packages -join ', ')."
    }
    $packageName = $packages[0]
    # Every version the catalog declares, newest first. Facebook moves a release a week, so the
    # bundle declares the build it was last proved on and keeps the one before it; the newest is
    # the one a device build and the README name. Compared part by part as numbers, every part:
    # Facebook's versions have five (580.0.0.51.74) and [version] takes four, so the fifth was
    # dropped, and two builds apart only there sorted as equals in whatever order the shell left
    # them, the older one first in both.
    $declared = @($targets[$packageName] | Sort-Object -Unique)
    if ($declared.Count -eq 0) {
        throw "No compatible version for $packageName."
    }
    foreach ($version in $declared) {
        if ($version -notmatch '^\d+(?:\.\d+)*$') {
            throw "$packageName is declared at $version, which isn't a version of dotted numbers."
        }
    }
    $width = ($declared | ForEach-Object { @($_ -split '\.').Count } | Measure-Object -Maximum).Maximum
    # One sort key per part, a missing part below any number, so 580.0.0.51 comes after 580.0.0.51.0.
    $keys = @(0..($width - 1) | ForEach-Object {
        $part = $_
        { $parts = @($_ -split '\.'); if ($part -lt $parts.Count) { [decimal]$parts[$part] } else { [decimal]-1 } }.GetNewClosure()
    })
    $versions = @($declared | Sort-Object -Descending -Property $keys)
    return [pscustomobject]@{
        PackageName = $packageName
        PackageVersion = $versions[0]
        PackageVersions = [string[]]$versions
    }
}
