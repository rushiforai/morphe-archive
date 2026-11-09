<#
.SYNOPSIS
    Build or run bounded native settings navigation checks on an exclusively leased API28/36.
.DESCRIPTION
    BuildOnly needs a JDK, Android API36 jar and SDK build-tools. Sign its unsigned probe with
    the installed target's retained key, and install that separate probe before Run. This script
    never installs, grants permissions, clears data or changes a saved switch. A full settings
    build and a working installed software keyboard are required. RTL is a scoped ar-XB process
    configuration, verified through the real service tree, not a system-language change.

    Each ADB operation checks the exact whole-device lease and refreshes serial/model/API/build
    and emulator profile identity. A recovery JSON is written before temporary font/navigation/
    keyboard changes. Finally restores exact present/absent settings and the navigation overlay.
    If ownership is lost, recovery is retained and no further device commands are authorized.
    RestoreState can replay that record after ownership is legitimately reacquired.
    Set HUSHTELEGRAM_DEVICE_LEASE_DIRECTORY to the host's shared whole-device lease directory.
    Device runs refuse an unset configuration or a LeaseDirectory outside that shared pool.
#>
[CmdletBinding()]
param(
    [switch]$BuildOnly,
    [string]$RestoreState,
    [string]$Serial, [string]$ExpectedModel, [string]$ExpectedAvd,
    [ValidateSet(28, 36)][int]$ExpectedApi = 36,
    [string]$LeaseDirectory, [string]$LeaseToken, [string]$ChatIdentity,
    [string]$PackageName = 'org.telegram.messenger.web',
    [string]$Activity = 'org.telegram.ui.LaunchActivity',
    [string]$ProbeApk, [string]$Adb, [string]$Aapt2, [string]$Java, [string]$D8,
    [string]$AndroidJar, [string]$WorkDirectory
)

. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')
. (Join-Path $PSScriptRoot 'settings-navigation-lease.ps1')

function Invoke-NavigationProcess {
    param([string]$Executable, [string[]]$Arguments, [int]$TimeoutMs = 15000)
    $start = [Diagnostics.ProcessStartInfo]::new()
    $start.FileName = $Executable
    # Windows PowerShell lacks ProcessStartInfo.ArgumentList. Preserve each native argv word.
    $quoted = foreach ($argument in $Arguments) {
        $escaped = [regex]::Replace($argument, '(\\*)"', '$1$1\"')
        $escaped = [regex]::Replace($escaped, '(\\+)$', '$1$1')
        '"' + $escaped + '"'
    }
    $start.Arguments = $quoted -join ' '
    $start.UseShellExecute = $false; $start.CreateNoWindow = $true
    $start.RedirectStandardOutput = $true; $start.RedirectStandardError = $true
    $process = [Diagnostics.Process]::new(); $process.StartInfo = $start
    try {
        if (-not $process.Start()) { throw 'Could not start the device command.' }
        $stdout = $process.StandardOutput.ReadToEndAsync(); $stderr = $process.StandardError.ReadToEndAsync()
        $finished = $process.WaitForExit($TimeoutMs)
        if (-not $finished) { $process.Kill(); [void]$process.WaitForExit(5000) }
        if (-not [Threading.Tasks.Task]::WaitAll([Threading.Tasks.Task[]]@($stdout, $stderr), 5000)) {
            throw 'Device command output did not close within the bounded deadline.'
        }
        $output = [Collections.Generic.List[string]]::new()
        foreach ($stream in @($stdout.GetAwaiter().GetResult(), $stderr.GetAwaiter().GetResult())) {
            if (-not $stream) { continue }
            foreach ($line in @($stream.TrimEnd("`r", "`n") -split '\r?\n')) { $output.Add($line) }
        }
        [pscustomobject]@{ ExitCode = if ($finished) { $process.ExitCode } else { -1 }; Output = $output.ToArray(); TimedOut = -not $finished }
    } finally { $process.Dispose() }
}

function New-NavigationSession {
    param([string]$Adb, [string]$Serial, [string]$ExpectedModel, [string]$ExpectedAvd,
        [int]$ExpectedApi, [string]$LeaseDirectory, [string]$LeaseToken, [string]$ChatIdentity,
        [scriptblock]$Invoker)
    if ($Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*$' -or $Serial -match '^\.\.?$' -or
        -not $ExpectedModel -or $ExpectedApi -notin @(28, 36) -or -not $LeaseToken -or -not $ChatIdentity) {
        throw 'Exact serial, model, API28/36 and lease ownership are required.'
    }
    if ($Serial.StartsWith('emulator-', [StringComparison]::Ordinal) -and -not $ExpectedAvd) {
        throw 'An emulator test requires its expected AVD profile.'
    }
    # The same answer the installer gets: the host's shared pool, or a directory of the caller's
    # own only beside an injected invoker.
    $leaseRoot = Resolve-DeviceLeaseDirectory -LeaseDirectory $LeaseDirectory -TestInvoker $Invoker
    if (-not $Invoker) {
        $Invoker = {
            param($Executable, [string[]]$Arguments)
            $timeout = if ($Arguments.Count -gt 4 -and $Arguments[2] -ceq 'shell' -and $Arguments[3] -ceq 'am' -and $Arguments[4] -ceq 'instrument') { 120000 } else { 15000 }
            Invoke-NavigationProcess $Executable $Arguments $timeout
        }
    }
    [pscustomobject]@{ Adb = $Adb; Serial = $Serial; Model = $ExpectedModel; Avd = $ExpectedAvd;
        Api = $ExpectedApi; Token = $LeaseToken; Chat = $ChatIdentity; Invoker = $Invoker;
        Lease = (Resolve-WithinRoot -Root $leaseRoot -Path (Join-Path $leaseRoot "$Serial.json"));
        Fingerprint = $null; Expires = $null; InstrumentationUnfinished = $false }
}

