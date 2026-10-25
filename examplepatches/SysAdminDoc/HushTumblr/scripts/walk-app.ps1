<#
.SYNOPSIS
    Walk the whole patched app on a leased phone or an emulator and leave a walk receipt.

.DESCRIPTION
    release/publish-release.ps1 refuses to publish a bundle without a receipt that a whole-app walk
    of that exact bundle left (walk-receipt.ps1). This runs the walk: it patches Tumblr from the
    repo's release bundle with patch-for-device.ps1, installs it with the account-preserving
    installer, opens each patched screen and every Hush settings page, watches the crash buffer for
    a Tumblr crash, and writes walk-receipt.json with New-WalkReceipt. The receipt names the
    SHA-256 of the .mpp the walked APK was patched with, which is what publish holds it to. When
    the release build stage has already staged that bundle, the two have to be the same file.

    The result the walk writes:
      PASS      the whole app was walked, every screen and settings page opened, no crash.
      PARTIAL   the settings pages were skipped, so it was not the whole app.
      FAIL      a Tumblr crash, a screen or page that would not open, or Tumblr gone at the end.
    Only a PASS backs a release.

    A screen is opened by its deep link (am start -W -a VIEW -d ... -p com.tumblr) and counts
    only when its activity, native UI markers and any required query match the declared route.
    A launch result or foreground package alone proves no destination. The Hush settings open through
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
    scripts/walk-app.ps1 -Serial emulator-5610

.EXAMPLE
    # Walk an installed build, proving it matches a checked signed APK and its provenance:
    scripts/walk-app.ps1 -Serial <your phone's adb serial> -SkipPatch -PatchedApk <signed.apk>

.EXAMPLE
    # Over a build signed with Morphe's own key, whose password is in HUSHTUMBLR_SIDELOAD_KEY_PASSWORD:
    scripts/walk-app.ps1 -Serial <serial> -Keystore <morphe-data>/morphe.keystore -KeyAlias Morphe -NoStorePassword
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Package = 'com.tumblr',
    # The declared native routes to open. A reduced selection remains PARTIAL.
    [string[]]$Visit = @(
        'https://www.tumblr.com/explore',
        'https://www.tumblr.com/search/art',
        'https://www.tumblr.com/tagged/art',
        'https://staff.tumblr.com/',
        'https://www.tumblr.com/likes'
    ),
    # The Hush settings pages, by the name each row shows in English. The walk opens every one.
    [string[]]$SettingsPages = @('Feed', 'Posts', 'Interface', 'Privacy', 'Links', 'Notifications',
        "Tumblr's own settings", 'Updates', 'Pause, backup and diagnostics', 'About'),
    # Walk the app that's already installed instead of patching and installing a fresh one. The
    # installed build must match -PatchedApk and the provenance beside it, from this exact bundle.
    [switch]$SkipPatch,
    [string]$PatchedApk,
    [string]$CleanApk,
    # Leave the Hush settings pages out of the walk. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [ValidateRange(1, 30)][int]$SettleSeconds = 4,
    [string]$OutDir = (Join-Path $env:TEMP 'hushtumblr-walk'),
    # Passed to patch-for-device.ps1, so the build is signed with the key the installed app uses.
    [string]$Keystore,
    [string]$KeyAlias,
    # The keystore has no store password, like the morphe.keystore Morphe makes (patch-for-device.ps1).
    [switch]$NoStorePassword,
    [string]$LeaseDirectory = $env:HUSHTUMBLR_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHTUMBLR_CHAT_ID,
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

$WalkMainActivity = 'com.tumblr.ui.activity.JumpoffActivity'
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
        [object[]]$Routes = @(),
        [string[]]$PatchNames = @(),
        [Parameter(Mandatory = $true)][bool]$Full
    )
    if ($Crashes -gt 0 -or @($Problems).Count -gt 0) { return 'FAIL' }
    if (-not $Full -or $Screens -lt 1) { return 'PARTIAL' }
    $coverage = Test-WalkCoverage -Routes $Routes -PatchNames $PatchNames
    if ($coverage.Invalid -or $Screens -ne @($Routes).Count) { return 'FAIL' }
    if (-not $coverage.Complete) { return 'PARTIAL' }
    return 'PASS'
}

