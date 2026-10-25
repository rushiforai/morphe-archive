<#
.SYNOPSIS
    Walk the whole patched app on a leased phone or an emulator and leave a walk receipt.

.DESCRIPTION
    release/publish-release.ps1 refuses to publish a bundle without a receipt that a whole-app walk
    of that exact bundle left (walk-receipt.ps1). This runs the walk: it patches Pinterest from the
    repo's release bundle with patch-for-device.ps1, installs it with the account-preserving
    installer, opens each patched screen and every Hush settings page, watches the crash buffer for
    a Pinterest crash, and writes walk-receipt.json with New-WalkReceipt. The receipt binds the
    checked patch run to the signed APK observed on the device. Publish also holds the bundle
    and catalog hashes to the release. When
    the release build stage has already staged that bundle, the two have to be the same file.

    The result the walk writes:
      PASS      the whole app was walked, every screen and settings page opened, no crash.
      PARTIAL   the settings pages were skipped, so it was not the whole app.
      FAIL      a Pinterest crash, a screen or page that would not open, or Pinterest gone at the end.
    Only a PASS backs a release.

    A screen is opened by its deep link (am start -W -a VIEW -d ... -p com.pinterest) and counts
    when the start reports ok with Pinterest in front. The Hush settings open through
    APPLICATION_PREFERENCES, the intent Android's App info page sends. Settings has no intent for a
    single page, so each page is opened from the settings list: a fresh uiautomator dump, the row
    whose text is exactly the page's name, a tap on its centre, and a page counts when its title
    shows and the list's search box is gone. Back returns to the list. Taps only ever
    land on Hush settings rows read from a dump taken after the last scroll or Back.

    Device safety: the walk takes an exclusive serial lease and releases it when it's done. It
    changes no device setting, only wakes the screen, and stops when the phone is locked rather than
    unlocking it. It never uninstalls or clears the installed app; an install that can't update
    the app in place is a problem the walk reports, not one it forces past.

.EXAMPLE
    scripts/walk-app.ps1 -Serial emulator-5578

.EXAMPLE
    # Survey an installed build. Without build evidence this produces PARTIAL, never a release PASS:
    scripts/walk-app.ps1 -Serial <your phone's adb serial> -SkipPatch

.EXAMPLE
    # Walk an installed APK with the matching sidecar written by patch-for-device.ps1:
    scripts/walk-app.ps1 -Serial <your phone's adb serial> -SkipPatch -BuildEvidence <signed.apk.build.json>
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Package = 'com.pinterest',
    # The patched screens to open, each a deep link. A link that won't open fails the walk rather
    # than skipping it.
    [string[]]$Visit = @(
        'pinterest://search/pins/?q=nature',
        'pinterest://search/boards/?q=recipes',
        'pinterest://search/users/?q=art',
        'pinterest://pin/1477812369124424/',
        'pinterest://notifications/'
    ),
    # The Hush settings pages, by the name each row shows in English. The walk opens every one.
    [string[]]$SettingsPages = @('Feed', 'Privacy', 'Pin actions', 'Interface', 'Links', 'Notifications',
        "Pinterest's own settings", 'Updates', 'Pause, backup and diagnostics', 'About'),
    # An unbound installed build can be surveyed, but only matching build evidence permits a
    # release walk. The sidecar comes from patch-for-device.ps1 after its checks pass.
    [switch]$SkipPatch,
    [string]$BuildEvidence,
    # Leave the Hush settings pages out of the walk. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [ValidateRange(1, 30)][int]$SettleSeconds = 4,
    [string]$OutDir = (Join-Path $env:TEMP 'hushpinterest-walk'),
    # Passed to patch-for-device.ps1, so the build is signed with the key the installed app uses.
    [string]$Keystore,
    [string]$KeyAlias,
    [string]$LeaseDirectory = $env:HUSHPINTEREST_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHPINTEREST_CHAT_ID,
    [string]$Adb,
    [string]$Aapt2,
    # The checkout whose release bundle is walked, the one holding this script unless given.
    [string]$Root
)

