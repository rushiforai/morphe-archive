<# Exclusive whole-device leases. Expiration is never permission to steal a device. #>
function Invoke-HushPinterestAdbCommand {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Adb, [Parameter(Mandatory)][string[]]$Arguments,
        [scriptblock]$Invoker)
    if ($Invoker) {
        $result = & $Invoker $Adb $Arguments
        if ($null -eq $result -or $null -eq $result.ExitCode) { throw 'The ADB invoker returned no exit code.' }
        return [pscustomobject]@{ ExitCode = [int]$result.ExitCode; Output = @($result.Output | ForEach-Object { "$_" }) }
    }
    $PSNativeCommandUseErrorActionPreference = $false
    $output = @(& $Adb @Arguments 2>&1 | ForEach-Object { "$_" })
    [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output }
}

function Format-HushPinterestAdbFailure {
    param([string]$Message, $Result)
    $detail = @($Result.Output | Select-Object -First 3) -join '; '
    $suffix = if ([string]::IsNullOrWhiteSpace($detail)) { '' } else { " Output: $detail" }
    "$Message (ADB exit $($Result.ExitCode)).$suffix"
}

function Read-HushLeaseRecord($Stream) {
    if ($Stream.Length -gt 32768) { throw 'Invalid device lease size.' }
    $bytes = [byte[]]::new([int]$Stream.Length)
    $Stream.Position = 0
    $read = $Stream.Read($bytes, 0, $bytes.Length)
    if ($read -ne $bytes.Length) { throw 'Incomplete device lease.' }
    $json = [Text.Encoding]::UTF8.GetString($bytes)
    # PowerShell 7.5 converts ISO dates to local DateTime unless told to preserve the strings.
    $record = if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
        $json | ConvertFrom-Json -DateKind String
    } else { $json | ConvertFrom-Json }
    if ($record.schemaVersion -ne 1 -or -not $record.project -or -not $record.chatIdentity -or
        -not $record.ownershipToken -or -not $record.serial) { throw 'Invalid device lease identity.' }
    $expiry = [DateTimeOffset]::Parse($record.expiresUtc)
    if ($expiry.Offset -ne [TimeSpan]::Zero) { throw 'Device lease expiry must be UTC.' }
    return $record
}

function Write-HushLeaseRecord($Stream, $Record) {
    $bytes = [Text.Encoding]::UTF8.GetBytes(($Record | ConvertTo-Json -Compress))
    $Stream.Position = 0
    $Stream.SetLength(0)
    $Stream.Write($bytes, 0, $bytes.Length)
    $Stream.Flush($true)
}

