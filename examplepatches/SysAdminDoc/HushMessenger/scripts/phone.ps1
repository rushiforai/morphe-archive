<#
.SYNOPSIS
    Drives a phone for a quick check from any shell, one call at a time, under the shared device lease.

        pwsh -NoProfile -File scripts/phone.ps1 lease   <serial> <handle file> [purpose ...]
        pwsh -NoProfile -File scripts/phone.ps1 adb     <handle file> <adb arguments ...>
        pwsh -NoProfile -File scripts/phone.ps1 dump    <handle file> [text to look for]
        pwsh -NoProfile -File scripts/phone.ps1 release <handle file>

    lease creates <lease folder>\<serial>.json only when nobody holds it (CreateNew, so never over another lease,
    expired or not) and writes the serial and a fresh token to the handle file every later call names. Keep the
    handle somewhere only you use, so two people or sessions never drive a phone through one lease.

    Every adb and dump call checks the lease still carries the handle's token, then renews it for 30 minutes. A tap,
    swipe, key, app start or install also runs walk-app.ps1's call check first: a call or a ringing phone stops it,
    and so does, for a touch, anything in front other than Messenger or a permission prompt. The power and sleep keys
    are refused, since the phones wake with KEYCODE_WAKEUP and are never put to sleep.

    dump deletes the old XML on both ends first, so a failed dump never hands back the screen before, then prints
    every focused window, whether the keyboard is up, and one line per labeled node: text | description | id |
    bounds, with C for clickable and ON for checked. A dump is only good until the next scroll, sheet or Back.

    release deletes the lease and the handle once the token checks out. Release before any build or wait.

    HUSHMESSENGER_DEVICE_LEASE_DIR names the lease folder, HUSHMESSENGER_PHONE_PACKAGE the app a touch may land in
    (com.facebook.orca unless set), and ANDROID_HOME the SDK holding adb. There's no param block on purpose: adb's
    own flags (-d, -e, -n, -p) would bind to PowerShell's parameters.
#>

# Before walk-app.ps1 is dot-sourced, which brings its own $args into this scope.
$phoneArgs = [string[]]@($args)

# The walk's call check and input kinds. Dot-sourcing runs its param block here, setting $Serial, $Package, $Adb,
# $Root and its other parameters, so no name below matches one of them. Its main body doesn't run.
. (Join-Path $PSScriptRoot 'walk-app.ps1')

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

$PhoneLeaseMinutes = 30
$PhoneDumpOnDevice = '/sdcard/hushmessenger-phone-dump.xml'
$PhoneRefusedKey = '^(KEYCODE_)?(POWER|SLEEP|SOFT_SLEEP)$|^(26|223|276)$'

function Get-PhoneSetting([string]$Name) {
    # The process value, else the user's, so a variable set after this shell opened still counts.
    $value = [Environment]::GetEnvironmentVariable($Name)
    if (-not $value) { $value = [Environment]::GetEnvironmentVariable($Name, 'User') }
    return [string]$value
}

function Resolve-PhonePath([string]$Path) {
    return $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
}

function Get-PhoneAdbPath {
    $sdks = @((Get-PhoneSetting 'ANDROID_HOME'), (Get-PhoneSetting 'ANDROID_SDK_ROOT'), (Join-Path $env:LOCALAPPDATA 'Android\Sdk'))
    foreach ($sdk in $sdks | Where-Object { $_ }) {
        $candidate = Join-Path $sdk 'platform-tools\adb.exe'
        if (Test-Path -LiteralPath $candidate -PathType Leaf) { return $candidate }
    }
    $onPath = @(Get-Command adb -CommandType Application -ErrorAction SilentlyContinue)
    if ($onPath.Count -gt 0) { return $onPath[0].Source }
    throw 'No adb. Install the Android SDK platform tools or set ANDROID_HOME.'
}

