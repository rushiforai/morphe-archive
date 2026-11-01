<#
.SYNOPSIS
    Walk the whole patched Threads on a leased phone or an emulator and leave a walk receipt.

.DESCRIPTION
    release/release.ps1's publish stage refuses a bundle without a receipt that a whole-app walk
    of that exact bundle left (walk-receipt.ps1). This runs the walk. It patches Threads from the
    repo's release bundle and installs it with patch-for-device.ps1, opens each Threads screen in
    walk-app-core.ps1's list by its link, then goes the user's way into Threads' own settings and
    through its HushThreads row to every HushThreads settings page, reads the crash and system logs for a Threads crash or ANR since the walk began, and
    writes walk-receipt.json with New-WalkReceipt. The receipt names the SHA-256 of the .mpp the
    walked APK was patched with, which is what publish holds it to.

    The result the walk writes:
      PASS      every settings page and screen opened, Threads stayed up, no crash.
      PARTIAL   a page or screen was skipped or never found, so it wasn't the whole app.
      FAIL      a Threads crash or ANR, a screen that wouldn't open, or Threads leaving the front.
    Only a PASS backs a release.

    Screens open by link. The only taps are the Profile tab, the own profile's Settings button,
    the HushThreads row in Threads' settings and the HushThreads settings page rows, each on its
    own screen (walk-app-core.ps1's Test-WalkTapAllowed), so it can't follow, like, post or
    message anyone. It needs the device lease HushThreads' device scripts check
    (HUSHTHREADS_DEVICE_LEASE_DIR, _TOKEN and _IDENTITY, see device-install.ps1), held for the
    whole walk. It never uninstalls or clears Threads, never turns off stay awake and never sends
    sleep or power. An install that can't update Threads in place stops the walk.

.EXAMPLE
    scripts/walk-app.ps1 -Serial emulator-5580

.EXAMPLE
    # Walk a retained install only with its original patch-for-device provenance:
    scripts/walk-app.ps1 -Serial <adb serial> -SkipPatch -PatchReceipt <patch-receipt.json>
#>
[CmdletBinding()]
param(
    [string]$Serial = $env:HUSHTHREADS_DEVICE_SERIAL,
    # Walk the Threads that's already installed instead of patching and installing a fresh one.
    # It must have been patched from the release bundle: the receipt names that bundle's hash.
    [switch]$SkipPatch,
    # Required provenance for a retained install; defaults to OutDir/patch-receipt.json.
    [string]$PatchReceipt,
    # Leave the HushThreads settings out. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [int]$SettleSeconds = 5,
    [string]$OutDir = (Join-Path $env:TEMP 'hushthreads-walk'),
    # Passed to patch-for-device.ps1, so the build is signed with the key the installed Threads
    # already carries (its default is the sideload key).
    [string]$Keystore,
    [string]$KeyAlias,
    [string]$Apk,
    [string]$DesktopJar,
    [string]$Java,
    [string]$Aapt2,
    # The checkout whose release bundle is walked, the one holding this script unless given.
    [string]$Root
)

$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')
. (Join-Path $PSScriptRoot 'walk-app-core.ps1')
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')

function Invoke-WalkApp {
    param(
        [string]$Serial, [bool]$SkipPatch, [bool]$SkipSettings, [int]$SettleSeconds, [string]$OutDir,
        [hashtable]$PatchArgs, [string]$Root, [string]$PatchReceipt
    )
    if (-not $Serial) { throw 'Name the device to walk with -Serial (or HUSHTHREADS_DEVICE_SERIAL).' }
    if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
    $Root = [IO.Path]::GetFullPath($Root)
    $OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

    $adb = (Get-Command adb -ErrorAction SilentlyContinue).Source
    if (-not $adb) { $adb = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\WinGet\Packages" -Recurse -Filter adb.exe -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName }
    if (-not $adb) { throw 'No adb found. Put it on the PATH or install the platform tools.' }

    # The bundle publish will hash, named in the receipt so a walk of any other build can't stand in.
    $version = Get-BundleVersion -Root $Root
    $bundle = Get-ReleaseBundlePath -Root $Root -Version $version
    if (-not (Test-Path -LiteralPath $bundle -PathType Leaf)) {
        throw "No release bundle at $bundle. Build it first (:patches:generatePatchesList then :patches:buildAndroid, through the governor)."
    }
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    $sections = @(Get-WalkSections -Root $Root)
    Assert-HushThreadsDeviceLease -Adb $adb -Serial $Serial

    function Invoke-WalkAdb([string[]]$Arguments) {
        Invoke-HushThreadsAdbCommand -Adb $adb -RequireLease -Arguments (@('-s', $Serial) + $Arguments)
    }
    function Read-WalkInstalledApk {
        $paths = Invoke-WalkAdb @('shell', 'pm', 'path', $WalkPackage)
        $metadata = Invoke-WalkAdb @('shell', 'dumpsys', 'package', $WalkPackage)
        $apks = @($paths.Output | Where-Object { $_ -cmatch '^package:.+\.apk$' })
        if ($paths.ExitCode -ne 0 -or $metadata.ExitCode -ne 0 -or $apks.Count -ne 1) {
            throw 'Cannot bind the walk to one installed, merged Threads APK.'
        }
        $installedPath = $apks[0].Substring(8).Trim()
        $hash = Invoke-WalkAdb @('shell', 'sha256sum', $installedPath)
        $sha = (($hash.Output -join '').Trim() -split '\s+')[0].ToLowerInvariant()
        $text = $metadata.Output -join "`n"
        $versionName = [regex]::Match($text, '(?m)^\s*versionName=(\S+)\s*$')
        $versionCode = [regex]::Match($text, '(?m)^\s*versionCode=(\d+)\b')
        if ($hash.ExitCode -ne 0 -or $sha -cnotmatch '\A[0-9a-f]{64}\z' -or
            -not $versionName.Success -or -not $versionCode.Success) {
            throw 'Cannot read the installed APK hash and exact build.'
        }
        [pscustomobject]@{ Sha256 = $sha; VersionName = $versionName.Groups[1].Value; VersionCode = $versionCode.Groups[1].Value }
    }
    function Write-WalkLog([string]$Message) { Write-Host "[walk] $Message" }
    function Test-WalkAlive {
        $running = Invoke-WalkAdb @('shell', 'pidof', $WalkPackage)
        $running.ExitCode -eq 0 -and ($running.Output -join '').Trim() -match '^\d+'
    }
    function Test-WalkForeground {
        $resumed = @((Invoke-WalkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output |
            Where-Object { $_ -match 'ResumedActivity' }) -join ' '
        $resumed -match [regex]::Escape("$WalkPackage/")
    }
    $remoteDump = '/data/local/tmp/hushthreads-walk.xml'
    function Get-WalkDump {
        # The old dump goes first: a dump that fails leaves the last one behind, which would read
        # as the screen that was there before. A dump fails while a video plays, so it gets three
        # tries.
        for ($try = 0; $try -lt 3; $try++) {
            [void](Invoke-WalkAdb @('shell', 'rm', '-f', $remoteDump))
            [void](Invoke-WalkAdb @('shell', 'uiautomator', 'dump', $remoteDump))
            $read = Invoke-WalkAdb @('exec-out', 'cat', $remoteDump)
            $xml = $read.Output -join "`n"
            $start = $xml.IndexOf('<?xml')
            if ($read.ExitCode -eq 0 -and $start -ge 0) { return @(ConvertFrom-UiDump -Xml $xml.Substring($start)) }
            Start-Sleep -Milliseconds 1000
        }
        @()
    }
    function Close-WalkKeyboard {
        $ime = (Invoke-WalkAdb @('shell', 'dumpsys', 'input_method')).Output -join "`n"
        if ($ime -match 'mInputShown=true') {
            [void](Invoke-WalkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Milliseconds 800
        }
    }
    # The walk's only tap, of a node Test-WalkTapAllowed passes on the dump it came from.
    function Invoke-WalkTap($Row, [object[]]$OnScreen) {
        if (-not (Test-WalkTapAllowed -Node $Row -Sections $sections -Nodes $OnScreen)) {
            throw "The walk refused to tap '$($Row.Text)' ($($Row.Desc), id $($Row.Id)): it isn't a settings row or a step to Threads' settings."
        }
        [void](Invoke-WalkAdb @('shell', 'input', 'tap', "$($Row.X)", "$($Row.Y)"))
    }
    function Invoke-WalkBack {
        [void](Invoke-WalkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
        Start-Sleep -Milliseconds 1500
    }

    if (-not $SkipPatch) {
        if ($PatchReceipt) { throw '-PatchReceipt is for -SkipPatch; a fresh patch writes its own provenance.' }
        Write-WalkLog "patching Threads with $(Split-Path -Leaf $bundle) and installing it on $Serial"
        $patchArguments = @{ Serial = $Serial; OutDir = $OutDir; Root = $Root } + $PatchArgs
        # patch-for-device.ps1 reports through Write-Host, so its lines come back on stream 6.
        $patchOut = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @patchArguments 6>&1 | ForEach-Object { "$_" })
        $patchOut | Out-Host
        $PatchReceipt = Join-Path $OutDir 'patch-receipt.json'
    }
    if (-not $PatchReceipt) { $PatchReceipt = Join-Path $OutDir 'patch-receipt.json' }
    if (-not (Test-Path -LiteralPath $PatchReceipt -PathType Leaf)) {
        throw 'No patch provenance. Supply the original patch-for-device patch-receipt.json; the retained install was not changed.'
    }
    $patch = Read-WalkJson -Path $PatchReceipt
    $bound = Test-WalkPatchReceipt -Receipt $patch -BundlePath $bundle -Java $PatchArgs.Java -DesktopJar $PatchArgs.DesktopJar -Aapt2 $PatchArgs.Aapt2 -SourceRoot $Root
    if (-not $bound.Valid) { throw "The installed APK cannot qualify this bundle: $($bound.Reason)" }
    $installedBefore = Read-WalkInstalledApk
    if ($installedBefore.Sha256 -cne $patch.apk.sha256 -or
        $installedBefore.VersionName -cne $patch.apk.versionName -or $installedBefore.VersionCode -cne $patch.apk.versionCode) {
        throw 'The retained installed APK does not match its patch provenance. No reinstall was attempted.'
    }

    $faults = [Collections.Generic.List[string]]::new()
    $reached = [Collections.Generic.List[string]]::new()
    $planned = [Collections.Generic.List[string]]::new([string[]]@(Get-WalkExpectedScreens -Root $Root))
    $started = [DateTimeOffset]::UtcNow
    $startedEpoch = [long](((Invoke-WalkAdb @('shell', 'date', '+%s')).Output -join '').Trim())
    $deviceModel = ((Invoke-WalkAdb @('shell', 'getprop', 'ro.product.model')).Output -join '').Trim()

    # A pause marker left from a device check runs Threads unpatched, which is no walk of the bundle.
    $marker = Invoke-WalkAdb @('shell', 'ls', "/sdcard/Android/data/$WalkPackage/files/hushthreads-safe-mode")
    if ($marker.ExitCode -eq 0) {
        $faults.Add('the hushthreads-safe-mode pause marker is on the device, so Threads ran with HushThreads paused')
    }

    [void](Invoke-WalkAdb @('shell', 'am', 'force-stop', $WalkPackage))
    [void](Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-n', "$WalkPackage/$WalkMainActivity"))
    Start-Sleep -Seconds $SettleSeconds
    if (-not (Test-WalkAlive) -or -not (Test-WalkForeground)) { $faults.Add('Threads did not come up in front after a cold start') }

    foreach ($screen in $WalkScreens) {
        $launch = Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', $screen.Link, '-p', $WalkPackage)
        Start-Sleep -Seconds $SettleSeconds
        $launched = ($launch.Output -join "`n") -match '(?m)^Status:\s*ok\r?$'
        $alive = Test-WalkAlive
        $front = $alive -and (Test-WalkForeground)
        $seen = if ($front) { Wait-WalkScreen -Read { Get-WalkDump } -Test { param($dump) Test-WalkScreenShown -Nodes $dump -Screen $screen } }
        $shown = $front -and $seen.Found
        if ($launched -and $front -and $shown) {
            $reached.Add($screen.Name)
            Write-WalkLog "opened $($screen.Name)"
        } else {
            $unread = if ($front -and $seen.Unread) { ", and uiautomator couldn't read the screen" } else { '' }
            $faults.Add("$($screen.Name) ($($screen.Link)) didn't open: launched $launched, Threads running $alive, in front $front, showing what it should $shown$unread")
            Write-WalkLog "$($screen.Name) didn't open"
        }
        if (-not $alive) { break }
    }

    # The settings last, reached the way a user gets there: the Profile tab, the profile's
    # Settings button, then the HushThreads row in Threads' settings.
    if (-not $SkipSettings) {
        [void](Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', 'barcelona://mainfeed', '-p', $WalkPackage))
        Start-Sleep -Seconds $SettleSeconds
        $size = [regex]::Matches(((Invoke-WalkAdb @('shell', 'wm', 'size')).Output -join "`n"), '(\d+)x(\d+)')
        if ($size.Count -eq 0) { throw "Couldn't read the screen size of $Serial." }
        $width = [int]$size[$size.Count - 1].Groups[1].Value
        $height = [int]$size[$size.Count - 1].Groups[2].Value
        $swipeList = {
            $x = [int]($width / 2)
            [void](Invoke-WalkAdb @('shell', 'input', 'swipe', "$x", "$([int]($height * 0.7))", "$x", "$([int]($height * 0.35))", '450'))
            Start-Sleep -Milliseconds 1200
        }
        $missing = $null
        foreach ($step in $WalkSettingsPath) {
            $seen = Wait-WalkStep -Step $step -Read { Get-WalkDump } -Swipe $swipeList
            if (-not $seen.Found) {
                $missing = if ($seen.Unread) { "uiautomator couldn't read the screen, looking for $($step.Name)," } else { "$($step.Name) wasn't on screen" }
                break
            }
            if ($step.Shows) {
                $reached.Add($step.Shows)
                Write-WalkLog "opened $($step.Shows)"
            }
            Invoke-WalkTap -Row (Find-WalkPathNode -Nodes $seen.Nodes -Step $step) -OnScreen $seen.Nodes
            Start-Sleep -Seconds 3
            Close-WalkKeyboard
        }
        $openedBy = "the HushThreads row in Threads' settings"
        if ($missing) {
            $faults.Add("$missing on the way to the HushThreads settings")
            # The pages still get walked, opened by the settings intent instead.
            [void](Invoke-WalkAdb @('shell', 'am', 'start', '-W', '-n', "$WalkPackage/$WalkMainActivity", '--ez', $WalkOpenSettingsExtra, 'true'))
            Start-Sleep -Seconds $SettleSeconds
            Close-WalkKeyboard
            $openedBy = 'the settings intent'
        }
        $nodes = (Wait-WalkScreen -Read { Get-WalkDump } -Test { param($dump) (Get-WalkSettingsPage -Nodes $dump -Sections $sections) -ceq 'home' }).Nodes
        if ((Get-WalkSettingsPage -Nodes $nodes -Sections $sections) -ceq 'home') {
            $reached.Add('Settings: home')
            Write-WalkLog 'opened HushThreads settings'
            $remaining =[Collections.Generic.List[string]]::new([string[]]$sections)
            $swipes = 0
            while ($remaining.Count -gt 0) {
                if ((Get-WalkSettingsPage -Nodes $nodes -Sections $sections) -cne 'home') {
                    $faults.Add("the settings home page wasn't showing with $($remaining -join ', ') still to open")
                    break
                }
                $row = $null; $name = $null
                foreach ($candidate in $remaining) {
                    $row = Find-WalkSectionRow -Nodes $nodes -Section $candidate
                    if ($row) { $name = $candidate; break }
                }
                if (-not $row) {
                    # The rest are further down the list. A swipe that changes nothing hit the end.
                    if ($swipes -ge 12) { break }
                    $before = Get-UiFingerprint -Nodes $nodes
                    $x = [int]($width / 2)
                    [void](Invoke-WalkAdb @('shell', 'input', 'swipe', "$x", "$([int]($height * 0.7))", "$x", "$([int]($height * 0.35))", '450'))
                    $swipes++
                    Start-Sleep -Milliseconds 1200
                    $nodes = @(Get-WalkDump)
                    if ((Get-UiFingerprint -Nodes $nodes) -ceq $before) { break }
                    continue
                }
                [void]$remaining.Remove($name)
                Invoke-WalkTap -Row $row -OnScreen $nodes
                Start-Sleep -Seconds 2
                $shown = Get-WalkSettingsPage -Nodes @(Get-WalkDump) -Sections $sections
                if ($shown -ceq $name) {
                    $reached.Add("Settings: $name")
                    Write-WalkLog "opened the $name page"
                } else {
                    $faults.Add("the $name row opened $(if ($shown) { "'$shown'" } else { 'something else' })")
                }
                if (-not (Test-WalkAlive)) { $faults.Add("Threads died on the $name page"); break }
                Invoke-WalkBack
                Close-WalkKeyboard
                $nodes = @(Get-WalkDump)
            }
            # Back out of the settings screen to Threads.
            for ($i = 0; $i -lt 3 -and (Get-WalkSettingsPage -Nodes @(Get-WalkDump) -Sections $sections); $i++) { Invoke-WalkBack }
        } else {
            $faults.Add("HushThreads settings didn't open from $openedBy")
        }
    }

    # Threads' crashes and ANRs since the walk began. The crash log holds Java and native
    # crashes, the system log ActivityManager's ANRs. Nothing is cleared on the device.
    $logLines = foreach ($buffer in 'crash', 'system') {
        Select-WalkLogSince -Lines @((Invoke-WalkAdb @('logcat', '-b', $buffer, '-d', '-v', 'epoch')).Output) -Since $startedEpoch
    }
    $crashes = @(Get-WalkCrashes -Lines @($logLines))
    if ($crashes.Count -gt 0) { [IO.File]::WriteAllLines((Join-Path $OutDir 'crash-log.txt'), [string[]]@($logLines)) }

    $installedAfter = Read-WalkInstalledApk
    $appVersion = $installedAfter.VersionName
    if ($installedAfter.Sha256 -cne $installedBefore.Sha256 -or $installedAfter.VersionName -cne $installedBefore.VersionName -or
        $installedAfter.VersionCode -cne $installedBefore.VersionCode) {
        $faults.Add('the installed APK or its build changed during the walk')
    }

    $verdict = Get-WalkVerdict -Planned ([string[]]$planned) -Reached ([string[]]$reached) -Crashes $crashes -Faults ([string[]]$faults)
    $receipt = New-WalkReceipt -Result $verdict.Result -Full $verdict.Full -Serial $Serial -Device $deviceModel `
        -AppVersion "$appVersion" -AppVersionCode $installedAfter.VersionCode -BundleSha256 $bundleSha256 `
        -InstalledApkSha256 $installedAfter.Sha256 -InstalledBeforeSha256 $installedBefore.Sha256 `
        -Started $started -Finished ([DateTimeOffset]::UtcNow) -Screens $reached.Count -Crashes $crashes.Count `
        -Problems ([string[]]$verdict.Problems) -PlannedScreens ([string[]]$planned) -ReachedScreens ([string[]]$reached) -Patch $patch
    $receiptPath = Join-Path $OutDir 'walk-receipt.json'
    [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")
    if ($verdict.Result -ceq 'PASS') {
        $checked = Test-WalkReceipt -Path $receiptPath -BundlePath $bundle -Java $PatchArgs.Java -DesktopJar $PatchArgs.DesktopJar -Aapt2 $PatchArgs.Aapt2 -SourceRoot $Root
        if (-not $checked.Valid) { throw "The walk cannot earn PASS: $($checked.Reason)" }
    }

    Write-WalkLog "$($verdict.Result) on $deviceModel ($Serial), Threads ${appVersion}, $($reached.Count) of $($planned.Count) screens, $($crashes.Count) crashes"
    foreach ($problem in $verdict.Problems) { Write-WalkLog "  $problem" }
    Write-WalkLog "receipt $receiptPath"
    if ($verdict.Result -cne 'PASS') { Write-WalkLog 'this walk does not back a release.' }
    [pscustomobject]@{ Result = $verdict.Result; Receipt = $receiptPath }
}

if ($MyInvocation.InvocationName -ne '.') {
    $patchArgs = @{}
    foreach ($name in 'Keystore', 'KeyAlias', 'Apk', 'DesktopJar', 'Java', 'Aapt2') {
        if ($PSBoundParameters.ContainsKey($name)) { $patchArgs[$name] = $PSBoundParameters[$name] }
    }
    $walked = Invoke-WalkApp -Serial $Serial -SkipPatch:$SkipPatch -SkipSettings:$SkipSettings -SettleSeconds $SettleSeconds `
        -OutDir $OutDir -PatchArgs $patchArgs -Root $Root -PatchReceipt $PatchReceipt
    if ($walked.Result -cne 'PASS') { exit 1 }
}
