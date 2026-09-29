<#
.SYNOPSIS
    Shared guarded ADB operations for a replacement install.
#>

function Remove-AndroidPackageIfInstalled {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$PackageName
    )

    # Relaxed for the call: Windows PowerShell 5.1 throws on a native command's stderr under Stop,
    # even redirected, and adb's "daemon not running; starting now" is on stderr.
    $preference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $pathOutput = @(& $Adb -s $Serial shell pm path $PackageName 2>&1)
        $pathExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    if ($pathExitCode -ne 0) {
        $detail = @($pathOutput | ForEach-Object { [string]$_ }) -join ' '
        if ([string]::IsNullOrWhiteSpace($detail)) { $detail = "exit $pathExitCode" }
        throw "adb could not check $PackageName on ${Serial}: $detail"
    }
    $installedPaths = @($pathOutput | ForEach-Object { ([string]$_).Trim() } |
        Where-Object { $_.StartsWith('package:', [System.StringComparison]::Ordinal) })
    if ($installedPaths.Count -eq 0) {
        Write-Host "[device] $PackageName is not installed on $Serial; skipping uninstall"
        return $false
    }

    Write-Host "[device] uninstalling $PackageName on $Serial"
    & $Adb -s $Serial uninstall $PackageName | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "adb uninstall failed on $Serial." }
    return $true
}
