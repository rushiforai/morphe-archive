<#
.SYNOPSIS
    Walk the whole patched app on a leased phone or an emulator and leave a walk receipt.

.DESCRIPTION
    release/release.ps1's publish stage refuses a bundle without a receipt that a whole-app walk of
    that exact bundle left (walk-receipt.ps1). This runs the walk: it patches Messenger from the
    bundle with the Morphe Desktop CLI, installs it in place on the device, walks every step in
    $WalkSteps (a chat, both Hush settings pages, the message log and auto reply sheets when those
    patches are in, and each patched screen), watches the crash buffer for a Messenger crash (Java
    or native), and writes walk-receipt.json with New-WalkReceipt. The receipt names the SHA-256 of
    the .mpp the walked APK was patched with, which is what publish holds it to.

    The result the walk writes, and the exit code it ends with:
      PASS      0  the whole app was walked, every step reached its own screen, no crash.
      PARTIAL   2  a settings page, the chat or one of the default screens was left out, or a
                   -SkipPatch walk found no record that the installed app was patched from -Bundle.
      FAIL      1  a Messenger crash, a step that didn't reach its own screen, a crash buffer that
                   couldn't be read, or an installed APK that isn't the one patched from -Bundle.
    Only a PASS backs a release.

    A step passes when Messenger is in front on the activity the step expects and the UI dump shows
    the step's marker, no login or Restore prompt, and a screen no earlier step showed. Each step's
    screenshot and UI dump go to steps/<id>.png and steps/<id>.xml beside the receipt, which hashes
    them, and publish reads them again. Below Android 13 the message log's window is FLAG_SECURE and
    screencap can't take it, so that step keeps its window's dumpsys entry (steps/<id>.window.txt).

    Screens open by their fb-messenger:// links (am start -W -a VIEW -d ...), the inbox through
    its launcher activity, and the chat by -Thread, the user id of a chat on the signed-in account. The chat goes first: opening it by its
    link gets past the "Restore your Facebook chats" prompt Messenger shows after an update. A prompt
    in front of the inbox with no Close gets stepped around the same way: the chat link, then the
    launcher activity reordered to the front. The settings pages open through SettingsActivity with the page extra the restart button uses.

    Device safety: the walk takes an exclusive serial lease in the shared lease folder and gives it
    back when it's done. It stops on a lock screen instead of unlocking, wakes the screen with
    KEYCODE_WAKEUP only, never changes the stay-awake setting and never sends sleep or power. It
    never uninstalls or clears Messenger. An install that can't update the app in place is reported,
    not forced past. It taps only inside Hush settings: a sheet's button and its Close or Cancel,
    each found by its text in a dump taken right before the tap. It never taps Messenger's own
    screens, so it never answers the Restore prompt.

.EXAMPLE
    scripts/walk-app.ps1 -Serial <adb serial> -ExpectedModel SM-S908U1 -Keystore <key the installed app uses> -Thread <user id>

.EXAMPLE
    # The release walk, of the bundle the build stage staged:
    scripts/walk-app.ps1 -Serial emulator-5596 -ExpectedModel sdk_gphone64_arm64 -Keystore <key> -Thread <user id> -Bundle build/release/0.26.0/assets/patches-0.26.0.mpp
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$ExpectedModel = $env:HUSHMESSENGER_EXPECTED_DEVICE_MODEL,
    [string]$Package = 'com.facebook.orca',
    # The bundle to patch with, named in the receipt. Unset, the one Gradle built for this checkout's version.
    [string]$Bundle,
    # Stock Messenger to patch. Unset, the messenger-*-<code>.apk in HUSH_NATIVE_FIXTURES of the build the
    # device has installed (Select-WalkFixtureApk), or the newest one when Messenger isn't installed.
    [string]$Apk,
    # The user id of a chat on the signed-in account. Without it the chat isn't walked and the walk is PARTIAL.
    [string]$Thread = $env:HUSHMESSENGER_WALK_THREAD,
    # The patched screens to open, each a link. Leaving out one of the defaults makes the walk PARTIAL,
    # and a link that won't open fails it.
    [string[]]$Visit,
    # Walk the app that's already installed instead of patching and installing a fresh one. It backs a
    # release only when it's the APK an earlier walk patched from -Bundle into -OutDir.
    [switch]$SkipPatch,
    # Leave the Hush settings pages out. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [int]$SettleSeconds = 4,
    [string]$OutDir = (Join-Path ([IO.Path]::GetTempPath()) 'hushmessenger-walk'),
    # The key the installed Messenger is signed with, so the build installs over it in place.
    [string]$Keystore = $env:HUSHMESSENGER_KEYSTORE,
    [string]$KeyAlias = 'Morphe',
    [string]$KeystorePassword = $env:HUSHMESSENGER_KEYSTORE_PASSWORD,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Adb,
    # The folder the device leases live in, shared with every other tool that drives these devices.
    [string]$LeaseDirectory = $env:HUSHMESSENGER_DEVICE_LEASE_DIR,
    # The checkout whose bundle is walked, the one holding this script unless given.
    [string]$Root
)

$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'walk-receipt.ps1')

# The Messenger screens that open by link: its own settings (where the HushMessenger row sits) and its
# story and contact settings. The inbox opens through its launcher activity, the chat by -Thread.
$WalkDefaultScreens = [string[]]@($WalkSteps | Where-Object { $_.Kind -ceq 'link' } | ForEach-Object { $_.Link })
$WalkSettingsActivity = 'app.hushmessenger.extension.SettingsActivity'
$WalkPageExtra = 'app.hushmessenger.page'
# SettingsActivity.OPEN_EXTRA: settings sections start closed, so a sheet step opens the one holding its button.
$WalkSectionExtra = 'app.hushmessenger.open'

function Resolve-WalkOutcome {
    <#
    .SYNOPSIS
        The result a walk earns from what it saw. A crash or an unopened screen fails it, a skipped
        part makes it partial, and only a whole clean walk passes.
    #>
    param(
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @(),
        [Parameter(Mandatory = $true)][bool]$Full
    )
    if ($Crashes -gt 0 -or @($Problems).Count -gt 0) { return 'FAIL' }
    if (-not $Full -or $Screens -lt 1) { return 'PARTIAL' }
    return 'PASS'
}