function Get-WalkCrashLines {
    <#
    .SYNOPSIS
        The crash buffer lines that name a Tumblr crash at or after -Since (device epoch
        seconds): a Java crash's "Process: com.tumblr" line or a native crash's
        ">>> com.tumblr <<<" line, Tumblr's own :name processes included. Another app's
        crash, or one from before the walk, is left out.
    #>
    param([string[]]$Lines, [long]$Since, [string]$Package = 'com.tumblr')
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
        if ($node.GetAttribute('bounds') -notmatch '^\[(\d+),(\d+)\]\[(\d+),(\d+)\]$') { continue }
        $left = [int]$Matches[1]; $top = [int]$Matches[2]; $right = [int]$Matches[3]; $bottom = [int]$Matches[4]
        if ($right -le $left -or $bottom -le $top) { continue }
        [pscustomobject]@{
            Text = $text; Package = [string]$node.GetAttribute('package')
            ResourceId = [string]$node.GetAttribute('resource-id'); Description = [string]$node.GetAttribute('content-desc')
            Selected = $node.GetAttribute('selected') -ceq 'true'; X = [int](($left + $right) / 2); Y = [int](($top + $bottom) / 2)
            Top = $top; Bottom = $bottom
        }
    }
}

function Find-WalkRow {
    <# The one Tumblr node whose text is exactly -Text, or $null when there isn't exactly one. #>
    param($Nodes, [string]$Text, [string]$Package = 'com.tumblr')
    $found = @($Nodes | Where-Object { $_.Package -ceq $Package -and $_.Text -ceq $Text })
    if ($found.Count -eq 1) { return $found[0] }
    return $null
}

function Get-WalkListSwipe {
    <#
    .SYNOPSIS
        The input swipe arguments that drag the settings list a fifth of the screen, slowly.
    .DESCRIPTION
        The settings home pins its header, and a quick swipe flings the list well past the drag
        (a 400 ms, 900 px swipe moved it 1,585 px on the S22), so a row can pass under the header
        between two dumps. A 1.2 s drag stops where the finger does. -Direction Down brings rows
        further down the list into view.
    #>
    param([int]$Width, [int]$Height, [ValidateSet('Down', 'Up')][string]$Direction)
    $x = [string][int]($Width / 2)
    $lower = [string][int]($Height * 0.78)
    $upper = [string][int]($Height * 0.58)
    if ($Direction -ceq 'Down') { return @($x, $lower, $x, $upper, '1200') }
    return @($x, $upper, $x, $lower, '1200')
}

function Get-WalkScreenKey {
    <# What a dump shows, as one string: two dumps of a list that didn't move give the same key. #>
    param($Nodes)
    return (@($Nodes | ForEach-Object { "$($_.Text)@$($_.Top)" }) -join "`n")
}