function Get-PhoneLeaseFolder {
    $folder = Get-PhoneSetting 'HUSHMESSENGER_DEVICE_LEASE_DIR'
    if (-not $folder) { throw 'Set HUSHMESSENGER_DEVICE_LEASE_DIR to the shared device lease folder.' }
    return Resolve-PhonePath $folder
}

function Read-PhoneLeaseToken([string]$LeaseFile) {
    # The token by pattern, not ConvertFrom-Json, which turns the times into local DateTimes. Unreadable or half
    # written reads as '', which no handle matches, so it counts as someone else's.
    $text = try { [IO.File]::ReadAllText($LeaseFile) } catch { '' }
    if ($text -cmatch '"ownershipToken"\s*:\s*"([^"]+)"') { return $Matches[1] }
    return ''
}

function Read-PhoneHandle([string]$HandlePath) {
    $handleFile = Resolve-PhonePath $HandlePath
    if (-not (Test-Path -LiteralPath $handleFile -PathType Leaf)) {
        throw "No handle at $handleFile. Take the lease first: phone.ps1 lease <serial> $HandlePath"
    }
    $saved = [IO.File]::ReadAllText($handleFile) | ConvertFrom-Json
    $phoneSerial = [string]$saved.serial
    return [pscustomobject]@{
        Path = $handleFile; Serial = $phoneSerial; Token = [string]$saved.token
        Lease = Join-Path (Get-PhoneLeaseFolder) "$phoneSerial.json"; Adb = Get-PhoneAdbPath
    }
}