function Get-WalkPlan {
    <#
    .SYNOPSIS
        The steps a walk with these choices opens, in walk order: $WalkSteps less what it leaves out,
        then any -Visit link beyond the defaults as an extra step the receipt doesn't record.
    #>
    param([bool]$SkipSettings, [string]$Thread, [string[]]$Visit = @(), [string[]]$AppliedPatches = @())
    $plannedSteps = [Collections.Generic.List[object]]::new()
    foreach ($definition in $script:WalkSteps) {
        if ($definition.Kind -ceq 'chat' -and [string]::IsNullOrWhiteSpace($Thread)) { continue }
        if ($definition.Kind -in 'settings', 'sheet' -and $SkipSettings) { continue }
        if ($definition.Kind -ceq 'sheet' -and $AppliedPatches -cnotcontains $definition.Patch) { continue }
        if ($definition.Kind -ceq 'link' -and $Visit -cnotcontains $definition.Link) { continue }
        $plannedSteps.Add($definition)
    }
    foreach ($link in @($Visit | Where-Object { $WalkDefaultScreens -cnotcontains $_ })) {
        $plannedSteps.Add([pscustomobject]@{ Id = $link; Kind = 'extra'; Link = $link; Activity = $WalkMessengerComponent; Marker = $WalkMessengerNodes })
    }
    return $plannedSteps.ToArray()
}

function Get-WalkSkips {
    <#
    .SYNOPSIS
        The parts of the app a walk with these choices leaves out. Any at all and it isn't the whole app.
    #>
    param([bool]$SkipSettings, [string]$Thread, [string[]]$Visit = @(), [string[]]$DefaultScreens = $WalkDefaultScreens,
        [bool]$Unproven = $false)
    $skips = [Collections.Generic.List[string]]::new()
    if ($Unproven) { $skips.Add('proof the installed app was patched from -Bundle (no patch of it recorded in -OutDir)') }
    if ($SkipSettings) { $skips.Add('the Hush settings pages') }
    if ([string]::IsNullOrWhiteSpace($Thread)) { $skips.Add('a chat (no -Thread)') }
    foreach ($screen in $DefaultScreens) { if ($Visit -cnotcontains $screen) { $skips.Add($screen) } }
    return [string[]]$skips
}

# An x86_64 emulator runs Messenger's arm64 code through its ARM translator, libndk_translation. A child process
# Messenger forks can abort inside that translator while it sets the child up, before any Messenger code runs there
# (fdsan in ResetCurrentGuestThreadAfterFork, from Meta's BloksDeviceGpuM probe in 585). A phone has no translator.
$WalkTranslatorFork = 'libndk_translation\.so \(ndk_translation::ResetCurrentGuestThreadAfterFork\('

function Select-WalkTranslatorAborts {
    <#
    .SYNOPSIS
        The native ">>> name <<<" lines of -Package since -SinceEpoch whose own tombstone shows the emulator's ARM
        translator aborting while it set up a forked child. A tombstone's lines share crash_dump's pid, the second column.
    #>
    param([string[]]$Lines = @(), [Parameter(Mandatory = $true)][string]$Package, [long]$SinceEpoch)
    $name = [regex]::Escape($Package)
    $open = @{}
    $aborts = [Collections.Generic.List[string]]::new()
    foreach ($line in $Lines) {
        if ($line -notmatch '^\s*(\d+)\.\d+\s+(\d+)\s') { continue }
        $at = [long]$Matches[1]
        $dump = $Matches[2]
        if ($line -match '>>>') {
            $open[$dump] = if ($at -ge $SinceEpoch -and $line -match ">>>\s*$name(?![\w.])") { $line } else { $null }
        } elseif ($open[$dump] -and $line -match $script:WalkTranslatorFork) {
            $aborts.Add($open[$dump])
            $open[$dump] = $null
        }
    }
    return [string[]]$aborts
}

function Select-WalkCrashes {
    <#
    .SYNOPSIS
        The crash buffer lines (logcat -b crash -v epoch) that each mark one crash of -Package, or of
        one of its processes, since -SinceEpoch: the Java "Process:" line and the native ">>> name <<<" line.
        An abort of the emulator's ARM translator in a forked child isn't one (Select-WalkTranslatorAborts).
    #>
    param([string[]]$Lines = @(), [Parameter(Mandatory = $true)][string]$Package, [long]$SinceEpoch)
    $name = [regex]::Escape($Package)
    $translator = @(Select-WalkTranslatorAborts -Lines $Lines -Package $Package -SinceEpoch $SinceEpoch)
    return [string[]]@($Lines | Where-Object {
        $_ -match '^\s*(\d+)\.\d+\s' -and [long]$Matches[1] -ge $SinceEpoch -and
            ($_ -match "Process:\s*$name(?![\w.])" -or $_ -match ">>>\s*$name(?![\w.])") -and $translator -cnotcontains $_
    })
}

function Get-WalkApkProblem {
    <#
    .SYNOPSIS
        Why the APK the device ran can't stand for the one patched from the bundle, or $null when it
        can. -Patched '' means there's nothing to hold it to, which Get-WalkSkips counts instead.
    #>
    param([string]$Installed, [string]$Patched)
    if (-not $Patched) { return $null }
    # \z, not $: $ also matches before a final newline.
    if ($Installed -cnotmatch '^[0-9a-f]{64}\z') { return "couldn't read the installed APK's SHA-256, so nothing shows it's the one patched from -Bundle" }
    if ($Installed -cne $Patched) { return "the installed APK ($Installed) isn't the one patched from -Bundle ($Patched)" }
    return $null
}

function Read-WalkSha256([string[]]$Lines) {
    <#
    .SYNOPSIS
        The hash from sha256sum's output, or '' when no line carries one. adb can print a warning
        first, and a missing sha256sum answers with an error line, never a hash.
    #>
    $hashLine = @($Lines | Where-Object { $_ -cmatch '^[0-9a-f]{64}\s' }) | Select-Object -First 1
    if ($hashLine) { return $hashLine.Substring(0, 64) }
    return ''
}

function Read-WalkAppliedPatches {
    <#
    .SYNOPSIS
        The patch names in a Desktop result's appliedPatches: plain names (1.19) or {name} objects
        (1.18.1). Empty when there's no readable result.
    #>
    param([string]$ResultFile)
    if (-not $ResultFile -or -not (Test-Path -LiteralPath $ResultFile -PathType Leaf)) { return [string[]]@() }
    try { $report = Get-Content -LiteralPath $ResultFile -Raw | ConvertFrom-Json } catch { return [string[]]@() }
    return [string[]]@(@($report.appliedPatches) | ForEach-Object { if ($_ -is [string]) { $_ } else { $_.name } } |
        Where-Object { $_ -is [string] -and $_ })
}

