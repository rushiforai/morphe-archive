<#
.SYNOPSIS
    Shared guarded ADB operations for a replacement install.
#>

function Assert-InstalledApkSigner {
    param(
        [string]$Adb, [string]$Serial, [string]$PackageName, $SigningSession,
        [switch]$RequireInstalled
    )

    $preference = $ErrorActionPreference
    $checkDirectory = $null
    try {
        $ErrorActionPreference = 'Continue'
        $paths = @(& $Adb -s $Serial shell pm path $PackageName 2>&1)
        $status = $LASTEXITCODE
        $ErrorActionPreference = $preference
        if ($status -ne 0) { throw "adb could not check the installed package $PackageName." }
        $paths = @($paths | ForEach-Object { ([string]$_).Trim() } |
            Where-Object { $_.StartsWith('package:', [StringComparison]::Ordinal) } |
            ForEach-Object { $_.Substring(8) })
        if ($paths.Count -eq 0) {
            if ($RequireInstalled) { throw "$PackageName must be installed before installing its verification probe." }
            return
        }
        $base = @($paths | Where-Object { $_ -match '/base\.apk$' })
        if ($base.Count -eq 0 -and $paths.Count -eq 1) { $base = $paths }
        if ($base.Count -ne 1) { throw "adb returned no unique base APK for $PackageName." }
        $temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
        $checkDirectory = Resolve-WithinRoot -Root $temporaryRoot `
            -Path (Join-Path $temporaryRoot ('hushfeed-signer-' + [Guid]::NewGuid().ToString('N')))
        New-Item -ItemType Directory -Path $checkDirectory | Out-Null
        $installedApk = Join-Path $checkDirectory 'installed.apk'
        $ErrorActionPreference = 'Continue'
        $pullOutput = @(& $Adb -s $Serial pull $base[0] $installedApk 2>&1)
        $status = $LASTEXITCODE
        $ErrorActionPreference = $preference
        if ($status -ne 0) { throw "adb could not read the installed base APK for $PackageName." }
        if ((Get-ApkSigningCertificate -Session $SigningSession -Apk $installedApk) -ne $SigningSession.Certificate) {
            throw "The installed $PackageName has a different signing certificate. Export its signing key before an in-place update."
        }
    } finally {
        $ErrorActionPreference = $preference
        if ($checkDirectory -and (Test-Path -LiteralPath $checkDirectory)) {
            [void](Resolve-WithinRoot -Root ([IO.Path]::GetFullPath([IO.Path]::GetTempPath())) -Path $checkDirectory)
            Remove-Item -LiteralPath $checkDirectory -Recurse -Force
        }
    }
}

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