function Assert-NavigationLease {
    param($Session)
    try {
        $lease = Get-Content -LiteralPath $Session.Lease -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop
        $expires = if ($lease.expiresUtc -is [datetime]) { [DateTimeOffset]$lease.expiresUtc }
            else { [DateTimeOffset]::Parse([string]$lease.expiresUtc, [Globalization.CultureInfo]::InvariantCulture) }
        $acquired = if ($lease.acquiredUtc -is [datetime]) { [DateTimeOffset]$lease.acquiredUtc }
            else { [DateTimeOffset]::Parse([string]$lease.acquiredUtc, [Globalization.CultureInfo]::InvariantCulture) }
        $now = [DateTimeOffset]::UtcNow
        if (($lease.schemaVersion -isnot [int] -and $lease.schemaVersion -isnot [long]) -or $lease.schemaVersion -ne 1 -or
            $lease.serial -cne $Session.Serial -or $lease.project -cne 'HushTelegram' -or
            $lease.chatIdentity -cne $Session.Chat -or $lease.ownershipToken -cne $Session.Token -or
            $expires -le $now -or $acquired -gt $now -or $acquired -ge $expires) { throw 'Invalid lease.' }
        $Session.Expires = $expires
    } catch { throw 'The device needs an owned, unexpired HushTelegram whole-device lease for this chat.' }
}

function Invoke-NavigationRawAdb {
    param($Session, [string[]]$Arguments)
    Assert-NavigationLease $Session
    $answer = & $Session.Invoker $Session.Adb (@('-s', $Session.Serial) + $Arguments)
    if ($answer.TimedOut) {
        $stage = @($answer.Output | Where-Object { $_ -match 'NAV_STAGE:[A-Za-z ]+$' } | Select-Object -Last 1)
        $detail = if ($stage.Count) { ' Last navigation stage: ' + $stage[0].Substring($stage[0].IndexOf('NAV_STAGE:') + 10) + '.' } else { '' }
        throw "ADB $($Arguments[0]) timed out on the selected device.$detail"
    }
    if ($null -eq $answer -or $answer.ExitCode -ne 0) { throw "ADB $($Arguments[0]) failed on the selected device." }
    return @($answer.Output)
}

function Invoke-NavigationAdb {
    param($Session, [string[]]$Arguments)
    foreach ($check in @(
        @{ Args = @('get-state'); Value = 'device' },
        @{ Args = @('get-serialno'); Value = $Session.Serial },
        @{ Args = @('shell', 'am', 'get-current-user'); Value = '0' },
        @{ Args = @('shell', 'getprop', 'ro.product.model'); Value = $Session.Model },
        @{ Args = @('shell', 'getprop', 'ro.build.version.sdk'); Value = [string]$Session.Api }
    )) {
        $value = @(Invoke-NavigationRawAdb $Session $check.Args)
        if ($value.Count -ne 1 -or ([string]$value[0]).Trim() -cne $check.Value) { throw 'Selected device identity changed or is ambiguous.' }
    }
    $fingerprint = @(Invoke-NavigationRawAdb $Session @('shell', 'getprop', 'ro.build.fingerprint'))
    if ($fingerprint.Count -ne 1 -or -not ([string]$fingerprint[0]).Trim()) { throw 'No unique device build identity.' }
    $actual = ([string]$fingerprint[0]).Trim()
    if ($Session.Fingerprint -and $Session.Fingerprint -cne $actual) { throw 'Selected device build changed.' }
    $Session.Fingerprint = $actual
    if ($Session.Avd) {
        $profile = @(Invoke-NavigationRawAdb $Session @('emu', 'avd', 'name') | Where-Object { ([string]$_).Trim() })
        if ($profile.Count -ne 2 -or ([string]$profile[0]).Trim() -cne $Session.Avd -or ([string]$profile[1]).Trim() -cne 'OK') {
            throw 'Selected emulator profile changed or is ambiguous.'
        }
    }
    return @(Invoke-NavigationRawAdb $Session $Arguments)
}

function ConvertTo-NavigationShellLiteral {
    param([AllowEmptyString()][string]$Value)
    if ($Value.Contains("`n") -or $Value.Contains("`r") -or $Value.Contains([char]0)) { throw 'Multiline or NUL device setting refused.' }
    return "'" + $Value.Replace("'", "'\''") + "'"
}