function Read-WalkResumedComponent {
    <#
    .SYNOPSIS
        The component in front, from dumpsys activity activities: topResumedActivity on newer
        Android, mResumedActivity or ResumedActivity on older ones. '' when none reads.
    #>
    param([string[]]$Lines = @())
    foreach ($label in 'topResumedActivity', 'ResumedActivity') {
        foreach ($line in $Lines) {
            if ($line -match "$label[:=]\s*ActivityRecord\{\S+\s+u\d+\s+(\S+/\S+)") { return $Matches[1] }
        }
    }
    return ''
}

function Find-WalkNodeCenter {
    <#
    .SYNOPSIS
        The center of the enabled node whose whole text is -Text in a UI dump, as @(x, y), or $null.
        With -Described, the node whose whole content-desc is -Text (an icon button has no text).
    #>
    param([AllowEmptyString()][string]$Xml, [Parameter(Mandatory = $true)][string]$Text, [switch]$Described)
    $attribute = if ($Described) { 'content-desc' } else { 'text' }
    $pattern = '<node\b[^>]*\b' + $attribute + '="' + [regex]::Escape([Security.SecurityElement]::Escape($Text)) +
        '"[^>]*\benabled="true"[^>]*\bbounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"'
    $found = [regex]::Match([string]$Xml, $pattern)
    if (-not $found.Success) { return $null }
    $box = 1..4 | ForEach-Object { [int]$found.Groups[$_].Value }
    if ($box[2] -le $box[0] -or $box[3] -le $box[1]) { return $null }
    return @([int](($box[0] + $box[2]) / 2), [int](($box[1] + $box[3]) / 2))
}

function Test-WalkRestorePrompt([AllowEmptyString()][string]$Xml) {
    # Whether a UI dump is Messenger's chat restore prompt, by the same pattern publish refuses a step for.
    $prompt = @($WalkBlockingScreens | Where-Object { $_.Name -clike '*Restore your chats*' })[0]
    return [string]$Xml -match $prompt.Pattern
}

function Test-WalkKeyboardShown([string[]]$Lines) {
    # Whether dumpsys input_method shows the keyboard up. A chat with no messages focuses its composer, and
    # uiautomator can't dump a screen whose cursor blinks over an open keyboard.
    return ($Lines -join "`n") -cmatch 'mInputShown=true'
}

function Read-WalkSettledScreen([scriptblock]$CloseKeyboard, [scriptblock]$ReadScreen, [int]$Tries = 3) {
    # A step's dump, tried again after closing the keyboard once more when it fails. An empty chat focuses its
    # composer once the thread loads, so the keyboard can come up after the first check.
    for ($try = 1; $try -le $Tries; $try++) {
        & $CloseKeyboard
        $dump = [string](& $ReadScreen)
        if ($dump) { return $dump }
    }
    return ''
}

function Get-WalkExitCode([string]$Result) {
    switch -CaseSensitive ($Result) { 'PASS' { return 0 } 'PARTIAL' { return 2 } default { return 1 } }
}

function Read-WalkVersionCode([string[]]$Lines) {
    # The first versionCode in dumpsys package output, or '' when the package isn't installed.
    foreach ($line in $Lines) { if ($line -cmatch '\bversionCode=(\d+)') { return $Matches[1] } }
    return ''
}

function Select-WalkFixtureApk {
    <#
    .SYNOPSIS
        The stock APK in -Directory to patch for a device that has build -InstalledCode: the
        messenger-<version>-<code>.apk of that same build, so the install neither downgrades it
        (INSTALL_FAILED_VERSION_DOWNGRADE) nor swaps its ABI or density. With nothing installed, the
        newest fixture by name. Throws when no fixture is that build.
    #>
    param([string]$Directory, [AllowEmptyString()][string]$InstalledCode)
    $fixtures = @(Get-ChildItem -LiteralPath $Directory -File -Filter 'messenger-*.apk' | Sort-Object Name -Descending)
    if ($fixtures.Count -eq 0) { throw "$Directory has no messenger-*.apk. Pass -Apk." }
    if (-not $InstalledCode) { return $fixtures[0].FullName }
    $same = @($fixtures | Where-Object { $_.Name -cmatch ('^messenger-[\d.]+-' + [regex]::Escape($InstalledCode) + '\.apk\z') })
    if ($same.Count -eq 1) { return $same[0].FullName }
    $codes = @($fixtures | ForEach-Object { if ($_.Name -cmatch '-(\d+)\.apk\z') { $Matches[1] } } | Sort-Object)
    throw "The device has Messenger build $InstalledCode, and $Directory has no messenger-*-$InstalledCode.apk (it has $($codes -join ', ')). Pass -Apk with the stock APK to install."
}

function Get-WalkInstalledVersionCode {
    <#
    .SYNOPSIS
        The versionCode of -Package on the device, '' when it isn't installed. Holds the lease only
        for the read, after checking the device is the expected one.
    #>
    param([string]$AdbExe, [string]$Serial, [string]$ExpectedModel, [string]$Package, [string]$LeaseDirectory)
    $lease = Enter-WalkLease -Directory $LeaseDirectory -Serial $Serial -ExpectedModel $ExpectedModel
    try {
        $reportedSerial = [string]@(& $AdbExe -s $Serial get-serialno 2>$null)[0]
        $deviceModel = [string]@(& $AdbExe -s $Serial shell getprop ro.product.model 2>$null)[0]
        if ($reportedSerial.Trim() -cne $Serial -or $deviceModel.Trim() -cne $ExpectedModel) {
            throw "$Serial answers as $reportedSerial, model $deviceModel, not the expected $ExpectedModel. Nothing was changed on it."
        }
        return Read-WalkVersionCode @(& $AdbExe -s $Serial shell dumpsys package $Package 2>$null)
    } finally {
        Exit-WalkLease $lease
    }
}

function Enter-WalkLease {
    param([string]$Directory, [string]$Serial, [string]$ExpectedModel)
    if ([string]::IsNullOrWhiteSpace($Directory)) { throw 'Name the shared device lease folder with -LeaseDirectory or HUSHMESSENGER_DEVICE_LEASE_DIR.' }
    [void][IO.Directory]::CreateDirectory($Directory)
    $path = [IO.Path]::GetFullPath((Join-Path $Directory "$Serial.json"))
    # CreateNew, so a lease anyone else holds, live or expired, is never taken over here.
    try { $file = [IO.File]::Open($path, [IO.FileMode]::CreateNew, [IO.FileAccess]::ReadWrite, [IO.FileShare]::Read) }
    catch { throw "$Serial is leased (or its lease file can't be made). Walk once it's free." }
    $lease = [pscustomobject]@{ File = $file; Path = $path; Record = [ordered]@{
        schemaVersion = 1; serial = $Serial; project = 'HushMessenger'; chatIdentity = "HushMessenger/walk-app/$PID"
        ownershipToken = [guid]::NewGuid().ToString(); processId = $PID; expectedModel = $ExpectedModel
        acquiredUtc = [DateTime]::UtcNow.ToString('o'); expiresUtc = ''; purpose = 'whole-app walk' } }
    try { Update-WalkLease $lease; return $lease }
    catch { $file.Dispose(); Remove-Item -LiteralPath $path -ErrorAction SilentlyContinue; throw }
}