function Assert-PhoneLease($Handle) {
    if ((Read-PhoneLeaseToken $Handle.Lease) -cne $Handle.Token) {
        throw "BUSY: the lease on $($Handle.Serial) isn't this handle's any more. Nothing was sent."
    }
    $expires = [DateTime]::UtcNow.AddMinutes($PhoneLeaseMinutes).ToString('o')
    $text = [IO.File]::ReadAllText($Handle.Lease)
    [IO.File]::WriteAllText($Handle.Lease, ($text -creplace '"expiresUtc"\s*:\s*"[^"]*"', "`"expiresUtc`": `"$expires`""))
}

function Get-PhoneWords([string[]]$Arguments) {
    # adb shell "input tap 540 1200" arrives as one argument, so a shell command is split into words before it's judged.
    if ($Arguments.Count -lt 2 -or $Arguments[0] -cne 'shell') { return $Arguments }
    return [string[]](@('shell') + (($Arguments[1..($Arguments.Count - 1)] -join ' ') -split '\s+' | Where-Object { $_ }))
}

function Test-PhoneRefusedKey([string[]]$Words) {
    if ($Words.Count -lt 4 -or $Words[0] -cne 'shell' -or $Words[1] -cne 'input') { return $false }
    $at = [Array]::IndexOf($Words, 'keyevent')
    if ($at -lt 0 -or $at + 1 -ge $Words.Count) { return $false }
    return @($Words[($at + 1)..($Words.Count - 1)] | Where-Object { $_ -cmatch $PhoneRefusedKey }).Count -gt 0
}

function Invoke-PhoneAdb($Handle, [string[]]$Arguments) {
    $words = Get-PhoneWords $Arguments
    if (Test-PhoneRefusedKey $words) { throw 'Refused: the phones wake with KEYCODE_WAKEUP and never get the power or sleep key.' }
    Assert-PhoneLease $Handle
    $kind = Get-WalkInputKind $words
    $phonePackage = Get-PhoneSetting 'HUSHMESSENGER_PHONE_PACKAGE'
    if (-not $phonePackage) { $phonePackage = 'com.facebook.orca' }
    $preference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        if ($kind) {
            $probe = [string[]]@(& $Handle.Adb -s $Handle.Serial shell $WalkCallProbe 2>&1 | ForEach-Object { [string]$_ })
            $block = Get-WalkInputBlock -Lines $probe -Package $phonePackage -Touch ($kind -ceq 'touch')
            if ($block) { throw "BUSY: $block on $($Handle.Serial). Nothing was sent." }
        }
        $lines = [string[]]@(& $Handle.Adb -s $Handle.Serial @Arguments 2>&1 | ForEach-Object { [string]$_ })
        $exitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $preference
    }
    return [pscustomobject]@{ ExitCode = $exitCode; Lines = $lines }
}

function Invoke-PhoneLease([string]$PhoneSerial, [string]$HandlePath, [string]$Purpose) {
    if ($PhoneSerial -cnotmatch '^[\w.:-]+$') { throw "$PhoneSerial isn't an adb serial." }
    $handleFile = Resolve-PhonePath $HandlePath
    if (Test-Path -LiteralPath $handleFile) { throw "$handleFile already exists. Release it, or name a new handle." }
    $folder = Get-PhoneLeaseFolder
    [void][IO.Directory]::CreateDirectory($folder)
    $leaseFile = Join-Path $folder "$PhoneSerial.json"
    $token = [guid]::NewGuid().ToString()
    $now = [DateTime]::UtcNow
    $record = [ordered]@{
        schemaVersion = 1; serial = $PhoneSerial; project = 'HushMessenger'
        chatIdentity = "HushMessenger/phone.ps1/$([IO.Path]::GetFileName($handleFile))"; ownershipToken = $token
        acquiredUtc = $now.ToString('o'); expiresUtc = $now.AddMinutes($PhoneLeaseMinutes).ToString('o')
        purpose = $(if ($Purpose) { $Purpose } else { 'quick device check' })
    }
    try { $stream = [IO.File]::Open($leaseFile, [IO.FileMode]::CreateNew, [IO.FileAccess]::Write, [IO.FileShare]::None) }
    catch { throw "BUSY: $PhoneSerial is leased ($leaseFile). Nothing was taken." }
    try {
        $bytes = [Text.Encoding]::UTF8.GetBytes((ConvertTo-Json -InputObject $record))
        $stream.Write($bytes, 0, $bytes.Length)
    } finally {
        $stream.Dispose()
    }
    [IO.File]::WriteAllText($handleFile, (ConvertTo-Json -InputObject ([ordered]@{ serial = $PhoneSerial; token = $token }) -Compress))
    $handle = Read-PhoneHandle $handleFile
    $model = (Invoke-PhoneAdb $handle @('shell', 'getprop', 'ro.product.model'))
    if ($model.ExitCode -ne 0) {
        Invoke-PhoneRelease $handle | Out-Null
        throw "adb can't reach ${PhoneSerial}: $($model.Lines -join ' '). The lease was given back."
    }
    "Leased $PhoneSerial ($(([string]$model.Lines[0]).Trim())) until $($record.expiresUtc), renewed by every call. Release with: phone.ps1 release $HandlePath"
}

function Invoke-PhoneDump($Handle, [string]$Needle) {
    $local = Join-Path ([IO.Path]::GetDirectoryName($Handle.Path)) "$($Handle.Serial)-dump.xml"
    if (Test-Path -LiteralPath $local) { [IO.File]::Delete($local) }
    [void](Invoke-PhoneAdb $Handle @('shell', 'rm', '-f', $PhoneDumpOnDevice))
    foreach ($dumpArgs in @(, @('--windows')) + @(, @())) {
        [void](Invoke-PhoneAdb $Handle (@('shell', 'uiautomator', 'dump') + $dumpArgs + @($PhoneDumpOnDevice)))
        [void](Invoke-PhoneAdb $Handle @('pull', $PhoneDumpOnDevice, $local))
        if ((Test-Path -LiteralPath $local) -and (Get-Item -LiteralPath $local).Length -gt 0) { break }
    }
    [void](Invoke-PhoneAdb $Handle @('shell', 'rm', '-f', $PhoneDumpOnDevice))
    $focus = (Invoke-PhoneAdb $Handle @('shell', 'dumpsys window | grep mCurrentFocus=Window')).Lines
    foreach ($line in $focus | Where-Object { $_ -cnotmatch 'mCurrentFocus=null' }) { "focus: $($line.Trim())" }
    $keyboard = (Invoke-PhoneAdb $Handle @('shell', 'dumpsys input_method | grep -m1 mInputShown')).Lines -join ' '
    if ($keyboard -cmatch 'mInputShown=true') { 'keyboard: up, so rows under it still list but a tap there lands on the keys' }
    if (-not (Test-Path -LiteralPath $local) -or (Get-Item -LiteralPath $local).Length -eq 0) {
        throw "NO DUMP: uiautomator couldn't read the screen (a playing video or a blinking cursor stops it). Nothing older was used."
    }
    $tree = [xml][IO.File]::ReadAllText($local)
    foreach ($node in $tree.SelectNodes('//node')) {
        $text = $node.GetAttribute('text')
        $desc = $node.GetAttribute('content-desc')
        if (-not $text -and -not $desc) { continue }
        $id = @($node.GetAttribute('resource-id') -split '/')[-1]
        $row = '{0} | {1} | {2} | {3}{4}{5}' -f $text.Substring(0, [Math]::Min(70, $text.Length)),
            $desc.Substring(0, [Math]::Min(70, $desc.Length)), $id, $node.GetAttribute('bounds'),
            $(if ($node.GetAttribute('clickable') -ceq 'true') { ' C' } else { '' }),
            $(if ($node.GetAttribute('checked') -ceq 'true') { ' ON' } else { '' })
        if ($Needle -and $row.IndexOf($Needle, [StringComparison]::OrdinalIgnoreCase) -lt 0) { continue }
        $row
    }
}

function Invoke-PhoneRelease($Handle) {
    if ((Read-PhoneLeaseToken $Handle.Lease) -ceq $Handle.Token) {
        [IO.File]::Delete($Handle.Lease)
        "Released $($Handle.Serial)."
    } else {
        "The lease on $($Handle.Serial) isn't this handle's (gone, or someone else's now), so it was left alone."
    }
    [IO.File]::Delete($Handle.Path)
}

if ($MyInvocation.InvocationName -ne '.') {
    $usage = 'Usage: phone.ps1 lease <serial> <handle> [purpose] | adb <handle> <args> | dump <handle> [text] | release <handle>'
    $verb = if ($phoneArgs.Count -gt 0) { $phoneArgs[0] } else { '' }
    $rest = if ($phoneArgs.Count -gt 2) { [string[]]$phoneArgs[2..($phoneArgs.Count - 1)] } else { [string[]]@() }
    try {
        switch -CaseSensitive ($verb) {
            'lease' {
                if ($phoneArgs.Count -lt 3) { throw $usage }
                Invoke-PhoneLease -PhoneSerial $phoneArgs[1] -HandlePath $phoneArgs[2] `
                    -Purpose $(if ($phoneArgs.Count -gt 3) { $phoneArgs[3..($phoneArgs.Count - 1)] -join ' ' } else { '' })
            }
            'adb' {
                if ($phoneArgs.Count -lt 3) { throw $usage }
                $result = Invoke-PhoneAdb (Read-PhoneHandle $phoneArgs[1]) $rest
                $result.Lines
                exit $result.ExitCode
            }
            'dump' {
                if ($phoneArgs.Count -lt 2) { throw $usage }
                Invoke-PhoneDump (Read-PhoneHandle $phoneArgs[1]) ($rest -join ' ')
            }
            'release' {
                if ($phoneArgs.Count -lt 2) { throw $usage }
                Invoke-PhoneRelease (Read-PhoneHandle $phoneArgs[1])
            }
            default { throw $usage }
        }
    } catch {
        [Console]::Error.WriteLine($_.Exception.Message)
        exit 1
    }
}