function Invoke-WalkApp {
    param(
        [string]$Serial, [string]$Package, [string[]]$Visit, [string[]]$SettingsPages,
        [bool]$SkipPatch, [string]$PatchedApk, [string]$CleanApk, [bool]$SkipSettings, [int]$SettleSeconds, [string]$OutDir,
        [string]$Keystore, [string]$KeyAlias, [bool]$NoStorePassword, [string]$LeaseDirectory, [string]$ChatIdentity,
        [string]$Adb, [string]$Aapt2, [string]$Root
    )
    if (-not $Serial) { throw 'Name the device to walk with -Serial.' }
    if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
    $Root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Root)
    $OutDir = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($OutDir)
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    $lease = $null
    $walkHandles = [Collections.Generic.List[IDisposable]]::new()
    $runId = [guid]::NewGuid().ToString('N')
    try {

    # The bundle publish will hash, named in the receipt so a walk of any other build can't stand in.
    $version = Get-BundleVersion -Root $Root
    $bundle = Get-ReleaseBundlePath -Root $Root -Version $version
    if (-not (Test-Path -LiteralPath $bundle -PathType Leaf)) {
        throw "No release bundle at $bundle. Build it first (:patches:generatePatchesList then :patches:buildAndroid, through the governor)."
    }
    $heldBundle = Open-HeldFile -Path $bundle -What 'The walked bundle'
    $walkHandles.Add($heldBundle)
    $bundle = Get-HeldPath $heldBundle
    $bundleSha256 = Get-StreamSha256 $heldBundle
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

    $installApk = $PatchedApk
    if ($SkipPatch -and -not $installApk) { throw '-SkipPatch requires -PatchedApk and its .provenance.json from a checked patch run.' }
    if (-not $SkipPatch) {
        $patchArguments = @{ OutDir = (Join-Path $OutDir 'patch'); Root = $Root }
        if ($Keystore) { $patchArguments.Keystore = $Keystore }
        if ($KeyAlias) { $patchArguments.KeyAlias = $KeyAlias }
        if ($NoStorePassword) { $patchArguments.NoStorePassword = $true }
        Write-Host "[walk] patching Tumblr from $(Split-Path -Leaf $bundle)"
        $patchOut = @(& (Join-Path $PSScriptRoot 'patch-for-device.ps1') @patchArguments)
        $installApk = @($patchOut | ForEach-Object { "$_" } | Where-Object { $_ -match '\.apk$' -and (Test-Path -LiteralPath $_ -PathType Leaf) })
        if ($installApk.Count -eq 0) { throw 'patch-for-device.ps1 handed back no signed APK, so there is nothing to walk.' }
        $installApk = $installApk[-1]
    }

    $installApk = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($installApk)
    $provenanceHandle = Open-HeldFile -Path "$installApk.provenance.json" -What 'The signed APK provenance'
    $walkHandles.Add($provenanceHandle)
    $provenance = Get-Content -LiteralPath (Get-HeldPath $provenanceHandle) -Raw | ConvertFrom-Json
    Assert-HushApkProvenance -Provenance $provenance -BundleSha256 $bundleSha256 -CatalogPath (Join-Path $Root 'patches-list.json') -FullSelection
    if ($Package -cne $provenance.output.package) { throw 'The walk package differs from the checked APK.' }
    $apkHandle = Open-HeldFile -Path $installApk -Sha256 $provenance.output.sha256 -What 'The walked signed APK'
    $walkHandles.Add($apkHandle)
    $installApk = Get-HeldPath $apkHandle
    $localManifest = Get-ApkManifestFacts -Apk $installApk -Aapt2 $Aapt2
    Assert-HushApkIdentity -Expected $provenance.output -Actual ([pscustomobject]@{
        sha256 = Get-StreamSha256 $apkHandle; package = $localManifest.package; versionName = $localManifest.versionName
        versionCode = [string]$localManifest.versionCode; signers = @(Get-HushApkSigners -Apk $installApk -Aapt2 $Aapt2)
    })
    $problems = [Collections.Generic.List[string]]::new()
    $routes = [Collections.Generic.List[object]]::new()
    $plan = @(Get-WalkPlan -PatchNames @($provenance.patches))
    $screens = 0
    $dumpPath = '/sdcard/hushtumblr-walk.xml'
        $lease = Enter-HushDeviceLease -Adb $Adb -Serial $Serial -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
        # Ownership is checked on every call. The device identity was bound when the lease was
        # taken and is checked again by the install and at the end.
        $walkAdb = {
            param([string[]]$Arguments)
            Renew-HushDeviceLease $lease
            Invoke-HushTumblrAdbCommand -Adb $Adb -Arguments (@('-s', $Serial) + $Arguments)
        }
        $readScreen = {
            [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            [void](& $walkAdb @('shell', 'uiautomator', 'dump', $dumpPath))
            $xml = (& $walkAdb @('shell', 'cat', $dumpPath)).Output -join "`n"
            [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            @(ConvertFrom-WalkDump $xml)
        }
        $readActivity = {
            # The resumed-activity line is named differently by Android version: mResumedActivity=
            # on older ones, topResumedActivity= and "ResumedActivity:" on API 36.
            $resumed = @((& $walkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output |
                Where-Object { $_ -match 'ResumedActivity' }) -join ' '
            $components = @([regex]::Matches($resumed, '\bcom\.tumblr/[A-Za-z0-9_.$]+') | ForEach-Object {
                $_.Value.Replace('com.tumblr/com.tumblr.', 'com.tumblr/.')
            } | Sort-Object -Unique)
            if ($components.Count -eq 1) { return $components[0] }
            return ''
        }

        [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP'))
        $window = (& $walkAdb @('shell', 'dumpsys', 'window')).Output -join "`n"
        if ($window -match 'isKeyguardShowing=true|mDreamingLockscreen=true') {
            throw "$Serial is locked. Unlock it by hand and walk again; the walk never unlocks a device."
        }

        if (-not $SkipPatch) {
            Write-Host "[walk] installing $(Split-Path -Leaf $installApk) on $Serial"
            try {
                Install-HushAndroidApk -Adb $Adb -Serial $Serial -PackageName $Package -Apk $installApk -Aapt2 $Aapt2 -Lease $lease `
                    -ExpectedIdentity $provenance.output
            } catch {
                throw ("The build would not install on ${Serial}: $($_.Exception.Message) If the signer differs, patch with the key " +
                    'the installed app uses (-Keystore, -KeyAlias). The installed app and its data were left alone.')
            }
        }
        $installedBefore = Get-HushInstalledApkIdentity -Adb $Adb -Lease $lease -PackageName $Package -Aapt2 $Aapt2
        Assert-HushApkIdentity -Expected $provenance.output -Actual $installedBefore
        $cleanSource = Resolve-WalkCleanSource -Explicit $CleanApk -Root $Root -Sha256 $provenance.sourceSha256
        $sourceHandle = Open-HeldFile -Path $cleanSource -Sha256 $provenance.sourceSha256 -What 'The walked source APK'
        $walkHandles.Add($sourceHandle)
        $verifierPath = Join-Path $OutDir "device-verifier-$runId.json"
        $global:LASTEXITCODE = -1
        & (Join-Path $PSScriptRoot 'verify-injected-registers.ps1') -CleanApk (Get-HeldPath $sourceHandle) `
            -PatchedApk $installApk -Bundle $bundle -SelectedPatchNames @($provenance.patches) `
            -Serial $Serial -Adb $Adb -Aapt2 $Aapt2 -LeaseToken $lease.Token -LeaseDirectory (Split-Path -Parent $lease.Path) `
            -ChatIdentity $ChatIdentity -DeviceEvidencePath $verifierPath -EvidenceRunId $runId `
            -ExpectedSourceSha256 $provenance.sourceSha256 -ExpectedPatchedSha256 $provenance.output.sha256 `
            -ReportPath (Join-Path $OutDir "injected-registers-$runId.txt")
        if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $verifierPath -PathType Leaf)) { throw 'The walked APK has no completed device verifier comparison.' }
        $verifierHandle = Open-HeldFile -Path $verifierPath -What 'The walk device verifier evidence'
        $walkHandles.Add($verifierHandle)
        $verifier = Get-Content -LiteralPath (Get-HeldPath $verifierHandle) -Raw | ConvertFrom-Json
        $started = [DateTimeOffset]::UtcNow
        Assert-WalkVerifierEvidence -Receipt ([pscustomobject]@{
            runId = $runId; serial = $Serial; device = $lease.Identity.Model; deviceIdentity = $lease.Identity
            emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
            bundleSha256 = $bundleSha256; provenance = $provenance; verifier = $verifier
        }) -WalkStarted $started
        $startedEpoch = [long]((& $walkAdb @('shell', 'date', '+%s')).Output -join '').Trim()
        [void](& $walkAdb @('shell', 'am', 'force-stop', $Package))
        $launch = & $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity")
        Start-Sleep -Seconds ($SettleSeconds * 2)
        $homeRoute = @($plan | Where-Object { $_.id -ceq 'native.home' })[0]
        $homeObservation = Get-WalkObservation -Route $homeRoute -Nodes (& $readScreen) -Activity (& $readActivity)
        $homePass = ($launch.Output -join "`n") -match '(?m)^Status:\s*ok\s*$' -and (Test-WalkDestination $homeRoute $homeObservation)
        $routes.Add([ordered]@{ id = $homeRoute.id; status = if ($homePass) { 'PASS' } else { 'UNVERIFIED' }; observation = $homeObservation })
        if ($homePass) {
            $screens++
            Write-Host '[walk] opened the home feed'
        } else {
            $problems.Add('Tumblr would not start on its home feed')
        }

        foreach ($link in $Visit) {
            $definition = @($plan | Where-Object { $_.link -ceq $link })
            if ($definition.Count -ne 1) { $problems.Add("$link is not in the declared walk plan"); continue }
            $definition = $definition[0]
            $opened = & $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', "'$link'", '-p', $Package)
            Start-Sleep -Seconds $SettleSeconds
            $ok = ($opened.Output -join "`n") -match '(?m)^Status:\s*ok\s*$'
            $observation = Get-WalkObservation -Route $definition -Nodes (& $readScreen) -Activity (& $readActivity)
            $destination = Test-WalkDestination $definition $observation
            $routes.Add([ordered]@{ id = $definition.id; status = if ($ok -and $destination) { 'PASS' } else { 'UNVERIFIED' }; observation = $observation })
            if ($ok -and $destination) {
                $screens++
                Write-Host "[walk] opened $link"
            } else {
                $problems.Add("$($definition.id) destination was unverified (launch status: $ok, destination: $destination)")
                Write-Host "[walk] $link would not open"
            }
        }

        $full = -not $SkipSettings
        if (-not $SkipSettings) {
            # Back to the home feed first: the settings open over the activity in front.
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity"))
            Start-Sleep -Seconds $SettleSeconds
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.APPLICATION_PREFERENCES', '-p', $Package))
            Start-Sleep -Seconds $SettleSeconds
            $nodes = & $readScreen
            $settingsRoute = @($plan | Where-Object { $_.id -ceq 'settings.home' })[0]
            $settingsObservation = Get-WalkObservation -Route $settingsRoute -Nodes $nodes -Activity (& $readActivity)
            $settingsPass = Test-WalkDestination $settingsRoute $settingsObservation
            $routes.Add([ordered]@{ id = 'settings.home'; status = if ($settingsPass) { 'PASS' } else { 'UNVERIFIED' }; observation = $settingsObservation })
            if (-not $settingsPass) {
                $problems.Add('the Hush settings would not open from App info''s intent')
                Write-Host '[walk] the Hush settings would not open'
            } else {
                $screens++
                Write-Host '[walk] opened the Hush settings'
                $size = ((& $walkAdb @('shell', 'wm', 'size')).Output -join ' ')
                $width = 720; $height = 1600
                if ($size -match '(\d+)x(\d+)\s*$') { $width = [int]$Matches[1]; $height = [int]$Matches[2] }
                foreach ($page in $SettingsPages) {
                    $pageRoute = @($plan | Where-Object { $_.page -ceq $page })
                    if ($pageRoute.Count -ne 1) { $problems.Add("$page is not in the declared settings plan"); continue }
                    $pageRoute = $pageRoute[0]
                    $row = Find-WalkRow $nodes $page $Package
                    # A row that isn't on screen is looked for further down, then back up, one slow
                    # drag at a time (Get-WalkListSwipe), each followed by a fresh dump. The same
                    # screen twice means the list's end. The list is the Hush settings; nothing else
                    # is on screen to touch.
                    foreach ($direction in 'Down', 'Up') {
                        for ($swipe = 0; -not $row -and $swipe -lt 15; $swipe++) {
                            $before = Get-WalkScreenKey $nodes
                            [void](& $walkAdb (@('shell', 'input', 'swipe') +
                                (Get-WalkListSwipe -Width $width -Height $height -Direction $direction)))
                            Start-Sleep -Milliseconds 1200
                            $nodes = & $readScreen
                            $row = Find-WalkRow $nodes $page $Package
                            if (-not $row -and (Get-WalkScreenKey $nodes) -ceq $before) { break }
                        }
                        if ($row) { break }
                    }
                    if (-not $row) {
                        $problems.Add("the settings page $page isn't in the list")
                        Write-Host "[walk] no $page row in the settings list"
                        continue
                    }
                    [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
                    Start-Sleep -Seconds 2
                    $nodes = & $readScreen
                    $pageObservation = Get-WalkObservation -Route $pageRoute -Nodes $nodes -Activity (& $readActivity)
                    $onPage = Test-WalkDestination $pageRoute $pageObservation
                    $routes.Add([ordered]@{ id = $pageRoute.id; status = if ($onPage) { 'PASS' } else { 'UNVERIFIED' }; observation = $pageObservation })
                    if ($onPage) {
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
            $problems.Add("Tumblr crashed during the walk: $($fatal[0].Trim())")
        }
        $alive = ((& $walkAdb @('shell', 'pidof', $Package)).Output -join '').Trim()
        if (-not $alive) { $problems.Add('Tumblr was no longer running when the walk ended') }

        $identity = Confirm-HushLeasedDevice -Adb $Adb -Lease $lease
        $installedAfter = $null
        try {
            $installedAfter = Get-HushInstalledApkIdentity -Adb $Adb -Lease $lease -PackageName $Package -Aapt2 $Aapt2
            Assert-HushApkIdentity -Expected $provenance.output -Actual $installedAfter
        } catch { $problems.Add("Installed APK identity changed or could not be verified: $($_.Exception.Message)") }

        $full = $full -and $problems.Count -eq 0
        $result = Resolve-WalkOutcome -Screens $screens -Crashes $fatal.Count -Problems ([string[]]$problems) -Full $full `
            -Routes @($routes) -PatchNames @($provenance.patches)
        $receipt = New-WalkReceipt -Result $result -Full $full -Serial $Serial -Device $identity.Model `
            -AppVersion $installedBefore.versionName -BundleSha256 $bundleSha256 -InstalledApkSha256 $installedBefore.sha256 `
            -Provenance $provenance -InstalledBefore $installedBefore -InstalledAfter $installedAfter `
            -Routes @($routes) `
            -RunId $runId -DeviceIdentity $identity -Verifier $verifier `
            -Started $started -Finished ([DateTimeOffset]::UtcNow) -Screens $screens -Crashes $fatal.Count `
            -Problems ([string[]]$problems)
        $receiptPath = Join-Path $OutDir 'walk-receipt.json'
        [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 8) + "`n")

        Write-Host "[walk] receipt $receiptPath"
        foreach ($problem in $problems) { Write-Host "[walk]   $problem" }
        if ($result -ne 'PASS') { Write-Host '[walk] this walk does not back a release.' }
        Write-Host "[walk] $result on $($identity.Model) ($Serial): $screens screens, $($fatal.Count) crashes, $($problems.Count) problems"
        return $receiptPath
    } finally {
        if ($lease) { Exit-HushDeviceLease $lease }
        foreach ($handle in $walkHandles) { $handle.Dispose() }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    $receiptPath = Invoke-WalkApp -Serial $Serial -Package $Package -Visit $Visit -SettingsPages $SettingsPages `
        -SkipPatch:$SkipPatch -PatchedApk $PatchedApk -CleanApk $CleanApk -SkipSettings:$SkipSettings -SettleSeconds $SettleSeconds -OutDir $OutDir `
        -Keystore $Keystore -KeyAlias $KeyAlias -NoStorePassword:$NoStorePassword -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity `
        -Adb $Adb -Aapt2 $Aapt2 -Root $Root
    $walked = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
    if ($walked.result -cne 'PASS') { exit 1 }
}