function Update-WalkLease {
    param($Lease)
    # A Z time: ConvertFrom-Json reads an offset time as local, and other readers would see it expired.
    $Lease.Record.expiresUtc = [DateTime]::UtcNow.AddMinutes(15).ToString('o')
    $bytes = [Text.Encoding]::UTF8.GetBytes(($Lease.Record | ConvertTo-Json -Compress))
    $Lease.File.Position = 0
    $Lease.File.SetLength(0)
    $Lease.File.Write($bytes, 0, $bytes.Length)
    $Lease.File.Flush($true)
}

function Exit-WalkLease {
    param($Lease)
    if ($null -eq $Lease) { return }
    $Lease.File.Dispose()
    # A warning, not a throw, so a failure here never hides the error that ended the walk.
    try { Remove-Item -LiteralPath $Lease.Path -ErrorAction Stop }
    catch { Write-Warning "Couldn't remove the lease $($Lease.Path), so the device reads as busy until it's deleted: $($_.Exception.Message)" }
}

function Get-WalkPatchInputs {
    param([string]$BundlePath, [string]$StockApk, [string]$KeystorePath, [string]$Alias)
    [ordered]@{
        bundle = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
        stock = (Get-FileHash -LiteralPath $StockApk -Algorithm SHA256).Hash.ToLowerInvariant()
        keystore = (Get-FileHash -LiteralPath $KeystorePath -Algorithm SHA256).Hash.ToLowerInvariant()
        alias = $Alias
    }
}

# The APK an earlier patch left in Destination, when it came from these same inputs and is unchanged
# since. A walk that found the device busy keeps its APK, so the next try goes straight to the device.
function Find-WalkPatched {
    param([string]$Destination, $Inputs)
    $patched = Join-Path $Destination 'hushmessenger-walk.apk'
    $inputsFile = Join-Path $Destination 'patch-inputs.json'
    if (-not (Test-Path -LiteralPath $patched -PathType Leaf) -or -not (Test-Path -LiteralPath $inputsFile -PathType Leaf)) { return $null }
    try { $kept = Get-Content -LiteralPath $inputsFile -Raw | ConvertFrom-Json } catch { return $null }
    foreach ($name in $Inputs.Keys) { if ([string]$kept.$name -cne [string]$Inputs[$name]) { return $null } }
    if ([string]$kept.apk -cne (Get-FileHash -LiteralPath $patched -Algorithm SHA256).Hash.ToLowerInvariant()) { return $null }
    return $patched
}

function Save-WalkPatchInputs {
    param([string]$Destination, $Inputs)
    $record = [ordered]@{}
    foreach ($name in $Inputs.Keys) { $record[$name] = $Inputs[$name] }
    $record.apk = (Get-FileHash -LiteralPath (Join-Path $Destination 'hushmessenger-walk.apk') -Algorithm SHA256).Hash.ToLowerInvariant()
    Set-Content -LiteralPath (Join-Path $Destination 'patch-inputs.json') -Value ($record | ConvertTo-Json -Compress) -Encoding utf8
}

# The SHA-256 of the APK an earlier walk patched from this bundle into Destination, or '' when there's
# no such record. A -SkipPatch walk holds the installed app to it.
function Find-WalkPatchRecord {
    param([string]$Destination, [string]$BundleSha256)
    $inputsFile = Join-Path $Destination 'patch-inputs.json'
    if (-not (Test-Path -LiteralPath $inputsFile -PathType Leaf)) { return '' }
    try { $kept = Get-Content -LiteralPath $inputsFile -Raw | ConvertFrom-Json } catch { return '' }
    if ([string]$kept.bundle -cne $BundleSha256 -or [string]$kept.apk -cnotmatch '^[0-9a-f]{64}\z') { return '' }
    return [string]$kept.apk
}

# True when the Desktop CLI's result lists at least one step and every step succeeded. Desktop 1.19.0
# (patcher 2.0) calls the list stepResults; 1.18.1 and older called it patchingSteps. A result with
# no steps at all is not a finished patch run.
function Test-WalkPatchSteps {
    param($Report)
    $stepList = if ($null -ne $Report.PSObject.Properties['stepResults']) { $Report.stepResults } else { $Report.patchingSteps }
    $steps = @($stepList | Where-Object { $null -ne $_ })
    return ($steps.Count -gt 0 -and @($steps | Where-Object { -not $_.success }).Count -eq 0)
}