function Get-NavigationSettings {
    param($Session)
    $wanted = @{
        system = @('font_scale', 'system_locales', 'accelerometer_rotation', 'user_rotation')
        secure = @('navigation_mode', 'default_input_method', 'enabled_input_methods', 'show_ime_with_hard_keyboard',
            'selected_input_method_subtype', 'input_methods_subtype_history', 'accessibility_enabled',
            'enabled_accessibility_services', 'touch_exploration_enabled')
        global = @('development_settings_enabled', 'debug.force_rtl')
    }
    $settings = [Collections.Generic.List[object]]::new()
    foreach ($space in @('system', 'secure', 'global')) {
        $values = [Collections.Generic.Dictionary[string, string]]::new([StringComparer]::Ordinal)
        $read = @('shell', 'settings')
        if ($Session.Api -gt 28) { $read += @('--user', '0') }
        $lines = @(Invoke-NavigationAdb $Session ($read + @('list', $space)))
        if ($lines.Count -eq 0) { throw "Empty $space settings inventory." }
        foreach ($line in $lines) {
            # Provider names are strings, not identifiers. Device-specific names can contain
            # addresses or punctuation. Only the recovery allowlist below is ever written.
            if ([string]::IsNullOrWhiteSpace($line)) { continue }
            $separator = ([string]$line).IndexOf('=')
            if ($separator -le 0 -or ([string]$line).IndexOfAny([char[]]@("`r", "`n", [char]0)) -ge 0) {
                throw "Malformed or duplicate $space settings inventory."
            }
            $key = $line.Substring(0, $separator)
            if ($values.ContainsKey($key)) { throw "Malformed or duplicate $space settings inventory." }
            $values.Add($key, $line.Substring($separator + 1))
        }
        if ($values.Count -eq 0) { throw "Empty $space settings inventory." }
        $keys = @($wanted[$space])
        if ($space -eq 'secure') { $keys += @($values.Keys | Where-Object { $_ -match '^accessibility_' }) }
        foreach ($key in @($keys | Sort-Object -Unique)) {
            $settings.Add([pscustomobject]@{ Namespace = $space; Key = $key; Exists = $values.ContainsKey($key); Value = $values[$key] })
        }
    }
    return $settings.ToArray()
}

function Set-NavigationSetting {
    param($Session, [string]$Namespace, [string]$Key, [AllowNull()][string]$Value, [bool]$Exists = $true)
    if ($Namespace -notin @('system', 'secure', 'global') -or $Key -notmatch '^[A-Za-z_][A-Za-z0-9_.]*$') { throw 'Invalid settings row.' }
    $args = @('shell', 'settings')
    if ($Session.Api -gt 28 -or $Exists) { $args += @('--user', '0') }
    if ($Exists) { $args += @('put', $Namespace, $Key, (ConvertTo-NavigationShellLiteral $Value)) }
    else { $args += @('delete', $Namespace, $Key) }
    [void](Invoke-NavigationAdb $Session $args)
}

function Get-NavigationOverlay {
    param($Session)
    $overlays = @(Invoke-NavigationAdb $Session @('shell', 'cmd', 'overlay', 'list', '--user', '0'))
    $known = @($overlays | Where-Object { $_ -match '^\[[ x]\] com\.android\.internal\.systemui\.navbar\.(threebutton|gestural)$' })
    $active = @($known | Where-Object { $_.StartsWith('[x]', [StringComparison]::Ordinal) } | ForEach-Object { $_.Substring(4) })
    if ($Session.Api -eq 36 -and ($active.Count -ne 1 -or $known.Count -ne 2)) { throw 'API36 needs unambiguous threebutton and gestural navigation overlays.' }
    if ($Session.Api -eq 28 -and @($active | Where-Object { $_.EndsWith('.gestural', [StringComparison]::Ordinal) }).Count) { throw 'Unexpected API28 gesture navigation.' }
    return [pscustomobject]@{ Active = @($active); Known = @($known) }
}

function Set-NavigationOverlay {
    param($Session, [string]$Overlay)
    if ($Overlay -notmatch '^com\.android\.internal\.systemui\.navbar\.(threebutton|gestural)$') { throw 'Invalid navigation overlay.' }
    [void](Invoke-NavigationAdb $Session @('shell', 'cmd', 'overlay', 'enable-exclusive', '--category', '--user', '0', $Overlay))
    if (@((Get-NavigationOverlay $Session).Active) -cnotcontains $Overlay) { throw 'Navigation mode change did not take effect.' }
}

function Get-NavigationAppLocale {
    param($Session, [string]$Package)
    if ($Session.Api -lt 33) { return $null }
    $answer = @(Invoke-NavigationAdb $Session @('shell', 'cmd', 'locale', 'get-app-locales', $Package, '--user', '0'))
    $pattern = '^Locales for ' + [regex]::Escape($Package) + ' for user 0 are \[([A-Za-z0-9,-]*)\]$'
    if ($answer.Count -ne 1 -or $answer[0] -notmatch $pattern) { throw 'Ambiguous app-locale snapshot.' }
    return [string]$Matches[1]
}