$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
. (Join-Path $PSScriptRoot 'device-install.ps1')
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')

$WalkMainActivity = 'com.pinterest.activity.PinterestActivity'
# The settings list's search box, read by its hint. It sits above the list, so scrolling never hides
# it, and a page hides it, so it going away is how a page is told from the list. (The list's own
# headings scroll off the top once a lower row has been reached.)
$WalkSettingsHome = 'Search settings'

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

function Get-WalkCrashLines {
    <#
    .SYNOPSIS
        The crash buffer lines that name a Pinterest crash at or after -Since (device epoch
        seconds): a Java crash's "Process: com.pinterest" line or a native crash's
        ">>> com.pinterest <<<" line, Pinterest's own :name processes included. Another app's
        crash, or one from before the walk, is left out.
    #>
    param([string[]]$Lines, [long]$Since, [string]$Package = 'com.pinterest')
    $current = $false
    $name = [regex]::Escape($Package) + '(?::[\w.]+)?(?![\w.:])'
    foreach ($line in @($Lines)) {
        if ($line -match '^\s*(\d+)\.\d+\s') { $current = [long]$Matches[1] -ge $Since }
        if (-not $current) { continue }
        if ($line -match "Process:\s*$name" -or $line -match ">>>\s*$name\s*<<<") { $line }
    }
}

function ConvertFrom-WalkDump {
    <#
    .SYNOPSIS
        The text nodes of a uiautomator dump: text, package and the centre of their bounds.
    #>
    param([string]$Xml)
    if ([string]::IsNullOrWhiteSpace($Xml) -or $Xml -notmatch '<hierarchy') { return @() }
    $document = [xml]$Xml
    foreach ($node in $document.SelectNodes('//node')) {
        $text = [string]$node.GetAttribute('text')
        if (-not $text) { continue }
        if ($node.GetAttribute('bounds') -notmatch '^\[(\d+),(\d+)\]\[(\d+),(\d+)\]$') { continue }
        [pscustomobject]@{
            Text = $text; Package = [string]$node.GetAttribute('package')
            X = [int](([int]$Matches[1] + [int]$Matches[3]) / 2); Y = [int](([int]$Matches[2] + [int]$Matches[4]) / 2)
            Top = [int]$Matches[2]; Bottom = [int]$Matches[4]
        }
    }
}

function Find-WalkRow {
    <# The one Pinterest node whose text is exactly -Text, or $null when there isn't exactly one. #>
    param($Nodes, [string]$Text, [string]$Package = 'com.pinterest')
    $found = @($Nodes | Where-Object { $_.Package -ceq $Package -and $_.Text -ceq $Text })
    if ($found.Count -eq 1) { return $found[0] }
    return $null
}