function Invoke-WalkPatch {
    param([string]$JavaExe, [string]$Jar, [string]$BundlePath, [string]$StockApk, [string]$KeystorePath,
        [string]$Alias, [string]$StorePassword, [string]$Destination)
    $patched = Join-Path $Destination 'hushmessenger-walk.apk'
    $resultFile = Join-Path $Destination 'patch-result.json'
    $log = Join-Path $Destination 'patch.log'
    $scratch = Join-Path $Destination 'patch-tmp'
    $inputsFile = Join-Path $Destination 'patch-inputs.json'
    $patchInputs = Get-WalkPatchInputs -BundlePath $BundlePath -StockApk $StockApk -KeystorePath $KeystorePath -Alias $Alias
    $kept = Find-WalkPatched -Destination $Destination -Inputs $patchInputs
    if ($kept) {
        Write-Host '[walk] reusing the APK patched from this bundle and stock APK'
        return $kept
    }
    Remove-Item -LiteralPath $patched, $resultFile, $log, $inputsFile -Force -ErrorAction SilentlyContinue
    # Desktop 1.18.1 failed at SIGNING when it's handed an empty password, so a key without one gets
    # no password flag. A password travels in an argument file, kept off the process command line.
    $cliArguments = @('patch', "--patches=$BundlePath", "--keystore=$KeystorePath", "--keystore-entry-alias=$Alias",
        "--out=$patched", "--result-file=$resultFile", "--temporary-files-path=$scratch")
    if ($StorePassword) { $cliArguments += "--keystore-password=$StorePassword" }
    $cliArguments += $StockApk
    $argumentFile = Join-Path $Destination 'patch.args'
    [IO.File]::WriteAllLines($argumentFile, [string[]]@($cliArguments | ForEach-Object {
        '"' + ([string]$_).Replace('\', '\\').Replace('"', '\"') + '"' }), (New-Object Text.UTF8Encoding $false))
    $run = {
        # The CLI logs WARNING and SEVERE on stderr. The exit code decides, not the stream.
        $ErrorActionPreference = 'Continue'
        & $JavaExe -Xmx3g -XX:ActiveProcessorCount=2 -jar $Jar "@$argumentFile" *> $log
    }
    try {
        $queue = $env:BUILD_QUEUE_SCRIPT
        if (-not $queue) { $queue = [Environment]::GetEnvironmentVariable('BUILD_QUEUE_SCRIPT', 'User') }
        if ($queue -and (Test-Path -LiteralPath $queue)) {
            . $queue
            $exitCode = Invoke-InBuildQueue -Label 'hushmessenger walk patch' -ScriptBlock $run
        } else {
            $global:LASTEXITCODE = 0
            & $run
            $exitCode = $LASTEXITCODE
        }
    } finally {
        Remove-Item -LiteralPath $argumentFile -Force -ErrorAction SilentlyContinue
        # The CLI unpacks all of Messenger here.
        Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction SilentlyContinue
    }
    if ($exitCode) { throw "The Desktop CLI exited with $exitCode. See $log." }
    if (-not (Test-Path -LiteralPath $resultFile)) { throw "The Desktop CLI wrote no result. See $log." }
    $report = Get-Content -LiteralPath $resultFile -Raw | ConvertFrom-Json
    $failed = @($report.failedPatches)
    if ($failed.Count -or -not (Test-WalkPatchSteps -Report $report) -or -not (Test-Path -LiteralPath $patched)) {
        throw "Patching didn't make a complete APK ($($failed.Count) patches failed). See $log."
    }
    Write-Host "[walk] applied $(@($report.appliedPatches).Count) patches to $($report.packageName) $($report.packageVersion)"
    Save-WalkPatchInputs -Destination $Destination -Inputs $patchInputs
    return $patched
}

function Invoke-WalkApp {
    param(
        [string]$Serial, [string]$ExpectedModel, [string]$Package, [string]$BundlePath, [string]$StockApk,
        [string]$Thread, [string[]]$Visit, [bool]$SkipPatch, [bool]$SkipSettings, [int]$SettleSeconds,
        [string]$OutDir, [string]$KeystorePath, [string]$Alias, [string]$StorePassword,
        [string]$Jar, [string]$JavaExe, [string]$AdbExe, [string]$LeaseDirectory
    )
    if (-not $Serial) { throw 'Name the device to walk with -Serial.' }
    if (-not $ExpectedModel) { throw 'Set -ExpectedModel (or HUSHMESSENGER_EXPECTED_DEVICE_MODEL) so the walk confirms the device.' }
    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { throw "No bundle at $BundlePath. Build it first (:patches:buildAndroid through the build wrapper)." }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

    $installApk = $null
    $patchedSha = ''
    $evidenceDir = Join-Path $OutDir 'steps'
    Remove-Item -LiteralPath $evidenceDir, (Join-Path $OutDir 'walk-receipt.json') -Recurse -Force -ErrorAction SilentlyContinue
    if ($SkipPatch) {
        $patchedSha = Find-WalkPatchRecord -Destination $OutDir -BundleSha256 $bundleSha256
    } else {
        if (-not $StockApk -or -not (Test-Path -LiteralPath $StockApk -PathType Leaf)) { throw 'No stock Messenger APK. Pass -Apk or set HUSH_NATIVE_FIXTURES.' }
        if (-not $KeystorePath -or -not (Test-Path -LiteralPath $KeystorePath -PathType Leaf)) { throw 'Pass -Keystore with the key the installed Messenger is signed with.' }
        if (-not $Jar -or -not (Test-Path -LiteralPath $Jar -PathType Leaf)) { throw 'Pass -DesktopJar or set HUSHMESSENGER_DESKTOP_JAR.' }
        Write-Host "[walk] patching $(Split-Path -Leaf $StockApk) with $(Split-Path -Leaf $BundlePath)"
        $installApk = Invoke-WalkPatch -JavaExe $JavaExe -Jar $Jar -BundlePath $BundlePath -StockApk $StockApk `
            -KeystorePath $KeystorePath -Alias $Alias -StorePassword $StorePassword -Destination $OutDir
        $patchedSha = (Get-FileHash -LiteralPath $installApk -Algorithm SHA256).Hash.ToLowerInvariant()
    }

    $applied = if ($patchedSha) { Read-WalkAppliedPatches -ResultFile (Join-Path $OutDir 'patch-result.json') } else { [string[]]@() }
    $skips = [Collections.Generic.List[string]]::new()
    foreach ($skip in @(Get-WalkSkips -SkipSettings $SkipSettings -Thread $Thread -Visit $Visit -Unproven (-not $patchedSha))) { $skips.Add($skip) }
    if ($patchedSha -and $applied.Count -eq 0) { $skips.Add("the list of patches Desktop applied (no readable patch-result.json in -OutDir)") }
    [void][IO.Directory]::CreateDirectory($evidenceDir)
    $lease = Enter-WalkLease -Directory $LeaseDirectory -Serial $Serial -ExpectedModel $ExpectedModel
    $problems = [Collections.Generic.List[string]]::new()
    $screens = 0
    try {
        function Invoke-WalkAdb([string[]]$Arguments) {
            Update-WalkLease $lease
            $preference = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            try { $output = @(& $AdbExe -s $Serial @Arguments 2>&1 | ForEach-Object { [string]$_ }) }
            finally { $ErrorActionPreference = $preference }
            return [pscustomobject]@{ ExitCode = $LASTEXITCODE; Stdout = $output }
        }
        $reportedSerial = @((Invoke-WalkAdb @('get-serialno')).Stdout)[0]
        $deviceModel = @((Invoke-WalkAdb @('shell', 'getprop', 'ro.product.model')).Stdout)[0]
        $deviceSdk = 0
        [void][int]::TryParse(([string]@((Invoke-WalkAdb @('shell', 'getprop', 'ro.build.version.sdk')).Stdout)[0]).Trim(), [ref]$deviceSdk)
        if ($reportedSerial -cne $Serial -or $deviceModel -cne $ExpectedModel) {
            throw "$Serial answers as $reportedSerial, model $deviceModel, not the expected $ExpectedModel. Nothing was changed on it."
        }
        [void](Invoke-WalkAdb @('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP'))
        $windows = (Invoke-WalkAdb @('shell', 'dumpsys', 'window')).Stdout -join "`n"
        if ($windows -match 'isKeyguardShowing=true') { throw "$Serial is on its lock screen. Unlock it by hand, then walk again." }

        if ($installApk) {
            Write-Host "[walk] installing $(Split-Path -Leaf $installApk) on $Serial"
            $installed = Invoke-WalkAdb @('install', '-r', $installApk)
            if ($installed.ExitCode -ne 0) {
                throw ("The build wouldn't install on $Serial, so nothing was walked: $($installed.Stdout -join ' '). " +
                    'If the signature clashes, patch with the key the installed Messenger uses (-Keystore). Messenger and its data were left alone.')
            }
        }
        $started = [DateTimeOffset]::UtcNow
        $startedEpoch = [long](@((Invoke-WalkAdb @('shell', 'date', '+%s')).Stdout)[0]).Trim()
        [void](Invoke-WalkAdb @('shell', 'am', 'force-stop', $Package))
        # Messenger's own launcher entry first, so each link lands in a running app, not a cold start.
        [void](Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/.auth.StartScreenActivity"))
        Start-Sleep -Seconds $SettleSeconds

        $dumpOnDevice = '/sdcard/hush-walk.xml'
        $shotOnDevice = '/sdcard/hush-walk.png'
        # A fresh dump of the screen in front, or '' when uiautomator couldn't make one. The old file
        # goes first, so a failed dump can never hand back the previous screen.
        function Read-WalkScreen([string]$Into) {
            [void](Invoke-WalkAdb @('shell', 'rm', '-f', $dumpOnDevice))
            $dumped = Invoke-WalkAdb @('shell', 'uiautomator', 'dump', $dumpOnDevice)
            if (($dumped.Stdout -join ' ') -notmatch 'dumped to') { return '' }
            $local = if ($Into) { $Into } else { Join-Path $OutDir 'walk-probe.xml' }
            $pulled = Invoke-WalkAdb @('pull', $dumpOnDevice, $local)
            if ($pulled.ExitCode -ne 0 -or -not (Test-Path -LiteralPath $local -PathType Leaf)) { return '' }
            return [IO.File]::ReadAllText($local)
        }
        function Close-WalkKeyboard {
            # Back only while the keyboard is up, where it closes the keyboard and leaves the screen alone.
            # Checked again after each Back, since a composer that takes focus late opens it again.
            for ($try = 0; $try -lt 3; $try++) {
                if (-not (Test-WalkKeyboardShown @((Invoke-WalkAdb @('shell', 'dumpsys', 'input_method')).Stdout))) { return }
                [void](Invoke-WalkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
                Start-Sleep -Seconds 1
            }
        }
        function Invoke-WalkTap([string]$Text) {
            # Never under the keyboard: close it first, then read the screen again.
            Close-WalkKeyboard
            $center = Find-WalkNodeCenter -Xml (Read-WalkScreen '') -Text $Text
            if ($null -eq $center) { return $false }
            [void](Invoke-WalkAdb @('shell', 'input', 'tap', [string]$center[0], [string]$center[1]))
            return $true
        }
        $size = @((Invoke-WalkAdb @('shell', 'wm', 'size')).Stdout | Where-Object { $_ -match '(\d+)x(\d+)' } |
            ForEach-Object { @([int]$Matches[1], [int]$Matches[2]) }) | Select-Object -Last 2
        $width, $height = if ($size.Count -eq 2) { $size } else { @(1080, 2340) }
        if ($installApk) {
            # The first start after an install upgrades Messenger's data. Until that's done a chat link stops on a blank
            # IntentHandlerActivity and the inbox won't dump (585 over 584.1 did both), so wait for the inbox or the
            # restore prompt that stands in front of it.
            # The clock, not a count of sleeps, ends the wait: a dump of a screen that's still busy can take seconds itself.
            $inboxMarker = (Get-WalkStepDefinition 'inbox').Marker
            $upgrade = [Diagnostics.Stopwatch]::StartNew()
            while ($upgrade.Elapsed.TotalSeconds -lt 90) {
                [string]$front = Read-WalkScreen ''
                if ($front -match $inboxMarker -or (Test-WalkRestorePrompt $front)) { break }
                Start-Sleep -Seconds 5
            }
        }
        # Scrolls the Controls list to the top, then down until -Text shows, and taps it.
        function Invoke-WalkFindAndTap([string]$Text) {
            $before = ''
            for ($i = 0; $i -lt 15; $i++) {
                $shape = Get-WalkScreenSignature -Xml (Read-WalkScreen '')
                if ($shape -ceq $before) { break }
                $before = $shape
                [void](Invoke-WalkAdb @('shell', 'input', 'swipe', [string]($width / 2), [string]([int]($height * 0.35)), [string]($width / 2), [string]([int]($height * 0.8)), '400'))
                Start-Sleep -Milliseconds 700
            }
            for ($i = 0; $i -lt 40; $i++) {
                if (Invoke-WalkTap $Text) { return $true }
                [void](Invoke-WalkAdb @('shell', 'input', 'swipe', [string]($width / 2), [string]([int]($height * 0.75)), [string]($width / 2), [string]([int]($height * 0.4)), '400'))
                Start-Sleep -Milliseconds 700
            }
            return $false
        }
        function Start-WalkSettings([string]$Page, [string]$Section = '') {
            $start = @('shell', 'am', 'start', '-W', '--activity-clear-task', '-n', "$Package/$WalkSettingsActivity", '--es', $WalkPageExtra, $Page)
            if ($Section) { $start += @('--es', $WalkSectionExtra, $Section) }
            return Invoke-WalkAdb $start
        }

        function Start-WalkLink([string]$Uri) {
            # A cold start for every link: a running Messenger hands the link to whatever screen it already shows (a Hush
            # settings window, the chat, its own settings), so each step would only photograph the one before it. Crashes
            # are read from the crash buffer, which a force-stop doesn't write to.
            [void](Invoke-WalkAdb @('shell', 'am', 'force-stop', $Package))
            Start-Sleep -Seconds 1
            return Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', $Uri, '-p', $Package)
        }
        function Start-WalkMessenger($Definition, [string]$Uri) {
            # The inbox has no link 584.1 routes from outside, so it gets the same cold start through its launcher activity.
            if ($Definition.Kind -cne 'inbox') { return Start-WalkLink $Uri }
            [void](Invoke-WalkAdb @('shell', 'am', 'force-stop', $Package))
            Start-Sleep -Seconds 1
            return Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkInboxActivity")
        }

        $plannedSteps = Get-WalkPlan -SkipSettings $SkipSettings -Thread $Thread -Visit $Visit -AppliedPatches $applied
        $stepRecords = [Collections.Generic.List[object]]::new()
        $shapesSeen = @{}
        foreach ($definition in $plannedSteps) {
            $problem = $null
            $uri = if ($definition.Kind -ceq 'chat') { "fb-messenger://user-thread/$Thread" } else { $definition.Link }
            switch ($definition.Kind) {
                'settings' { $launch = Start-WalkSettings $definition.Page }
                'sheet' {
                    $launch = Start-WalkSettings 'controls' $definition.Section
                    Start-Sleep -Seconds $SettleSeconds
                    if (-not (Invoke-WalkFindAndTap $definition.Button)) { $problem = "$($definition.Id): couldn't find its $($definition.Button) button on the Controls page" }
                }
                default { $launch = Start-WalkMessenger $definition $uri }
            }
            Start-Sleep -Seconds $SettleSeconds
            # Messenger puts its chat restore prompt in front now and then, as it does for anyone. Close it the way a
            # person would, from a fresh dump, and open the step again. The step's own dump must then show its screen.
            for ($closed = 0; $definition.Kind -cnotin 'settings', 'sheet' -and $closed -lt 2; $closed++) {
                $front = Read-WalkScreen ''
                if (-not (Test-WalkRestorePrompt $front)) { break }
                $close = Find-WalkNodeCenter -Xml $front -Text 'Close' -Described
                if ($null -ne $close) {
                    Write-Host "[walk] closing Messenger's chat restore prompt in front of $($definition.Id)"
                    [void](Invoke-WalkAdb @('shell', 'input', 'tap', [string]$close[0], [string]$close[1]))
                    Start-Sleep -Seconds 2
                    $launch = Start-WalkMessenger $definition $uri
                } elseif ($definition.Kind -ceq 'inbox' -and $Thread) {
                    # Some prompts (the API 32 emulator's) have no Close. The chat link opens past it without
                    # touching the backup, and bringing the launcher activity to the front then shows the inbox.
                    Write-Host "[walk] stepping around Messenger's chat restore prompt through the chat"
                    [void](Start-WalkLink "fb-messenger://user-thread/$Thread")
                    Start-Sleep -Seconds $SettleSeconds
                    $launch = Invoke-WalkAdb @('shell', 'am', 'start', '-W', '--activity-reorder-to-front', '-n', "$Package/$WalkInboxActivity")
                } else { break }
                Start-Sleep -Seconds $SettleSeconds
            }
            if (-not $problem -and ($launch.Stdout -join "`n") -notmatch '(?m)^Status:\s*ok\r?$') { $problem = "$($definition.Id) wouldn't start" }
            $activity = Read-WalkResumedComponent @((Invoke-WalkAdb @('shell', 'dumpsys', 'activity', 'activities')).Stdout)
            $name = $definition.Id -replace '[^\w.-]', '_'
            $xmlFile = Join-Path $evidenceDir "$name.xml"
            $pngFile = Join-Path $evidenceDir "$name.png"
            $xml = Read-WalkSettledScreen -CloseKeyboard { Close-WalkKeyboard } -ReadScreen { Read-WalkScreen $xmlFile }
            [void](Invoke-WalkAdb @('shell', 'rm', '-f', $shotOnDevice))
            [void](Invoke-WalkAdb @('shell', 'screencap', '-p', $shotOnDevice))
            $shot = Invoke-WalkAdb @('pull', $shotOnDevice, $pngFile)
            if (-not $problem) { $problem = Test-WalkStepScreen -Definition $definition -Activity $activity -Xml $xml }
            $windowFile = Join-Path $evidenceDir "$name.window.txt"
            $secureShot = $false
            if (-not $problem -and ($shot.ExitCode -ne 0 -or -not (Test-WalkPng $pngFile))) {
                # Screencap can't take a FLAG_SECURE window. Where the step's window is secure by design, its
                # dumpsys entry stands in, and only when that entry shows the flag.
                if ($definition.SecureBelowSdk -and $deviceSdk -gt 0 -and $deviceSdk -lt $definition.SecureBelowSdk) {
                    $entry = Get-WalkSettingsWindows @((Invoke-WalkAdb @('shell', 'dumpsys', 'window', 'windows')).Stdout)
                    if (Test-WalkSecureWindow $entry) {
                        [IO.File]::WriteAllText($windowFile, $entry)
                        Remove-Item -LiteralPath $pngFile -Force -ErrorAction SilentlyContinue
                        $secureShot = $true
                    }
                }
                if (-not $secureShot) { $problem = "$($definition.Id) left no screenshot" }
            }
            if (-not $problem) {
                $shape = Get-WalkScreenSignature -Xml $xml
                if ($shapesSeen.ContainsKey($shape)) { $problem = "$($definition.Id) showed the same screen as $($shapesSeen[$shape])" }
                else { $shapesSeen[$shape] = $definition.Id }
            }
            if ($definition.Kind -ceq 'sheet' -and -not (Invoke-WalkTap $definition.Close)) {
                [void](Invoke-WalkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            }
            if ($problem) {
                $problems.Add($problem)
                Write-Host "[walk] $problem"
            } else {
                $screens++
                Write-Host "[walk] opened $($definition.Id) ($activity)"
            }
            if ($definition.Kind -ceq 'extra') { continue }
            $hashOf = { param($file) if (Test-Path -LiteralPath $file -PathType Leaf) { (Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant() } else { '' } }
            $record = [ordered]@{
                id = $definition.Id; activity = $activity; opened = -not $problem; problem = [string]$problem
                screenshot = "steps/$name.png"; screenshotSha256 = (& $hashOf $pngFile)
                uiDump = "steps/$name.xml"; uiDumpSha256 = (& $hashOf $xmlFile)
            }
            if ($secureShot) {
                $record.screenshot = ''; $record.screenshotSha256 = ''
                $record.secureWindow = "steps/$name.window.txt"; $record.secureWindowSha256 = (& $hashOf $windowFile)
            }
            $stepRecords.Add($record)
        }
        [void](Invoke-WalkAdb @('shell', 'rm', '-f', $dumpOnDevice, $shotOnDevice))
        Remove-Item -LiteralPath (Join-Path $OutDir 'walk-probe.xml') -Force -ErrorAction SilentlyContinue
        # Back to the inbox, so the phone is left on Messenger's home screen.
        [void](Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/.auth.StartScreenActivity"))

        $crashRead = Invoke-WalkAdb @('logcat', '-b', 'crash', '-d', '-v', 'epoch')
        $crashLines = @($crashRead.Stdout)
        if ($crashRead.ExitCode -ne 0) {
            # An empty read would look like a walk with no crash.
            $problems.Add("couldn't read the crash buffer (adb exited $($crashRead.ExitCode)), so a crash could have gone unseen")
            $crashLines = @()
        }
        $fatal = @(Select-WalkCrashes -Lines $crashLines -Package $Package -SinceEpoch $startedEpoch)
        $translatorAborts = @(Select-WalkTranslatorAborts -Lines $crashLines -Package $Package -SinceEpoch $startedEpoch)
        if ($fatal.Count -gt 0 -or $translatorAborts.Count -gt 0) {
            [IO.File]::WriteAllLines((Join-Path $OutDir 'crash-buffer.txt'), [string[]]$crashLines)
        }
        if ($fatal.Count -gt 0) { $problems.Add("Messenger crashed during the walk: $($fatal[0].Trim())") }
        foreach ($abort in $translatorAborts) {
            Write-Host "[walk] not counted, the emulator's ARM translator aborted in a forked child (crash-buffer.txt): $($abort.Trim())"
        }

        $appVersion = @((Invoke-WalkAdb @('shell', 'dumpsys', 'package', $Package)).Stdout |
            Where-Object { $_ -match 'versionName=(.+)$' } | ForEach-Object { $Matches[1].Trim() }) | Select-Object -First 1
        $apkPath = @((Invoke-WalkAdb @('shell', 'pm', 'path', $Package)).Stdout | Where-Object { $_ -like 'package:*base.apk' }) | Select-Object -First 1
        $installedSha = ''
        if ($apkPath) { $installedSha = Read-WalkSha256 @((Invoke-WalkAdb @('shell', 'sha256sum', $apkPath.Substring(8))).Stdout) }
        $apkProblem = Get-WalkApkProblem -Installed $installedSha -Patched $patchedSha
        if ($apkProblem) { $problems.Add($apkProblem) }

        $full = $skips.Count -eq 0 -and $problems.Count -eq 0
        $result = Resolve-WalkOutcome -Screens $screens -Crashes $fatal.Count -Problems ([string[]]$problems) -Full $full
        $receipt = New-WalkReceipt -Result $result -Full $full -Serial $Serial -Device $deviceModel -Sdk $deviceSdk `
            -AppVersion ([string]$appVersion) -BundleSha256 $bundleSha256 -PatchedApkSha256 $patchedSha -InstalledApkSha256 $installedSha `
            -Started $started -Finished ([DateTimeOffset]::UtcNow) -AppliedPatches $applied -Steps $stepRecords.ToArray() `
            -Crashes $fatal.Count -Problems ([string[]]$problems)
        $receiptPath = Join-Path $OutDir 'walk-receipt.json'
        [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 6) + "`n")

        Write-Host "[walk] $result on $deviceModel ($Serial): $screens screens, $($fatal.Count) crashes, $($problems.Count) problems"
        foreach ($problem in $problems) { Write-Host "[walk]   $problem" }
        foreach ($skip in $skips) { Write-Host "[walk]   left out: $skip" }
        Write-Host "[walk] receipt $receiptPath"
        if ($result -ne 'PASS') { Write-Host '[walk] this walk does not back a release.' }
        return $receiptPath
    } finally {
        Exit-WalkLease $lease
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
    $Root = [IO.Path]::GetFullPath($Root)
    $OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
    if (-not $PSBoundParameters.ContainsKey('Visit')) { $Visit = $WalkDefaultScreens }
    if (-not $Bundle) {
        $versionLine = Select-String -LiteralPath (Join-Path $Root 'gradle.properties') -Pattern '^version=(.+)$' | Select-Object -First 1
        if (-not $versionLine) { throw 'gradle.properties has no version line.' }
        $Bundle = Join-Path $Root "patches/build/libs/patches-$($versionLine.Matches[0].Groups[1].Value.Trim()).mpp"
    }
    $Bundle = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Bundle)
    if (-not $DesktopJar) { $DesktopJar = $env:HUSHMESSENGER_DESKTOP_JAR }
    if (-not $DesktopJar) { $DesktopJar = [Environment]::GetEnvironmentVariable('HUSHMESSENGER_DESKTOP_JAR', 'User') }
    if (-not $Java) { $Java = if ($env:JAVA_HOME) { Join-Path $env:JAVA_HOME 'bin/java.exe' } else { 'java' } }
    if (-not $Adb) {
        $Adb = (Get-Command adb -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1).Source
        if (-not $Adb -and $env:ANDROID_HOME) { $Adb = Join-Path $env:ANDROID_HOME 'platform-tools/adb.exe' }
        if (-not $Adb -or -not (Test-Path -LiteralPath $Adb)) { throw 'No adb found. Pass -Adb or put it on the PATH.' }
    }
    if (-not $Apk -and -not $SkipPatch -and $env:HUSH_NATIVE_FIXTURES -and (Test-Path -LiteralPath $env:HUSH_NATIVE_FIXTURES -PathType Container)) {
        $installedCode = if ($Serial -and $ExpectedModel) {
            Get-WalkInstalledVersionCode -AdbExe $Adb -Serial $Serial -ExpectedModel $ExpectedModel -Package $Package -LeaseDirectory $LeaseDirectory
        } else { '' }
        $Apk = Select-WalkFixtureApk -Directory $env:HUSH_NATIVE_FIXTURES -InstalledCode $installedCode
        Write-Host "[walk] the device has build $(if ($installedCode) { $installedCode } else { 'none' }), so patching $(Split-Path -Leaf $Apk)"
    }
    $receiptPath = Invoke-WalkApp -Serial $Serial -ExpectedModel $ExpectedModel -Package $Package -BundlePath $Bundle -StockApk $Apk `
        -Thread $Thread -Visit $Visit -SkipPatch:$SkipPatch -SkipSettings:$SkipSettings -SettleSeconds $SettleSeconds `
        -OutDir $OutDir -KeystorePath $Keystore -Alias $KeyAlias -StorePassword $KeystorePassword `
        -Jar $DesktopJar -JavaExe $Java -AdbExe $Adb -LeaseDirectory $LeaseDirectory
    $receiptPath
    exit (Get-WalkExitCode (Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json).result)
}