function Restore-NavigationEnvironment {
    param($Session, $State)
    Assert-NavigationRecoveryIdentity $Session $State $State.Package
    # A truncated or edited recovery record must never turn missing rows into device deletions.
    $required = @('system/font_scale', 'system/system_locales', 'system/accelerometer_rotation', 'system/user_rotation',
        'secure/navigation_mode', 'secure/default_input_method', 'secure/enabled_input_methods', 'secure/show_ime_with_hard_keyboard',
        'secure/selected_input_method_subtype', 'secure/input_methods_subtype_history', 'secure/accessibility_enabled',
        'secure/enabled_accessibility_services', 'secure/touch_exploration_enabled', 'global/development_settings_enabled', 'global/debug.force_rtl')
    $ids = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($row in $State.Settings) {
        $id = "$($row.Namespace)/$($row.Key)"
        if (-not $ids.Add($id) -or $row.Exists -isnot [bool] -or
            ($id -cnotin $required -and $id -notmatch '^secure/accessibility_[A-Za-z0-9_.]+$') -or
            ($row.Exists -and $row.Value -isnot [string]) -or (-not $row.Exists -and $null -ne $row.Value)) {
            throw 'Invalid navigation recovery settings record.'
        }
    }
    foreach ($id in $required) { if (-not $ids.Contains($id)) { throw 'Incomplete navigation recovery settings record.' } }
    if ($State.Package -notmatch '^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$' -or
        @($State.Overlay.Active).Count -gt 1 -or
        ($Session.Api -eq 36 -and @($State.Overlay.Active).Count -ne 1) -or
        ($Session.Api -ge 33 -and ($State.AppLocale -isnot [string] -or $State.AppLocale -notmatch '^[A-Za-z0-9,-]*$')) -or
        @($State.Overlay.Active | Where-Object { $_ -notmatch '^com\.android\.internal\.systemui\.navbar\.(threebutton|gestural)$' }).Count) {
        throw 'Invalid navigation recovery target or overlay.'
    }
    $failures = [Collections.Generic.List[string]]::new()
    # Activating an overlay can write navigation_mode. Restore it before exact provider rows.
    if ($State.Overlay.Active.Count -eq 1) {
        try { Set-NavigationOverlay $Session $State.Overlay.Active[0] } catch { $failures.Add("Navigation restoration failed: $($_.Exception.Message)") }
    }
    try {
        $current = @(Get-NavigationSettings $Session)
        $allKeys = @($State.Settings | ForEach-Object { "$($_.Namespace)/$($_.Key)" }) + @($current | ForEach-Object { "$($_.Namespace)/$($_.Key)" })
        foreach ($id in @($allKeys | Sort-Object -Unique)) {
            $saved = @($State.Settings | Where-Object { "$($_.Namespace)/$($_.Key)" -ceq $id })
            $now = @($current | Where-Object { "$($_.Namespace)/$($_.Key)" -ceq $id })
            $original = if ($saved.Count -eq 1) { $saved[0] } else { [pscustomobject]@{ Namespace = $id.Split('/')[0]; Key = $id.Split('/')[1]; Exists = $false; Value = $null } }
            if ($now.Count -eq 1 -and $now[0].Exists -eq $original.Exists -and $now[0].Value -ceq $original.Value) { continue }
            try { Set-NavigationSetting $Session $original.Namespace $original.Key $original.Value $original.Exists }
            catch { $failures.Add("Restore $id failed: $($_.Exception.Message)") }
        }
    } catch { $failures.Add("Settings restoration could not start: $($_.Exception.Message)") }
    if ($Session.Api -ge 33) {
        try {
            if ((Get-NavigationAppLocale $Session $State.Package) -cne $State.AppLocale) {
                $args = @('shell', 'cmd', 'locale', 'set-app-locales', $State.Package, '--user', '0')
                if ($State.AppLocale) { $args += @('--locales', $State.AppLocale) }
                [void](Invoke-NavigationAdb $Session $args)
            }
            if ((Get-NavigationAppLocale $Session $State.Package) -cne $State.AppLocale) { throw 'App locale differs after restoration.' }
        } catch { $failures.Add("Locale restoration failed: $($_.Exception.Message)") }
    }
    try {
        $after = @(Get-NavigationSettings $Session)
        # Returning from a changed font scale can asynchronously persist the default as 1.0,
        # recreating an originally absent row. Reapply its exact saved state once after that
        # configuration transition, then verify every row normally. Repeated drift still fails.
        $savedFont = @($State.Settings | Where-Object { $_.Namespace -ceq 'system' -and $_.Key -ceq 'font_scale' })[0]
        $actualFont = @($after | Where-Object { $_.Namespace -ceq 'system' -and $_.Key -ceq 'font_scale' })[0]
        if ($actualFont.Exists -ne $savedFont.Exists -or $actualFont.Value -cne $savedFont.Value) {
            Set-NavigationSetting $Session 'system' 'font_scale' $savedFont.Value $savedFont.Exists
            Start-Sleep -Milliseconds 250
            $after = @(Get-NavigationSettings $Session)
        }
        foreach ($saved in $State.Settings) {
            $row = @($after | Where-Object { $_.Namespace -ceq $saved.Namespace -and $_.Key -ceq $saved.Key })
            if ($row.Count -ne 1 -or $row[0].Exists -ne $saved.Exists -or $row[0].Value -cne $saved.Value) { throw "Setting $($saved.Key) differs after restoration." }
        }
    } catch { $failures.Add("Restoration verification failed: $($_.Exception.Message)") }
    if ($failures.Count) { throw ($failures -join "`n") }
}

