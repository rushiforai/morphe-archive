<#
.SYNOPSIS
    Shared device-lease checks and ADB execution. Existing apps and data are preserved.
#>

function Invoke-HushThreadsAdbCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string[]]$Arguments,
        [scriptblock]$Invoker,
        [switch]$RequireLease
    )

    if ($RequireLease) {
        if ($Arguments.Count -lt 3 -or $Arguments[0] -cne '-s') { throw 'A leased ADB command needs an exact -s serial.' }
        return (Assert-HushThreadsDeviceLease -Adb $Adb -Serial $Arguments[1] -AdbInvoker $Invoker -Operation { Invoke-HushThreadsAdbCommand -Adb $Adb -Arguments $Arguments -Invoker $Invoker })
    }
    if ($Invoker) {
        $result = & $Invoker $Adb $Arguments
        if ($null -eq $result -or $null -eq $result.ExitCode) {
            throw 'The ADB invoker returned no exit code.'
        }
        return [pscustomobject]@{
            ExitCode = [int]$result.ExitCode
            Output = @($result.Output | ForEach-Object { "$_" })
        }
    }

    $PSNativeCommandUseErrorActionPreference = $false
    $output = @(& $Adb @Arguments 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output }
}

function Assert-HushThreadsDeviceLease {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [string]$OwnershipToken = $env:HUSHTHREADS_DEVICE_LEASE_TOKEN,
        [string]$ExpectedIdentity = $env:HUSHTHREADS_DEVICE_IDENTITY,
        [string]$LeaseDirectory = $env:HUSHTHREADS_DEVICE_LEASE_DIR,
        [scriptblock]$AdbInvoker,
        [scriptblock]$Operation
    )

    if ($Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$') { throw 'Invalid device lease serial.' }
    if ([string]::IsNullOrWhiteSpace($OwnershipToken) -or [string]::IsNullOrWhiteSpace($ExpectedIdentity) -or
        [string]::IsNullOrWhiteSpace($LeaseDirectory)) {
        throw 'Device testing needs HUSHTHREADS_DEVICE_LEASE_DIR, HUSHTHREADS_DEVICE_LEASE_TOKEN and HUSHTHREADS_DEVICE_IDENTITY.'
    }
    $path = Join-Path $LeaseDirectory ($Serial + '.json')
    try {
        $stream = [IO.File]::Open($path, [IO.FileMode]::Open, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    } catch [IO.IOException] {
        throw "No readable exclusive device lease for $Serial. Acquire it before device testing."
    }
    try {
        $reader = [IO.StreamReader]::new($stream, [Text.UTF8Encoding]::new($false), $false, 4096, $true)
        try { $raw = $reader.ReadToEnd() } finally { $reader.Dispose() }
        try { $lease = $raw | ConvertFrom-Json -ErrorAction Stop }
        catch { throw "Invalid device lease for $Serial." }
        if ($lease.schemaVersion -ne 1 -or $lease.project -cne 'HushThreads' -or
            $lease.serial -cne $Serial -or [string]::IsNullOrWhiteSpace($lease.chatIdentity) -or
            -not [string]::Equals($lease.ownershipToken, $OwnershipToken, [StringComparison]::Ordinal)) {
            throw "The device lease for $Serial belongs to another project or chat."
        }
        $expiry = [DateTimeOffset]::MinValue
        if (-not [DateTimeOffset]::TryParse([string]$lease.expiresUtc, [ref]$expiry) -or
            $expiry -le [DateTimeOffset]::UtcNow) {
            throw "The device lease for $Serial is expired or has no valid UTC expiration."
        }
        $serialRead = Invoke-HushThreadsAdbCommand -Adb $Adb -Invoker $AdbInvoker -Arguments @('-s', $Serial, 'get-serialno')
        if ($serialRead.ExitCode -ne 0 -or (($serialRead.Output -join '').Trim()) -cne $Serial) {
            throw "ADB identity does not match leased serial $Serial."
        }
        $identityArgs = if ($Serial.StartsWith('emulator-', [StringComparison]::Ordinal)) {
            @('-s', $Serial, 'emu', 'avd', 'name')
        } else { @('-s', $Serial, 'shell', 'getprop', 'ro.product.model') }
        $identityRead = Invoke-HushThreadsAdbCommand -Adb $Adb -Invoker $AdbInvoker -Arguments $identityArgs
        $identityLines = @($identityRead.Output | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        if ($Serial.StartsWith('emulator-', [StringComparison]::Ordinal) -and
            $identityLines.Count -gt 1 -and $identityLines[-1] -ceq 'OK') {
            $identityLines = $identityLines[0..($identityLines.Count - 2)]
        }
        $identity = $identityLines -join ''
        if ($identityRead.ExitCode -ne 0 -or $identity -cne $ExpectedIdentity) {
            throw "Device identity does not match HUSHTHREADS_DEVICE_IDENTITY for $Serial."
        }
        if ($expiry -le [DateTimeOffset]::UtcNow) { throw "The device lease for $Serial expired during identity verification." }
        # Renew only the token-checked lease held open exclusively. Never reclaim an expired lease.
        $lease.expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes(20).ToString('o')
        $bytes = [Text.UTF8Encoding]::new($false).GetBytes(($lease | ConvertTo-Json -Depth 8))
        $stream.Position = 0
        $stream.SetLength(0)
        $stream.Write($bytes, 0, $bytes.Length)
        $stream.Flush($true)
        if ($Operation) { return (& $Operation) }
    } finally { $stream.Dispose() }
}

# Older callers get a refusal before ADB runs, rather than silently losing an account.
function Remove-AndroidPackageIfInstalled {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)][string]$Adb,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$PackageName
    )
    throw 'Replacement uninstall is disabled. Repatch with the installed signing key to preserve apps, accounts and data.'
}