function Renew-HushDeviceLease {
    param([Parameter(Mandatory)]$Lease)
    $stream = [IO.File]::Open($Lease.Path, [IO.FileMode]::Open, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    try {
        $record = Read-HushLeaseRecord $stream
        if ($record.serial -ne $Lease.Serial -or $record.project -ne $Lease.Project -or
            $record.chatIdentity -ne $Lease.ChatIdentity -or $record.ownershipToken -cne $Lease.Token) {
            throw 'Device lease ownership changed. Mutation refused.'
        }
        if ([DateTimeOffset]::Parse($record.expiresUtc) -le [DateTimeOffset]::UtcNow) {
            throw 'Device lease expired. Confirm the previous test stopped before reclaiming it.'
        }
        $record.expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes($Lease.Minutes).ToString('o')
        Write-HushLeaseRecord $stream $record
    } finally { $stream.Dispose() }
}

function Exit-HushDeviceLease {
    param($Lease)
    if (-not $Lease -or -not $Lease.Owned) { return }
    if (-not (Test-Path -LiteralPath $Lease.Path)) { throw 'Owned device lease disappeared.' }
    $stream = [IO.File]::Open($Lease.Path, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::None)
    try {
        $record = Read-HushLeaseRecord $stream
        if ($record.ownershipToken -cne $Lease.Token -or $record.serial -ne $Lease.Serial) {
            throw 'Device lease ownership changed. Release refused.'
        }
    } finally { $stream.Dispose() }
    Remove-Item -LiteralPath $Lease.Path -ErrorAction Stop
}

function Get-HushDeviceIdentity {
    param([string]$Adb, [string]$Serial, [scriptblock]$AdbInvoker)
    $values = @{}
    foreach ($query in @(
        @{ Name = 'State'; Args = @('get-state') },
        @{ Name = 'Serial'; Args = @('get-serialno') },
        @{ Name = 'Model'; Args = @('shell', 'getprop', 'ro.product.model') },
        @{ Name = 'Build'; Args = @('shell', 'getprop', 'ro.build.fingerprint') },
        @{ Name = 'Api'; Args = @('shell', 'getprop', 'ro.build.version.sdk') },
        @{ Name = 'Abi'; Args = @('shell', 'getprop', 'ro.product.cpu.abi') }
    )) {
        $reply = Invoke-HushPinterestAdbCommand -Adb $Adb -Invoker $AdbInvoker -Arguments (@('-s', $Serial) + $query.Args)
        if ($reply.ExitCode -ne 0) { throw (Format-HushPinterestAdbFailure "Device identity check failed" $reply) }
        $values[$query.Name] = ($reply.Output -join '').Trim()
    }
    if ($values.State -ne 'device' -or $values.Serial -cne $Serial -or -not $values.Model -or
        -not $values.Build -or $values.Api -notmatch '^\d+$' -or [int]$values.Api -lt 28 -or -not $values.Abi) {
        throw "Device identity refused for $Serial. Expected a ready API 28+ device with the exact serial."
    }
    if ($Serial -like 'emulator-*') {
        $reply = Invoke-HushPinterestAdbCommand -Adb $Adb -Invoker $AdbInvoker -Arguments @('-s', $Serial, 'emu', 'avd', 'name')
        $values.Avd = @($reply.Output | Where-Object { $_ -and $_ -ne 'OK' }) -join ''
        if ($reply.ExitCode -ne 0 -or -not $values.Avd) { throw 'Emulator identity check failed.' }
    }
    return [pscustomobject]$values
}

function Confirm-HushLeasedDevice {
    param([string]$Adb, $Lease, [scriptblock]$Invoker, $Identity)
    Renew-HushDeviceLease $Lease
    if (-not $Identity) { $Identity = Get-HushDeviceIdentity -Adb $Adb -Serial $Lease.Serial -AdbInvoker $Invoker }
    $stream = [IO.File]::Open($Lease.Path, [IO.FileMode]::Open, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    try {
        $record = Read-HushLeaseRecord $stream
        if ($record.serial -cne $Lease.Serial -or $record.project -cne $Lease.Project -or
            $record.chatIdentity -cne $Lease.ChatIdentity -or $record.ownershipToken -cne $Lease.Token) {
            throw 'Device lease ownership changed. Identity binding refused.'
        }
        if ($record.expectedIdentity -and $record.expectedIdentity -cne $Identity.Avd -and
            $record.expectedIdentity -cne $Identity.Model) { throw 'Device identity differs from its caller lease.' }
        $fields = @('Serial', 'Model', 'Build', 'Api', 'Abi', 'Avd')
        if ($record.deviceIdentity) {
            foreach ($field in $fields) {
                if (-not $record.deviceIdentity.PSObject.Properties[$field] -or
                    [string]$record.deviceIdentity.$field -cne [string]$Identity.$field) {
                    throw 'Device identity changed at the leased serial. Mutation refused.'
                }
            }
        } else {
            if (-not $Lease.Owned -and -not $record.expectedIdentity) {
                throw 'The caller lease has no original device identity or expected profile. Mutation refused.'
            }
            $snapshot = [ordered]@{}
            foreach ($field in $fields) { $snapshot[$field] = [string]$Identity.$field }
            $record | Add-Member -NotePropertyName deviceIdentity -NotePropertyValue ([pscustomobject]$snapshot) -Force
            Write-HushLeaseRecord $stream $record
        }
        return $Identity
    } finally { $stream.Dispose() }
}

function Enter-HushDeviceLease {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Adb, [Parameter(Mandatory)][string]$Serial,
        [string]$Project = 'HushPinterest', [string]$ChatIdentity = $env:HUSHPINTEREST_CHAT_ID,
        [string]$LeaseToken = $env:HUSHPINTEREST_DEVICE_LEASE_TOKEN,
        [string]$LeaseDirectory = $env:HUSHPINTEREST_DEVICE_LEASE_DIR,
        [ValidateRange(1, 120)][int]$Minutes = 30, [scriptblock]$AdbInvoker)
    if ($Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*$') { throw 'An exact filesystem-safe device serial is required.' }
    if (-not $LeaseDirectory) {
        $LeaseDirectory = [Environment]::GetEnvironmentVariable('HUSHPINTEREST_DEVICE_LEASE_DIR', [EnvironmentVariableTarget]::User)
    }
    if (-not $LeaseDirectory) { throw 'Set HUSHPINTEREST_DEVICE_LEASE_DIR to the shared device pool lease directory.' }
    $directory = [IO.Path]::GetFullPath($LeaseDirectory)
    [void][IO.Directory]::CreateDirectory($directory)
    $path = Join-Path $directory "$Serial.json"
    $owned = $false
    if ($LeaseToken) {
        $stream = [IO.File]::Open($path, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::None)
        try { $record = Read-HushLeaseRecord $stream } finally { $stream.Dispose() }
        if ($record.serial -cne $Serial -or $record.project -cne $Project -or
            $record.ownershipToken -cne $LeaseToken -or ($ChatIdentity -and $record.chatIdentity -cne $ChatIdentity)) {
            throw "Device $Serial is leased to another caller."
        }
        $ChatIdentity = $record.chatIdentity
    } else {
        if (-not $ChatIdentity) { $ChatIdentity = "local-process-$PID" }
        $LeaseToken = [guid]::NewGuid().ToString('D')
        try { $stream = [IO.File]::Open($path, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None) }
        catch [IO.IOException] {
            if (-not (Test-Path -LiteralPath $path)) { throw }
            $held = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
            if ([DateTimeOffset]::Parse($held.expiresUtc) -le [DateTimeOffset]::UtcNow) {
                throw "Device $Serial has an expired lease. Confirm the previous test stopped before removing it."
            }
            throw "Device $Serial is leased to another caller."
        }
        try {
            Write-HushLeaseRecord $stream ([pscustomobject]@{ schemaVersion = 1; serial = $Serial;
                project = $Project; chatIdentity = $ChatIdentity; ownershipToken = $LeaseToken;
                acquiredUtc = [DateTimeOffset]::UtcNow.ToString('o'); expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes($Minutes).ToString('o');
                purpose = 'Guarded development install or device test'; processId = $PID })
            $owned = $true
        } finally { $stream.Dispose() }
    }
    $lease = [pscustomobject]@{ Path = $path; Serial = $Serial; Project = $Project;
        ChatIdentity = $ChatIdentity; Token = $LeaseToken; Owned = $owned; Minutes = $Minutes; Identity = $null }
    try {
        Renew-HushDeviceLease $lease
        $lease.Identity = Get-HushDeviceIdentity -Adb $Adb -Serial $Serial -AdbInvoker $AdbInvoker
        $lease.Identity = Confirm-HushLeasedDevice -Adb $Adb -Lease $lease -Invoker $AdbInvoker -Identity $lease.Identity
        Write-Host "[device] $Serial $($lease.Identity.Model), API $($lease.Identity.Api), $($lease.Identity.Build) $($lease.Identity.Avd)"
        return $lease
    } catch { Exit-HushDeviceLease $lease; throw }
}

function Invoke-HushLeasedAdb {
    param([string]$Adb, [Parameter(Mandatory)]$Lease, [string[]]$Arguments, [scriptblock]$Invoker)
    [void](Confirm-HushLeasedDevice -Adb $Adb -Lease $Lease -Invoker $Invoker)
    Invoke-HushPinterestAdbCommand -Adb $Adb -Invoker $Invoker -Arguments (@('-s', $Lease.Serial) + $Arguments)
}