function Assert-NavigationRecoveryIdentity {
    param($Session, $State, [string]$Package)
    if ($State.SchemaVersion -ne 1 -or $State.Serial -cne $Session.Serial -or $State.Api -ne $Session.Api -or
        $State.Model -cne $Session.Model -or $State.Avd -cne $Session.Avd -or $State.Package -cne $Package -or
        -not $State.Fingerprint -or ($Session.Fingerprint -and $State.Fingerprint -cne $Session.Fingerprint)) {
        throw 'Recovery record belongs to another target or has no original device identity.'
    }
    $Session.Fingerprint = $State.Fingerprint
}

function Get-NavigationGrantRows {
    param($Session, [string]$Package)
    $rows = @(Invoke-NavigationAdb $Session @('shell', 'dumpsys', 'package', $Package) |
        Where-Object { $_ -match '^\s+[A-Za-z][A-Za-z0-9_.]+:\s+granted=(true|false)(,\s*flags=\[[^\]]*\])?\s*$' } |
        ForEach-Object { $_.Trim() } | Sort-Object)
    if ($rows.Count -eq 0) { throw 'No permission grant/flag rows for the installed target.' }
    return $rows
}

function Get-NavigationInstalledApk {
    param($Session, [string]$Package, [string]$Destination)
    $paths = @(Invoke-NavigationAdb $Session @('shell', 'pm', 'path', $Package))
    if ($paths.Count -eq 0 -or @($paths | Where-Object { $_ -notmatch '^package:/[^\r\n]+\.apk$' }).Count) { throw 'Installed APK paths are missing or ambiguous.' }
    $base = @($paths | Where-Object { $_.EndsWith('/base.apk', [StringComparison]::Ordinal) })
    if ($base.Count -eq 0 -and $paths.Count -eq 1) { $base = @($paths[0]) }
    if ($base.Count -ne 1) { throw 'No unique installed base APK.' }
    [void](Invoke-NavigationAdb $Session @('pull', $base[0].Substring(8), $Destination))
}

function Get-NavigationAccountNames {
    # Telegram 13.2 ships org.telegram.messenger under R8's names. The checker reads UserConfig by the
    # names of the installed build, taken from the per-build table the patches use; a build with no
    # table keeps the source names.
    param([string]$VersionCode)
    $accountNames = [ordered]@{ 'userConfig' = 'org.telegram.messenger.UserConfig'; 'selectedAccount' = 'selectedAccount'
        'getInstance' = 'getInstance'; 'isClientActivated' = 'isClientActivated'; 'getClientUserId' = 'getClientUserId' }
    if ($VersionCode -notmatch '^\d+$') { throw 'The installed target has no version code.' }
    $table = Join-Path (Split-Path -Parent $PSScriptRoot) "patches/src/main/resources/hushtelegram/names/$VersionCode.txt"
    if (-not (Test-Path -LiteralPath $table -PathType Leaf)) { return $accountNames }
    $owner = 'Lorg/telegram/messenger/UserConfig;'
    $found = 0
    foreach ($row in [IO.File]::ReadAllLines($table)) {
        $cols = $row -split ' '
        if ($cols.Count -lt 3 -or $cols[1] -cne $owner) { continue }
        if ($cols[0] -ceq 'c') { $accountNames['userConfig'] = $cols[2].Substring(1, $cols[2].Length - 2).Replace('/', '.'); $found++ }
        elseif ($cols[0] -ceq 'm' -and $cols[2] -cin @('getInstance', 'isClientActivated', 'getClientUserId')) { $accountNames[$cols[2]] = $cols[5]; $found++ }
        elseif ($cols[0] -ceq 'f' -and $cols[2] -ceq 'selectedAccount') { $accountNames['selectedAccount'] = $cols[5]; $found++ }
    }
    if ($found -ne 5) { throw "The $VersionCode name table names $found of UserConfig's 5 entries the checker reads." }
    return $accountNames
}