function Invoke-WalkApp {
    param(
        [string]$Serial, [string]$Package, [string[]]$Visit, [string[]]$SettingsPages,
        [bool]$SkipPatch, [bool]$SkipSettings, [int]$SettleSeconds, [string]$OutDir,
        [string]$BuildEvidence,
        [string]$Keystore, [string]$KeyAlias, [string]$LeaseDirectory, [string]$ChatIdentity,
        [string]$Adb, [string]$Aapt2, [string]$Root
    )
    if (-not $Serial) { throw 'Name the device to walk with -Serial.' }
    if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
    $Root = [IO.Path]::GetFullPath($Root)
    $OutDir = [IO.Path]::GetFullPath($OutDir)
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

    # The bundle publish will hash, named in the receipt so a walk of any other build can't stand in.
    $version = Get-BundleVersion -Root $Root
    $bundle = Get-ReleaseBundlePath -Root $Root -Version $version
    if (-not (Test-Path -LiteralPath $bundle -PathType Leaf)) {
        throw "No release bundle at $bundle. Build it first (:patches:generatePatchesList then :patches:buildAndroid, through the governor)."
    }
    $bundleSha256 = (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash.ToLowerInvariant()
    # Publish holds the receipt to the staged bundle, so a walk of any other build can't back it.
    # Saying so up front saves a walk that was meant for the release; a walk between releases,
    # with the last release's assets still staged, goes ahead.
    $staged = Join-Path $Root "build/release-assets/$version/patches-$version.mpp"
    if (Test-Path -LiteralPath $staged -PathType Leaf) {
        $stagedSha256 = (Get-FileHash -LiteralPath $staged -Algorithm SHA256).Hash.ToLowerInvariant()
        if ($stagedSha256 -cne $bundleSha256) {
            Write-Host ("[walk] the staged $version release bundle isn't this build's bundle, so this walk won't back " +
                'that release. Run the release build stage again before a release walk.')
        } else {
            Write-Host "[walk] the staged release bundle is this build's bundle ($bundleSha256)"
        }
    }

    if (-not $Adb) {
        $Adb = (Get-Command adb -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1).Source
    }
    if (-not $Adb) { throw 'No adb found. Put it on the PATH or pass -Adb.' }
    $Aapt2 = Resolve-Aapt2 -Explicit $Aapt2 -Root $Root

    if (-not $SkipPatch) {
        if ($BuildEvidence) { throw '-BuildEvidence is only for a -SkipPatch walk.' }
        $patchArguments = @{ OutDir = (Join-Path $OutDir 'patch'); Root = $Root }
        if ($Keystore) { $patchArguments.Keystore = $Keystore }
        if ($KeyAlias) { $patchArguments.KeyAlias = $KeyAlias }
        Write-Host "[walk] patching Pinterest from $(Split-Path -Leaf $bundle)"
        $patchOut = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @patchArguments)
        $installApk = @($patchOut | ForEach-Object { "$_" } | Where-Object { $_ -match '\.apk$' -and (Test-Path -LiteralPath $_ -PathType Leaf) })
        if ($installApk.Count -eq 0) { throw 'patch-for-device.ps1 handed back no signed APK, so there is nothing to walk.' }
        $installApk = $installApk[-1]
        $BuildEvidence = "$installApk.build.json"
    }
    $build = $null
    if ($BuildEvidence) {
        $build = Get-Content -LiteralPath $BuildEvidence -Raw | ConvertFrom-Json
        if (-not $SkipPatch -and $build.signedApkSha256 -cne
            (Get-FileHash -LiteralPath $installApk -Algorithm SHA256).Hash.ToLowerInvariant()) {
            throw 'The signed APK differs from its build evidence.'
        }
    }

    $lease = $null
    $problems = [Collections.Generic.List[string]]::new()
    $screens = 0
    $dumpPath = '/sdcard/hushpinterest-walk.xml'
    try {
        $lease = Enter-HushDeviceLease -Adb $Adb -Serial $Serial -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
        # Ownership is checked on every call. The device identity was bound when the lease was
        # taken and is checked again by the install and at the end.
        $walkAdb = {
            param([string[]]$Arguments)
            Renew-HushDeviceLease $lease
            Invoke-HushPinterestAdbCommand -Adb $Adb -Arguments (@('-s', $Serial) + $Arguments)
        }
        $readScreen = {
            [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            [void](& $walkAdb @('shell', 'uiautomator', 'dump', $dumpPath))
            $xml = (& $walkAdb @('shell', 'cat', $dumpPath)).Output -join "`n"
            [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            @(ConvertFrom-WalkDump $xml)
        }
        $inFront = {
            # The resumed-activity line is named differently by Android version: mResumedActivity=
            # on older ones, topResumedActivity= and "ResumedActivity:" on API 36.
            $resumed = @((& $walkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output |
                Where-Object { $_ -match 'ResumedActivity' }) -join ' '
            $resumed -match "\b$([regex]::Escape($Package))/"
        }

        [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP'))
        $window = (& $walkAdb @('shell', 'dumpsys', 'window')).Output -join "`n"
        if ($window -match 'isKeyguardShowing=true|mDreamingLockscreen=true') {
            throw "$Serial is locked. Unlock it by hand and walk again; the walk never unlocks a device."
        }

        if (-not $SkipPatch) {
            Write-Host "[walk] installing $(Split-Path -Leaf $installApk) on $Serial"
            try {
                Install-HushAndroidApk -Adb $Adb -Serial $Serial -PackageName $Package -Apk $installApk -Aapt2 $Aapt2 -Lease $lease
            } catch {
                throw ("The build would not install on ${Serial}: $($_.Exception.Message) If the signer differs, patch with the key " +
                    'the installed app uses (-Keystore, -KeyAlias). The installed app and its data were left alone.')
            }
        }
        $started = [DateTimeOffset]::UtcNow
        $startedEpoch = [long]((& $walkAdb @('shell', 'date', '+%s')).Output -join '').Trim()
        [void](& $walkAdb @('shell', 'am', 'force-stop', $Package))
        $launch = & $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity")
        Start-Sleep -Seconds ($SettleSeconds * 2)
        if (($launch.Output -join "`n") -match '(?m)^Status:\s*ok\s*$' -and (& $inFront)) {
            $screens++
            Write-Host '[walk] opened the home feed'
        } else {
            $problems.Add('Pinterest would not start on its home feed')
        }

        foreach ($link in $Visit) {
            $opened = & $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', "'$link'", '-p', $Package)
            Start-Sleep -Seconds $SettleSeconds
            $ok = ($opened.Output -join "`n") -match '(?m)^Status:\s*ok\s*$'
            $front = & $inFront
            if ($ok -and $front) {
                $screens++
                Write-Host "[walk] opened $link"
            } else {
                $problems.Add("$link would not open (status ok: $ok, Pinterest in front: $front)")
                Write-Host "[walk] $link would not open"
            }
        }

        $full = -not $SkipSettings -and $null -ne $build
        if (-not $SkipSettings) {
            # Back to the home feed first: the settings open over the activity in front.
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity"))
            Start-Sleep -Seconds $SettleSeconds
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.APPLICATION_PREFERENCES', '-p', $Package))
            Start-Sleep -Seconds $SettleSeconds
            $nodes = & $readScreen
            if (-not (Find-WalkRow $nodes $WalkSettingsHome $Package)) {
                $problems.Add('the Hush settings would not open from App info''s intent')
                Write-Host '[walk] the Hush settings would not open'
            } else {
                $screens++
                Write-Host '[walk] opened the Hush settings'
                $size = ((& $walkAdb @('shell', 'wm', 'size')).Output -join ' ')
                $width = 720; $height = 1600
                if ($size -match '(\d+)x(\d+)\s*$') { $width = [int]$Matches[1]; $height = [int]$Matches[2] }
                foreach ($page in $SettingsPages) {
                    $row = Find-WalkRow $nodes $page $Package
                    # Pages lower in the list come into view one swipe at a time, each followed by a
                    # fresh dump. The list is the Hush settings; nothing else is on screen to touch.
                    for ($swipe = 0; -not $row -and $swipe -lt 6; $swipe++) {
                        [void](& $walkAdb @('shell', 'input', 'swipe', [string]($width / 2), [string][int]($height * 0.75),
                            [string]($width / 2), [string][int]($height * 0.35), '400'))
                        Start-Sleep -Milliseconds 900
                        $nodes = & $readScreen
                        $row = Find-WalkRow $nodes $page $Package
                    }
                    if (-not $row) {
                        $problems.Add("the settings page $page isn't in the list")
                        Write-Host "[walk] no $page row in the settings list"
                        continue
                    }
                    [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
                    Start-Sleep -Seconds 2
                    $nodes = & $readScreen
                    $onPage = (Find-WalkRow $nodes $page $Package) -and -not (Find-WalkRow $nodes $WalkSettingsHome $Package)
                    if ($onPage -and (& $inFront)) {
                        $screens++
                        Write-Host "[walk] opened the settings page $page"
                    } else {
                        $problems.Add("the settings page $page would not open")
                        Write-Host "[walk] the settings page $page would not open"
                    }
                    [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
                    Start-Sleep -Seconds 2
                    $nodes = & $readScreen
                    if (-not (Find-WalkRow $nodes $WalkSettingsHome $Package)) {
                        $problems.Add("Back from $page didn't return to the settings list")
                        Write-Host "[walk] Back from $page didn't return to the settings list"
                        break
                    }
                }
            }
            [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Seconds 1
        }

        $crashLines = @((& $walkAdb @('logcat', '-b', 'crash', '-d', '-v', 'epoch')).Output)
        $fatal = @(Get-WalkCrashLines -Lines $crashLines -Since $startedEpoch -Package $Package)
        if ($fatal.Count -gt 0) {
            [IO.File]::WriteAllLines((Join-Path $OutDir 'crash-buffer.txt'), [string[]]$crashLines)
            $problems.Add("Pinterest crashed during the walk: $($fatal[0].Trim())")
        }
        $alive = ((& $walkAdb @('shell', 'pidof', $Package)).Output -join '').Trim()
        if (-not $alive) { $problems.Add('Pinterest was no longer running when the walk ended') }

        $identity = Confirm-HushLeasedDevice -Adb $Adb -Lease $lease
        $packageLines = @((& $walkAdb @('shell', 'dumpsys', 'package', $Package)).Output)
        $appVersion = @($packageLines |
            Where-Object { $_ -match 'versionName=(.+)$' } | ForEach-Object { $Matches[1].Trim() } | Select-Object -First 1) -join ''
        $appVersionCode = @($packageLines | Where-Object { $_ -match '\bversionCode=(\d+)' } |
            ForEach-Object { $Matches[1] } | Select-Object -First 1) -join ''
        $apkPath = @((& $walkAdb @('shell', 'pm', 'path', $Package)).Output | Where-Object { $_ -like 'package:*base.apk' }) | Select-Object -First 1
        $installedSha = ''
        if ($apkPath) {
            $installedSha = (((& $walkAdb @('shell', 'sha256sum', $apkPath.Substring(8).Trim())).Output -join '') -split '\s+')[0]
        }

        $full = $full -and $problems.Count -eq 0
        $result = Resolve-WalkOutcome -Screens $screens -Crashes $fatal.Count -Problems ([string[]]$problems) -Full $full
        $receipt = New-WalkReceipt -Result $result -Full $full -Serial $Serial -Device $identity.Model `
            -AppVersion $appVersion -AppVersionCode $appVersionCode -Build $build `
            -BundleSha256 $bundleSha256 -InstalledApkSha256 $installedSha `
            -Started $started -Finished ([DateTimeOffset]::UtcNow) -Screens $screens -Crashes $fatal.Count `
            -Problems ([string[]]$problems)
        $receiptPath = Join-Path $OutDir 'walk-receipt.json'
        [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")
        if ($result -eq 'PASS') {
            $validated = Test-WalkReceipt -Path $receiptPath -BundlePath $bundle -PatchList (Join-Path $Root 'patches-list.json')
            if (-not $validated.Valid) {
                $problems.Add($validated.Reason)
                $result = 'FAIL'
                $receipt.result = $result
                $receipt.full = $false
                $receipt.problems = [string[]]$problems
                [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")
            }
        }

        Write-Host "[walk] receipt $receiptPath"
        foreach ($problem in $problems) { Write-Host "[walk]   $problem" }
        if ($result -ne 'PASS') { Write-Host '[walk] this walk does not back a release.' }
        Write-Host "[walk] $result on $($identity.Model) ($Serial): $screens screens, $($fatal.Count) crashes, $($problems.Count) problems"
        return $receiptPath
    } finally {
        if ($lease) { Exit-HushDeviceLease $lease }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    $receiptPath = Invoke-WalkApp -Serial $Serial -Package $Package -Visit $Visit -SettingsPages $SettingsPages `
        -SkipPatch:$SkipPatch -SkipSettings:$SkipSettings -BuildEvidence $BuildEvidence -SettleSeconds $SettleSeconds -OutDir $OutDir `
        -Keystore $Keystore -KeyAlias $KeyAlias -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity `
        -Adb $Adb -Aapt2 $Aapt2 -Root $Root
    $walked = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
    if ($walked.result -cne 'PASS') { exit 1 }
}
