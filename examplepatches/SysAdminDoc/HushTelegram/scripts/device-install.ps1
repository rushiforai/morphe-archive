<#
.SYNOPSIS
    Install a same-signer update while retaining device data and permission grants.
#>

function Install-AndroidPackage {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$PackageName,
        [Parameter(Mandatory = $true)][string]$Apk,
        [Parameter(Mandatory = $true)][string]$Aapt2,
        [Parameter(Mandatory = $true)][string]$LeaseDirectory,
        [Parameter(Mandatory = $true)][string]$LeaseToken,
        [Parameter(Mandatory = $true)][string]$ChatIdentity,
        [Parameter(Mandatory = $true)][string]$ExpectedModel,
        [string]$ExpectedAvd,
        [Parameter(Mandatory = $true)][string]$WorkDirectory
    )

    if ($Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*$' -or $Serial -match '^\.\.?$') {
        throw 'The exact device serial must be safe as a lease filename.'
    }
    if ($PackageName -notmatch '^[a-zA-Z][a-zA-Z0-9_]*(\.[a-zA-Z][a-zA-Z0-9_]*)+$') {
        throw 'Invalid Android package name.'
    }
    if ($Serial.StartsWith('emulator-', [StringComparison]::Ordinal) -and -not $ExpectedAvd) {
        throw 'An emulator install requires its expected AVD profile.'
    }
    $LeaseDirectory = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($LeaseDirectory)
    $leasePath = Resolve-WithinRoot -Root $LeaseDirectory -Path (Join-Path $LeaseDirectory "$Serial.json")
    $WorkDirectory = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WorkDirectory)
    $runDirectory = Resolve-WithinRoot -Root $WorkDirectory -Path (Join-Path $WorkDirectory ("install-" + [guid]::NewGuid().ToString('N')))
    $installedApk = Resolve-WithinRoot -Root $runDirectory -Path (Join-Path $runDirectory 'installed.apk')

    # Every command, including read-only preflight, rechecks the whole-device lease. The fixed
    # argument array never goes through an ADB shell string assembled from report values.
    function Invoke-OwnedAdb {
        param([string[]]$Arguments)
        try {
            $lease = Get-Content -LiteralPath $leasePath -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
            $expires = if ($lease.expiresUtc -is [datetime]) { [DateTimeOffset]$lease.expiresUtc }
                else { [DateTimeOffset]::Parse([string]$lease.expiresUtc, [Globalization.CultureInfo]::InvariantCulture) }
            $acquired = if ($lease.acquiredUtc -is [datetime]) { [DateTimeOffset]$lease.acquiredUtc }
                else { [DateTimeOffset]::Parse([string]$lease.acquiredUtc, [Globalization.CultureInfo]::InvariantCulture) }
            $now = [DateTimeOffset]::UtcNow
            if ($lease.schemaVersion -ne 1 -or $lease.serial -cne $Serial -or
                $lease.project -cne 'HushTelegram' -or $lease.chatIdentity -cne $ChatIdentity -or
                $lease.ownershipToken -cne $LeaseToken -or $expires -le $now -or
                $acquired -gt $now -or $acquired -ge $expires) {
                throw 'Lease ownership or expiry does not permit this operation.'
            }
        } catch {
            throw 'The device needs an owned, unexpired HushTelegram lease for this chat.'
        }
        $global:LASTEXITCODE = -1
        $output = @(& $Adb -s $Serial @Arguments 2>&1 | ForEach-Object { [string]$_ })
        # Android can return 1 with no output when this exact package is absent. Only
        # that read may defer the error, and its caller must corroborate the absence.
        $absentPathResult = $LASTEXITCODE -eq 1 -and $output.Count -eq 0 -and
            $Arguments.Count -eq 4 -and $Arguments[0] -ceq 'shell' -and
            $Arguments[1] -ceq 'pm' -and $Arguments[2] -ceq 'path' -and
            $Arguments[3] -ceq $PackageName
        if ($LASTEXITCODE -ne 0 -and -not $absentPathResult) { throw "ADB $($Arguments[0]) failed on the selected device." }
        return $output
    }

    $state = @(Invoke-OwnedAdb -Arguments @('get-state')) -join "`n"
    if ($state.Trim() -cne 'device') { throw 'The selected device is disconnected or unauthorized.' }
    $reportedSerial = @(Invoke-OwnedAdb -Arguments @('get-serialno')) -join "`n"
    if ($reportedSerial.Trim() -cne $Serial) { throw 'ADB returned a different device serial.' }
    $model = @(Invoke-OwnedAdb -Arguments @('shell', 'getprop', 'ro.product.model')) -join "`n"
    if ($model.Trim() -cne $ExpectedModel) { throw 'The selected device model does not match.' }
    if ($ExpectedAvd) {
        $avd = @(Invoke-OwnedAdb -Arguments @('emu', 'avd', 'name'))
        if ($avd.Count -lt 1 -or $avd[0].Trim() -cne $ExpectedAvd) { throw 'The selected emulator profile does not match.' }
    }

    $candidate = Get-ApkManifestFacts -Apk $Apk -Aapt2 $Aapt2
    if ($candidate.package -cne $PackageName) { throw 'The candidate APK belongs to another package.' }
    if ([string]$candidate.versionCode -notmatch '^\d+$') { throw 'The candidate has no valid version code.' }
    $candidateSigners = @(Get-VendorSignerDigests -Apk $Apk -Aapt2 $Aapt2)
    if ($candidateSigners.Count -eq 0) { throw 'The candidate APK has no verified signer.' }
    $pathOutput = @(Invoke-OwnedAdb -Arguments @('shell', 'pm', 'path', $PackageName))
    $paths = @($pathOutput | Where-Object { $_.StartsWith('package:', [StringComparison]::Ordinal) })
    if (@($pathOutput | Where-Object { $_.Trim() -and -not $_.StartsWith('package:', [StringComparison]::Ordinal) }).Count -gt 0) {
        throw 'The installed package could not be checked.'
    }
    if ($paths.Count -eq 0) {
        if ($pathOutput.Count -ne 0) { throw 'The installed package could not be checked.' }
        $inventory = @(Invoke-OwnedAdb -Arguments @('shell', 'pm', 'list', 'packages'))
        $packages = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
        foreach ($entry in $inventory) {
            if ($entry -cnotmatch '^package:[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)*$' -or
                -not $packages.Add($entry.Substring('package:'.Length))) {
                throw 'The installed package inventory could not be verified.'
            }
        }
        if (-not $packages.Contains('android') -or $packages.Contains($PackageName)) {
            throw 'The installed package inventory did not confirm absence.'
        }
    }
    New-Item -ItemType Directory -Force -Path $runDirectory | Out-Null
    try {
        if ($paths.Count -gt 0) {
            $base = @($paths | Where-Object { $_.EndsWith('/base.apk', [StringComparison]::Ordinal) })
            if ($base.Count -eq 0 -and $paths.Count -eq 1) { $base = @($paths[0]) }
            if ($base.Count -ne 1) { throw 'The installed base APK could not be identified.' }
            $remote = $base[0].Substring('package:'.Length)
            if (-not $remote.StartsWith('/', [StringComparison]::Ordinal) -or $remote.Contains("`n") -or $remote.Contains("`r")) {
                throw 'The installed APK path is invalid.'
            }
            [void](Invoke-OwnedAdb -Arguments @('pull', $remote, $installedApk))
            $current = Get-ApkManifestFacts -Apk $installedApk -Aapt2 $Aapt2
            if ($current.package -cne $PackageName -or [string]$current.versionCode -notmatch '^\d+$') {
                throw 'The installed APK identity could not be verified.'
            }
            $currentSigners = @(Get-VendorSignerDigests -Apk $installedApk -Aapt2 $Aapt2)
            if ($currentSigners.Count -eq 0 -or
                (($candidateSigners | Sort-Object -Unique) -join ',') -cne (($currentSigners | Sort-Object -Unique) -join ',')) {
                throw 'The installed signer differs. Keep its data and use the retained signing key.'
            }
            if ([long]$candidate.versionCode -lt [long]$current.versionCode) {
                throw 'A downgrade was refused before installation.'
            }
        }
        $answer = @(Invoke-OwnedAdb -Arguments @('install', '-r', $Apk))
        if (-not ($answer | Where-Object { $_.Trim() -ceq 'Success' })) { throw 'ADB did not confirm a successful install.' }
        Write-Host "[device] installed $PackageName on $Serial without uninstalling or granting permissions"
    } finally {
        Remove-GeneratedPath -Root $WorkDirectory -Path $runDirectory
    }
}