function Read-NavigationResult {
    param([string[]]$Output, [string]$RunId, [int]$Api, [string]$Mode, [string]$Locale, [string]$Scale)
    $answers = @($Output | Where-Object { $_ -match 'NAV_RESULT:' } | ForEach-Object { $_.Substring($_.IndexOf('NAV_RESULT:') + 11) })
    if ($answers.Count -ne 1) { throw 'Instrumentation produced no unique structured navigation result.' }
    $answer = $answers[0] | ConvertFrom-Json -ErrorAction Stop
    $required = @('localizedServiceTree', 'backAndNavigationMirrored', 'effectiveFontScale', 'systemBackNested',
        'nestedScrollRetained', 'imeFirstDismissal', 'systemBackSearch', 'homeScrollRetained',
        'queryAndScrollRotationRestored', 'systemBackClosesHome', 'switchesRetained', 'switchStatesInServiceTree', 'accountsRetained', 'processLocaleRestored')
    if ($Mode -eq 'gesture') { $required += 'cancelledGestureRetainsState' }
    $complete = $true
    foreach ($check in $required) { if ($answer.checks.$check -isnot [bool] -or $answer.checks.$check -ne $true) { $complete = $false } }
    if ($answer.schemaVersion -ne 1 -or $answer.runId -cne $RunId -or $answer.api -ne $Api -or
        $answer.mode -cne $Mode -or $answer.locale -cne $Locale -or [string]$answer.fontScale -cne $Scale -or
        $answer.localeScope -cne 'process-local configuration' -or $answer.passed -isnot [bool] -or
        $answer.passed -ne $true -or -not $complete -or
        @($Output | Where-Object { $_ -ceq 'INSTRUMENTATION_CODE: -1' }).Count -ne 1 -or
        ($Mode -eq 'gesture' -and ($answer.cancelledGestureProgressPixels -le 32 -or $answer.committedGestureProgressPixels -le 32))) {
        throw "Native navigation failed or incomplete ($Mode, $Locale, $Scale): $($answer.error)"
    }
    return $answer
}

function Invoke-NavigationHost {
    param([string]$Program, [string[]]$Arguments)
    $ErrorActionPreference = 'Continue'
    $PSNativeCommandUseErrorActionPreference = $false
    $global:LASTEXITCODE = -1
    $output = @(& $Program @Arguments 2>&1 | ForEach-Object { [string]$_ })
    if ($LASTEXITCODE -ne 0) { throw "Host tool failed: $($output -join ' ')" }
}

function Build-NavigationProbe {
    param([string]$Package, [string]$Work, [string]$Java, [string]$D8, [string]$Aapt2, [string]$AndroidJar)
    $Java = Resolve-Java -Explicit $Java
    $D8 = Resolve-D8 -Explicit $D8 -Root (Split-Path -Parent $PSScriptRoot)
    $Aapt2 = Resolve-Aapt2 -Explicit $Aapt2
    $javac = Join-Path (Split-Path -Parent $Java) 'javac.exe'
    $jar = Join-Path (Split-Path -Parent $Java) 'jar.exe'
    $tools = Split-Path -Parent $D8
    $d8Jar = Join-Path $tools 'lib/d8.jar'
    if (-not $AndroidJar) { $AndroidJar = Join-Path (Split-Path -Parent (Split-Path -Parent $tools)) 'platforms/android-36/android.jar' }
    foreach ($path in @($javac, $jar, $d8Jar, $AndroidJar, (Join-Path (Split-Path -Parent $Aapt2) 'zipalign.exe'))) {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Required build tool missing: $path" }
    }
    $directory = Resolve-WithinRoot -Root $Work -Path (Join-Path $Work ("navigation-build-" + [guid]::NewGuid().ToString('N')))
    New-Item -ItemType Directory -Path $directory | Out-Null
    foreach ($name in @('classes', 'dex')) { New-Item -ItemType Directory -Path (Join-Path $directory $name) | Out-Null }
    $manifest = Join-Path $directory 'AndroidManifest.xml'
    $template = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'settings-navigation-device/AndroidManifest.xml') -Raw
    [IO.File]::WriteAllText($manifest, $template.Replace('__TARGET_PACKAGE__', $Package))
    $classes = Join-Path $directory 'classes'; $dex = Join-Path $directory 'dex'
    Invoke-NavigationHost $javac @('-source', '11', '-target', '11', '-cp', $AndroidJar, '-d', $classes, (Join-Path $PSScriptRoot 'settings-navigation-device/SettingsNavigationChecks.java'))
    $classJar = Join-Path $directory 'probe.jar'
    Invoke-NavigationHost $jar @('--create', '--file', $classJar, '-C', $classes, '.')
    Invoke-NavigationHost $Java @('-cp', $d8Jar, 'com.android.tools.r8.D8', '--min-api', '28', '--lib', $AndroidJar, '--output', $dex, $classJar)
    $unsigned = Join-Path $directory 'unaligned.apk'; $aligned = Join-Path $directory 'navigation-probe-unsigned.apk'
    Invoke-NavigationHost $Aapt2 @('link', '--manifest', $manifest, '-I', $AndroidJar, '-o', $unsigned)
    Invoke-NavigationHost $jar @('--update', '--file', $unsigned, '--no-manifest', '-C', $dex, 'classes.dex')
    Invoke-NavigationHost (Join-Path (Split-Path -Parent $Aapt2) 'zipalign.exe') @('-f', '-p', '4', $unsigned, $aligned)
    Write-Output $aligned
}

if ($MyInvocation.InvocationName -ne '.') {
    $ErrorActionPreference = 'Stop'
    if ($PackageName -notmatch '^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$' -or
        $Activity -notmatch '^[A-Za-z][A-Za-z0-9_.]*$') { throw 'Invalid Android package/activity.' }
    if (-not $WorkDirectory) { throw 'Pass an absolute isolated -WorkDirectory.' }
    if (-not [IO.Path]::IsPathRooted($WorkDirectory) -or $WorkDirectory -match '^[A-Za-z]:[^\\/]') { throw 'WorkDirectory must be an absolute path.' }
    $WorkDirectory = [IO.Path]::GetFullPath($WorkDirectory)
    if (-not (Test-Path -LiteralPath $WorkDirectory -PathType Container)) { New-Item -ItemType Directory -Path $WorkDirectory | Out-Null }
    if ($BuildOnly) { Build-NavigationProbe $PackageName $WorkDirectory $Java $D8 $Aapt2 $AndroidJar; return }
    if (-not $Adb) { $Adb = (Get-Command adb -CommandType Application -ErrorAction Stop | Select-Object -First 1).Path }
    $session = New-NavigationSession $Adb $Serial $ExpectedModel $ExpectedAvd $ExpectedApi $LeaseDirectory $LeaseToken $ChatIdentity
    if ($RestoreState) {
        $state = Get-Content -LiteralPath $RestoreState -Raw | ConvertFrom-Json
        Assert-NavigationRecoveryIdentity $session $state $PackageName
        $restoreFailures = [Collections.Generic.List[string]]::new()
        try { Restore-NavigationEnvironment $session $state } catch { $restoreFailures.Add($_.Exception.Message) }
        try { Remove-NavigationLeaseReverse $session $state } catch { $restoreFailures.Add($_.Exception.Message) }
        if ($restoreFailures.Count) { throw ($restoreFailures -join "`n") }
        Write-Host '[navigation] exact environment restored from recovery record'
        return
    }
    $Aapt2 = Resolve-Aapt2 -Explicit $Aapt2
    $facts = Get-ApkManifestFacts -Apk $ProbeApk -Aapt2 $Aapt2
    if ($facts.package -cne 'app.hushtelegram.navigationprobe' -or @($facts.permissions).Count) { throw 'Expected the permission-free navigation probe APK.' }
    $probeSigners = @(Get-VendorSignerDigests -Apk $ProbeApk -Aapt2 $Aapt2)
    $runId = [guid]::NewGuid().ToString('N')
    $run = Resolve-WithinRoot -Root $WorkDirectory -Path (Join-Path $WorkDirectory "navigation-$runId")
    New-Item -ItemType Directory -Path $run | Out-Null
    $target = Join-Path $run 'target.apk'; $installedProbe = Join-Path $run 'probe.apk'
    $state = $null; $failure = $null; $cleanupFailure = $null; $leaseServer = $null
    $runs = [Collections.Generic.List[object]]::new()
    try {
        Get-NavigationInstalledApk $session $PackageName $target
        $targetFacts = Get-ApkManifestFacts -Apk $target -Aapt2 $Aapt2
        if ($targetFacts.package -cne $PackageName) { throw 'Installed target APK has another package identity.' }
        $accountNames = Get-NavigationAccountNames ([string]$targetFacts.versionCode)
        [string[]]$accountArguments = @($accountNames.Keys | ForEach-Object { '-e'; $_; $accountNames[$_] })
        $targetSigners = @(Get-VendorSignerDigests -Apk $target -Aapt2 $Aapt2)
        if (($targetSigners -join ',') -cne ($probeSigners -join ',')) { throw 'Use the retained target signer for instrumentation. No key replacement is permitted.' }
        Get-NavigationInstalledApk $session 'app.hushtelegram.navigationprobe' $installedProbe
        if ((Get-FileHash -LiteralPath $installedProbe -Algorithm SHA256).Hash -cne (Get-FileHash -LiteralPath $ProbeApk -Algorithm SHA256).Hash) { throw 'Installed probe differs from the verified input APK.' }
        $instrumentation = @(Invoke-NavigationAdb $session @('shell', 'pm', 'list', 'instrumentation'))
        $entries = @("instrumentation:app.hushtelegram.navigationprobe/app.hushtelegram.navigationprobe.SettingsNavigationChecks (target=$PackageName)",
            "instrumentation:app.hushtelegram.navigationprobe/.SettingsNavigationChecks (target=$PackageName)")
        if (@($instrumentation | Where-Object { $entries -ccontains $_ }).Count -ne 1) { throw 'No unique instrumentation entry for the expected target.' }
        $leaseServer = Start-NavigationLeaseServer $session
        $state = [pscustomobject]@{ SchemaVersion = 1; Serial = $Serial; Model = $ExpectedModel; Avd = $ExpectedAvd;
            Package = $PackageName; Api = $ExpectedApi; LeaseSocket = $leaseServer.Socket; LeasePort = $leaseServer.Port;
            Fingerprint = $session.Fingerprint; Settings = @(Get-NavigationSettings $session);
            Overlay = (Get-NavigationOverlay $session); AppLocale = (Get-NavigationAppLocale $session $PackageName);
            TargetSha256 = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash;
            Grants = @(Get-NavigationGrantRows $session $PackageName) }
        $state | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $run 'recovery.json') -Encoding UTF8
        [void](Invoke-NavigationAdb $session @('reverse', '--no-rebind', ('localabstract:' + $leaseServer.Socket), "tcp:$($leaseServer.Port)"))
        Set-NavigationSetting $session 'secure' 'show_ime_with_hard_keyboard' '1'
        $modes = if ($ExpectedApi -eq 36) { @('button', 'gesture') } else { @('button') }
        foreach ($mode in $modes) {
            if ($ExpectedApi -eq 36) {
                $suffix = if ($mode -eq 'button') { 'threebutton' } else { 'gestural' }
                Set-NavigationOverlay $session "com.android.internal.systemui.navbar.$suffix"
            }
            foreach ($scale in @('1', '2')) {
                Set-NavigationSetting $session 'system' 'font_scale' $scale
                foreach ($language in @('en', 'ar-XB')) {
                    Assert-NavigationLease $session
                    if ($session.Expires -lt [DateTimeOffset]::UtcNow.AddMinutes(3)) { throw 'Renew the whole-device lease before this bounded instrumentation run.' }
                    $session.InstrumentationUnfinished = $true
                    [string[]]$instrumentArguments = @('shell', 'am', 'instrument', '-w', '-r', '-e', 'mode', $mode,
                        '-e', 'locale', $language, '-e', 'fontScale', $scale, '-e', 'package', $PackageName,
                        '-e', 'activity', $Activity, '-e', 'runId', $runId, '-e', 'leaseExpiry', ([string]$session.Expires.ToUnixTimeMilliseconds()),
                        '-e', 'leaseSocket', $leaseServer.Socket, '-e', 'leaseCapability', $leaseServer.Capability) + $accountArguments +
                        @('app.hushtelegram.navigationprobe/app.hushtelegram.navigationprobe.SettingsNavigationChecks')
                    $output = @(Invoke-NavigationAdb $session $instrumentArguments)
                    if (@($output | Where-Object { $_ -match '^INSTRUMENTATION_CODE: -?\d+$' }).Count -eq 1) { $session.InstrumentationUnfinished = $false }
                    $runs.Add((Read-NavigationResult $output $runId $ExpectedApi $mode $language $scale))
                }
            }
        }
    } catch { $failure = $_ }
    finally {
        if ($state) {
            try {
                if ($session.InstrumentationUnfinished) {
                    # Abort only the unfinished target test process, retaining its data and grants.
                    [void](Invoke-NavigationAdb $session @('shell', 'am', 'force-stop', '--user', '0', $PackageName))
                }
                Restore-NavigationEnvironment $session $state
                Get-NavigationInstalledApk $session $PackageName $target
                if ((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -cne $state.TargetSha256 -or
                    (@(Get-NavigationGrantRows $session $PackageName) -join "`n") -cne ($state.Grants -join "`n")) { throw 'Installed target identity or permission grants/flags changed.' }
            } catch { $cleanupFailure = $_.Exception.Message }
            # A settings failure must not retain a reverse mapping to a stopped host server.
            try { Remove-NavigationLeaseReverse $session $state }
            catch { $cleanupFailure = @($cleanupFailure, $_.Exception.Message | Where-Object { $_ }) -join "`n" }
        }
        try { Stop-NavigationLeaseServer $leaseServer }
        catch { $cleanupFailure = @($cleanupFailure, $_.Exception.Message | Where-Object { $_ }) -join "`n" }
        [pscustomobject]@{ SchemaVersion = 1; Serial = $Serial; Api = $ExpectedApi; Fingerprint = $session.Fingerprint;
            Passed = ($null -eq $failure -and $null -eq $cleanupFailure); Runs = $runs.ToArray();
            Error = if ($failure) { $failure.Exception.Message } else { $null };
            RestorationError = $cleanupFailure } |
            ConvertTo-Json -Depth 12 | Set-Content -LiteralPath (Join-Path $run 'results.json') -Encoding UTF8
        foreach ($path in @($target, $installedProbe)) { Remove-GeneratedPath -Root $run -Path $path -NoRecurse }
    }
    if ($cleanupFailure) { throw "Navigation environment restoration failed. Retained recovery record: $(Join-Path $run 'recovery.json'). $cleanupFailure" }
    if ($failure) { throw $failure }
    Write-Host "[navigation] $($runs.Count) device cases passed; exact environment, target APK and every grant/flag row retained. Results: $(Join-Path $run 'results.json')"
}
