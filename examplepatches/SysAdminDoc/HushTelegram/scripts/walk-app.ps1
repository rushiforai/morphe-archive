<#
.SYNOPSIS
    Walk the whole patched Telegram on a leased phone or an emulator and leave a walk receipt.

.DESCRIPTION
    release/publish-release.ps1 refuses to publish a bundle without a receipt that a whole-app walk
    of that exact bundle left (walk-receipt.ps1). This runs the walk: it patches Telegram from the
    repo's release bundle with patch-for-device.ps1, installs it with the lease-checked installer
    (device-install.ps1), opens Telegram's own screens and every Hush settings page, watches the
    crash buffer for a Telegram crash, and writes walk-receipt.json with New-WalkReceipt. The
    receipt names the SHA-256 of the .mpp the walked APK was patched with, which is what publish
    holds it to. When the release build stage has already staged that bundle, the two have to be
    the same file.

    Next to the signed APK the walk leaves patch-artifact.json (New-WalkArtifact): the APK's
    SHA-256, package, version and version code, the vendor fixture and bundle it was patched from
    and the patches selected. The receipt carries that record, and the hash of the APK actually
    installed has to match it. -SkipPatch walks that same APK again by its record (-Artifact,
    patch\patch-artifact.json under -OutDir unless given), so a walk of an app installed some
    other way doesn't back a release.

    What a walk has to open comes from walk-scenarios.json: each scenario's id, and the patches
    that make it required. -Visit, -SettingsPages and -Sections default to that list. A shorter
    list walks less and the walk comes back PARTIAL, naming what it left out.

    The result the walk writes:
      PASS      every required scenario opened, no crash and no problem.
      PARTIAL   the settings pages were skipped, or a required scenario wasn't asked for.
      FAIL      a Telegram crash, a screen or page that would not open, or Telegram gone at the end.
    Only a PASS backs a release.

    Telegram starts on LaunchActivity. Signed in, it opens the chat list and then each -Visit
    link (am start -W -a VIEW -d ... -p <package>): Telegram's settings, privacy, folders and
    themes screens and a public channel. A screen counts when the start reports ok with Telegram
    in front. Signed out (a "Start Messaging" button), nothing past sign-in can be opened, so the
    links are left out and the receipt says "account": "signed out". The Hush settings open
    through APPLICATION_PREFERENCES, the intent Android's App info page sends, and work either
    way. Each section of the home list opens in place: a fresh uiautomator dump, the heading
    whose text is exactly the section's name, a tap on its centre, and the section counts when
    rows that aren't another heading show right under it and a second tap closes it again. A
    page of its own (Changed switches) is opened from its row the same way and counts when its
    title shows and the home list's markers are gone. Taps only ever land on Hush settings rows
    read from a dump taken after the last swipe or Back, never on a chat, a contact or anything
    else of Telegram's.

    Device safety: the walk takes an exclusive whole-device lease in the shared pool
    (HUSHTELEGRAM_DEVICE_LEASE_DIRECTORY), checks it before every adb call and releases it when it's
    done. It changes no device setting, only wakes the screen, and stops when the phone is locked
    rather than unlocking it. It never uninstalls or clears the installed app; an install that
    can't update the app in place is a problem the walk reports, not one it forces past.

.EXAMPLE
    scripts/walk-app.ps1 -Serial emulator-5580 -Apk fixtures/telegram-web-13.1.0-72299.apk

.EXAMPLE
    # Walk a build already patched from this bundle and installed (records its APK hash):
    scripts/walk-app.ps1 -Serial <your phone's adb serial> -SkipPatch
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Package = 'org.telegram.messenger.web',
    # Telegram's own screens to open once signed in, each a deep link. A link that won't open
    # fails the walk rather than skipping it. walk-scenarios.json's visits unless given.
    [string[]]$Visit,
    # The Hush settings pages that open from a home list row, by the name each row shows in English.
    [string[]]$SettingsPages,
    # The sections that open in place on the home list, by the name each heading shows.
    [string[]]$Sections,
    # Walk the app that's already installed instead of patching and installing a fresh one. Its
    # hash has to match the patch artifact record of an earlier walk's APK (-Artifact).
    [switch]$SkipPatch,
    [string]$Artifact,
    # Leave the Hush settings pages out of the walk. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [ValidateRange(1, 30)][int]$SettleSeconds = 4,
    [string]$OutDir = (Join-Path $env:TEMP 'hushtelegram-walk'),
    # The vendor APK patch-for-device.ps1 patches, when HUSHTELEGRAM_FIXTURE_DIR doesn't name it.
    [string]$Apk,
    # Passed to patch-for-device.ps1, so the build is signed with the key the installed app uses.
    [string]$Keystore,
    [string]$KeyAlias,
    [switch]$CliDefaultKeystore,
    [string]$LeaseDirectory = $env:HUSHTELEGRAM_DEVICE_LEASE_DIRECTORY,
    [string]$ChatIdentity = $env:HUSHTELEGRAM_DEVICE_CHAT,
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

$WalkMainActivity = 'org.telegram.ui.LaunchActivity'
# The settings home page, read by its search box hint and its title. A page hides both, so their
# going away is how a page is told from the list.
$WalkSearchHint = 'Search settings'
$WalkSettingsHome = @($WalkSearchHint, 'HushTelegram')
# The rows that close the home list after its sections. One of them, or another section's
# heading, right under a heading means that section is closed.
$WalkHomeTail = @('Changed switches', 'Report a problem', 'Support HushTelegram')
# Telegram's intro screen shows this button until someone signs in.
$WalkSignedOutMarker = 'Start Messaging'

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
        The crash buffer lines that name a crash of -Package at or after -Since (device epoch
        seconds): a Java crash's "Process: <package>" line or a native crash's ">>> <package> <<<"
        line, the package's own :name processes included. Another app's crash (the Play build's
        when the web build is walked, and the other way round) or one from before the walk is
        left out.
    #>
    param([string[]]$Lines, [long]$Since, [string]$Package = 'org.telegram.messenger.web')
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
    <# The one node of -Package whose text is exactly -Text, or $null when there isn't exactly one. #>
    param($Nodes, [string]$Text, [string]$Package = 'org.telegram.messenger.web')
    $found = @($Nodes | Where-Object { $_.Package -ceq $Package -and $_.Text -ceq $Text })
    if ($found.Count -eq 1) { return $found[0] }
    return $null
}

function Test-WalkSettingsHome {
    <# Whether the screen is the Hush settings home list: its search box or its title shows. #>
    param($Nodes, [string]$Package = 'org.telegram.messenger.web')
    foreach ($marker in $WalkSettingsHome) {
        if (Find-WalkRow $Nodes $marker $Package) { return $true }
    }
    return $false
}

function Test-WalkSettingsPage {
    <#
    .SYNOPSIS
        Whether the screen is the settings page -Name: its title shows and the home list doesn't.
    #>
    param($Nodes, [string]$Name, [string]$Package = 'org.telegram.messenger.web')
    if (-not (Find-WalkRow $Nodes $Name $Package)) { return $false }
    if (Test-WalkSettingsHome $Nodes $Package) { return $false }
    return $true
}

function Find-WalkHeading {
    <#
    .SYNOPSIS
        The heading of the home list section -Name: the topmost -Package node with exactly that
        text below the search box. The toolbar's Pause button sits above the box, and a row in an
        open section that shares its heading's name sits below the heading.
    #>
    param($Nodes, [string]$Name, [string]$Package = 'org.telegram.messenger.web')
    $box = Find-WalkRow $Nodes $WalkSearchHint $Package
    if (-not $box) { return $null }
    @($Nodes | Where-Object { $_.Package -ceq $Package -and $_.Text -ceq $Name -and $_.Top -ge $box.Bottom } |
        Sort-Object Top) | Select-Object -First 1
}

function Get-WalkSectionState {
    <#
    .SYNOPSIS
        'open' when a row that isn't a heading or a home tail row shows right under the heading of
        -Name, 'closed' when one of those or nothing does, $null when the heading isn't on screen.
        -Headings names every section heading.
    #>
    param($Nodes, [string]$Name, [string[]]$Headings, [string]$Package = 'org.telegram.messenger.web')
    $heading = Find-WalkHeading $Nodes $Name $Package
    if (-not $heading) { return $null }
    $next = @($Nodes | Where-Object { $_.Package -ceq $Package -and $_.Top -ge $heading.Bottom } | Sort-Object Top) |
        Select-Object -First 1
    # A row named like its own section (the Pause switch under Pause) is that section's row.
    if ($next -and $next.Text -ceq $Name) { return 'open' }
    if (-not $next -or @($Headings) -ccontains $next.Text -or $WalkHomeTail -ccontains $next.Text) { return 'closed' }
    return 'open'
}

function ConvertTo-WalkArgument {
    <# One command-line argument, quoted the way the Windows C runtime reads it back. #>
    param([string]$Value)
    if ($Value -and $Value -notmatch '[\s"]') { return $Value }
    return '"' + (($Value -replace '(\\*)"', '$1$1\"') -replace '(\\+)$', '$1$1') + '"'
}

function Invoke-WalkProcess {
    <#
    .SYNOPSIS
        Runs adb with no window and a time limit. uiautomator can hang on a busy screen, and a walk
        that hangs holds the device lease until it expires.
    #>
    param([string]$FilePath, [string[]]$Arguments, [int]$TimeoutSeconds = 60)
    $info = [Diagnostics.ProcessStartInfo]::new($FilePath)
    $info.Arguments = (@($Arguments | ForEach-Object { ConvertTo-WalkArgument $_ }) -join ' ')
    $info.UseShellExecute = $false
    $info.CreateNoWindow = $true
    $info.RedirectStandardOutput = $true
    $info.RedirectStandardError = $true
    $process = [Diagnostics.Process]::Start($info)
    try {
        $stdout = $process.StandardOutput.ReadToEndAsync()
        $stderr = $process.StandardError.ReadToEndAsync()
        if (-not $process.WaitForExit($TimeoutSeconds * 1000)) {
            try { $process.Kill() } catch { }
            throw "adb $($Arguments -join ' ') took longer than $TimeoutSeconds seconds."
        }
        $process.WaitForExit()
        $text = $stdout.Result + $stderr.Result
        return [pscustomobject]@{
            ExitCode = $process.ExitCode
            Output = @($text -split "`r?`n" | Where-Object { $_ -ne '' })
        }
    } finally {
        $process.Dispose()
    }
}

function Write-WalkLease {
    param($Lease, [IO.FileMode]$Mode)
    $document = [ordered]@{
        schemaVersion = 1; serial = $Lease.Serial; project = 'HushTelegram'; chatIdentity = $Lease.ChatIdentity
        ownershipToken = $Lease.Token; acquiredUtc = $Lease.Acquired.UtcDateTime.ToString('o')
        expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes(30).UtcDateTime.ToString('o'); purpose = 'whole-app walk'
    } | ConvertTo-Json
    $stream = [IO.File]::Open($Lease.Path, $Mode, [IO.FileAccess]::Write, [IO.FileShare]::None)
    try {
        $stream.SetLength(0)
        $bytes = [Text.UTF8Encoding]::new($false).GetBytes($document)
        $stream.Write($bytes, 0, $bytes.Length)
    } finally { $stream.Dispose() }
    $Lease.Renewed = [DateTimeOffset]::UtcNow
}

function Read-WalkLease {
    param([string]$Path)
    try { return Get-Content -LiteralPath $Path -Raw -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop } catch { return $null }
}

function Enter-WalkLease {
    <#
    .SYNOPSIS
        Takes the whole-device lease on -Serial in the shared pool, or throws when another task
        holds it. A lease that has run out is taken over; a live one never is.
    #>
    param([string]$Directory, [string]$Serial, [string]$ChatIdentity)
    if ($Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*$' -or $Serial -match '^\.\.?$') {
        throw 'The device serial must be safe as a lease filename.'
    }
    $lease = [pscustomobject]@{
        Path = (Join-Path $Directory "$Serial.json"); Serial = $Serial; ChatIdentity = $ChatIdentity
        Token = [guid]::NewGuid().ToString(); Acquired = [DateTimeOffset]::UtcNow; Renewed = $null
    }
    $held = Read-WalkLease $lease.Path
    if ($held) {
        $expires = [DateTimeOffset]::MinValue
        if ($held.expiresUtc -is [datetime]) { $expires = [DateTimeOffset]$held.expiresUtc }
        elseif (-not [DateTimeOffset]::TryParse([string]$held.expiresUtc, [Globalization.CultureInfo]::InvariantCulture,
                [Globalization.DateTimeStyles]::AssumeUniversal, [ref]$expires)) { $expires = [DateTimeOffset]::MaxValue }
        if ($expires -gt [DateTimeOffset]::UtcNow) {
            throw ("$Serial is leased by $($held.project) until $($expires.UtcDateTime.ToString('HH:mm')) UTC. Walk " +
                'another device; the walk never takes a device another task holds.')
        }
        Remove-Item -LiteralPath $lease.Path -Force
    }
    try {
        Write-WalkLease $lease ([IO.FileMode]::CreateNew)
    } catch [IO.IOException] {
        throw "$Serial was leased by another task just now. Walk another device."
    }
    return $lease
}

function Update-WalkLease {
    <# Confirms the lease is still this walk's and pushes its expiry out once a minute. #>
    param($Lease)
    $held = Read-WalkLease $Lease.Path
    if (-not $held -or $held.ownershipToken -cne $Lease.Token) {
        throw "The walk's lease on $($Lease.Serial) is gone or another task's now, so the walk stopped."
    }
    if (([DateTimeOffset]::UtcNow - $Lease.Renewed).TotalSeconds -ge 60) { Write-WalkLease $Lease ([IO.FileMode]::Open) }
}

function Exit-WalkLease {
    param($Lease)
    $held = Read-WalkLease $Lease.Path
    if ($held -and $held.ownershipToken -ceq $Lease.Token) { Remove-Item -LiteralPath $Lease.Path -Force }
}

function Invoke-WalkApp {
    param(
        [string]$Serial, [string]$Package, [string[]]$Visit, [string[]]$SettingsPages, [string[]]$Sections,
        [bool]$SkipPatch, [string]$Artifact, [bool]$SkipSettings, [int]$SettleSeconds, [string]$OutDir, [string]$Apk,
        [string]$Keystore, [string]$KeyAlias, [bool]$CliDefaultKeystore, [string]$LeaseDirectory,
        [string]$ChatIdentity, [string]$Adb, [string]$Aapt2, [string]$Root
    )
    if (-not $Serial) { throw 'Name the device to walk with -Serial.' }
    if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
    $Root = [IO.Path]::GetFullPath($Root)
    $OutDir = [IO.Path]::GetFullPath($OutDir)
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    if (-not $ChatIdentity) { $ChatIdentity = 'walk-' + [guid]::NewGuid().ToString('N') }
    $LeaseDirectory = Resolve-DeviceLeaseDirectory -LeaseDirectory $LeaseDirectory

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
    $walkScenarios = @(Read-WalkScenarios)

    $patchDirectory = Join-Path $OutDir 'patch'
    if (-not $Artifact) { $Artifact = Join-Path $patchDirectory 'patch-artifact.json' }
    $Artifact = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Artifact)
    $artifactRecord = $null
    if (-not $SkipPatch) {
        # Patching is as heavy as a build and waits in the build queue, so it runs before the lease.
        $installApk = Join-Path $patchDirectory "hushtelegram-$version-signed.apk"
        foreach ($old in @($installApk, $Artifact)) { if (Test-Path -LiteralPath $old) { Remove-Item -LiteralPath $old -Force } }
        # The fixture is settled here, not left to patch-for-device.ps1, so the record names it.
        $catalog = Get-Content -LiteralPath (Join-Path $Root 'patches-list.json') -Raw | ConvertFrom-Json
        if (-not $Apk) { $Apk = Find-DefaultVendorApk -Target (Get-PatchTarget -PatchList $catalog -PackageName $Package) -FixtureDirectory $env:HUSHTELEGRAM_FIXTURE_DIR }
        if (-not $Apk -or -not (Test-Path -LiteralPath $Apk -PathType Leaf)) {
            throw 'No vendor APK. Pass -Apk with the declared build, or set HUSHTELEGRAM_FIXTURE_DIR to the folder that holds it.'
        }
        $patchArguments = @{ OutDir = $patchDirectory; Root = $Root; PackageName = $Package; Apk = $Apk }
        if ($Keystore) { $patchArguments.Keystore = $Keystore }
        if ($KeyAlias) { $patchArguments.KeyAlias = $KeyAlias }
        if ($CliDefaultKeystore) { $patchArguments.CliDefaultKeystore = $true }
        Write-Host "[walk] patching Telegram from $(Split-Path -Leaf $bundle)"
        & (Join-Path $PSScriptRoot 'patch-for-device.ps1') @patchArguments
        if (-not (Test-Path -LiteralPath $installApk -PathType Leaf)) {
            throw 'patch-for-device.ps1 left no signed APK, so there is nothing to walk.'
        }
        # patch-for-device.ps1 names the APK only once its report proved every requested patch.
        $summary = Get-Content -LiteralPath (Join-Path $patchDirectory 'public-summary.json') -Raw | ConvertFrom-Json
        $facts = Get-ApkManifestFacts -Apk $installApk -Aapt2 $Aapt2
        $artifactRecord = New-WalkArtifact -ApkSha256 (Get-FileHash -LiteralPath $installApk -Algorithm SHA256).Hash `
            -Package $facts.package -PackageVersion $facts.versionName -VersionCode $facts.versionCode `
            -SignerSha256 ([string[]]@(Get-VendorSignerDigests -Apk $installApk -Aapt2 $Aapt2)) -FixtureName (Split-Path -Leaf $Apk) -FixtureSha256 (Get-FileHash -LiteralPath $Apk -Algorithm SHA256).Hash `
            -BundleVersion $version -BundleSha256 $bundleSha256 -Patches ([string[]]@($summary.requestedPatches)) `
            -Created ([DateTimeOffset]::UtcNow)
        New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Artifact) | Out-Null
        [IO.File]::WriteAllText($Artifact, (ConvertTo-Json -InputObject $artifactRecord -Depth 4) + "`n")
        Write-Host "[walk] patch artifact $Artifact"
    } elseif (Test-Path -LiteralPath $Artifact -PathType Leaf) {
        $artifactRecord = Get-Content -LiteralPath $Artifact -Raw | ConvertFrom-Json
    }

    $lease = $null
    $problems = [Collections.Generic.List[string]]::new()
    $screens = 0
    # Each screen opened, and the walk-scenarios.json id it was opened as.
    $seen = [pscustomobject]@{ Screens = 0; Scenarios = [Collections.Generic.List[string]]::new() }
    $account = 'unknown'
    $dumpPath = '/sdcard/hushtelegram-walk.xml'
    try {
        $lease = Enter-WalkLease -Directory $LeaseDirectory -Serial $Serial -ChatIdentity $ChatIdentity
        Write-Host "[walk] leased $Serial"
        $walkAdb = {
            param([string[]]$Arguments, [int]$TimeoutSeconds = 60)
            Update-WalkLease $lease
            Invoke-WalkProcess -FilePath $Adb -Arguments (@('-s', $Serial) + $Arguments) -TimeoutSeconds $TimeoutSeconds
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
            # on older ones, topResumedActivity= and "ResumedActivity:" on newer ones.
            $resumed = @((& $walkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output |
                Where-Object { $_ -match 'ResumedActivity' }) -join ' '
            $resumed -match "\b$([regex]::Escape($Package))/"
        }
        $screenSize = {
            $size = ((& $walkAdb @('shell', 'wm', 'size')).Output -join ' ')
            if ($size -match '(\d+)x(\d+)\s*$') { return @([int]$Matches[1], [int]$Matches[2]) }
            return @(720, 1600)
        }
        # Opens the settings row -Name from the list on screen and comes back to that list. Rows
        # lower down come into view one swipe at a time, each followed by a fresh dump; the list is
        # the Hush settings, and nothing else is on screen to touch.
        $walkPage = {
            param([string]$Name, [scriptblock]$OnList, [int]$Width, [int]$Height, [string]$Prefix)
            $nodes = & $readScreen
            $row = Find-WalkRow $nodes $Name $Package
            for ($swipe = 0; -not $row -and $swipe -lt 6; $swipe++) {
                [void](& $walkAdb @('shell', 'input', 'swipe', [string][int]($Width / 2), [string][int]($Height * 0.75),
                    [string][int]($Width / 2), [string][int]($Height * 0.35), '400'))
                Start-Sleep -Milliseconds 900
                $nodes = & $readScreen
                $row = Find-WalkRow $nodes $Name $Package
            }
            if (-not $row) {
                $problems.Add("the settings page $Name isn't in its list")
                Write-Host "[walk] no $Name row in the settings list"
                return $true
            }
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
            Start-Sleep -Seconds 2
            $nodes = & $readScreen
            if ((Test-WalkSettingsPage $nodes $Name $Package) -and (& $inFront)) {
                $seen.Screens++; $seen.Scenarios.Add("$Prefix$Name")
                Write-Host "[walk] opened the settings page $Name"
            } else {
                $problems.Add("the settings page $Name would not open")
                Write-Host "[walk] the settings page $Name would not open"
                # A tap that changed nothing leaves the list on screen, and Back would close it.
                if (& $OnList $nodes) { return $true }
            }
            [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Seconds 2
            $nodes = & $readScreen
            if (-not (& $OnList $nodes)) {
                $problems.Add("Back from $Name didn't return to its settings list")
                Write-Host "[walk] Back from $Name didn't return to its settings list"
                return $false
            }
            return $true
        }
        # Opens the section -Name in place on the home list, checks its rows came up under its
        # heading, and closes it again. The heading is found the way $walkPage finds a row, and
        # every tap is read from a dump taken after the last swipe or tap.
        $walkSection = {
            param([string]$Name, [string[]]$Headings, [int]$Width, [int]$Height)
            $nodes = & $readScreen
            $heading = Find-WalkHeading $nodes $Name $Package
            for ($swipe = 0; -not $heading -and $swipe -lt 6; $swipe++) {
                [void](& $walkAdb @('shell', 'input', 'swipe', [string][int]($Width / 2), [string][int]($Height * 0.75),
                    [string][int]($Width / 2), [string][int]($Height * 0.35), '400'))
                Start-Sleep -Milliseconds 900
                $nodes = & $readScreen
                $heading = Find-WalkHeading $nodes $Name $Package
            }
            if (-not $heading) {
                $problems.Add("the settings section $Name isn't in the home list")
                Write-Host "[walk] no $Name heading in the settings list"
                return $true
            }
            foreach ($want in @('open', 'closed')) {
                [void](& $walkAdb @('shell', 'input', 'tap', [string]$heading.X, [string]$heading.Y))
                Start-Sleep -Seconds 2
                $nodes = & $readScreen
                $state = Get-WalkSectionState $nodes $Name $Headings $Package
                if ($state -cne $want -or -not (Test-WalkSettingsHome $nodes $Package) -or -not (& $inFront)) {
                    $problems.Add("the settings section $Name would not $(if ($want -ceq 'open') { 'open' } else { 'close' })")
                    Write-Host "[walk] the settings section $Name stayed $(if ($state) { $state } else { 'off screen' })"
                    return (Test-WalkSettingsHome $nodes $Package)
                }
                $heading = Find-WalkHeading $nodes $Name $Package
            }
            $seen.Screens++; $seen.Scenarios.Add("section:$Name")
            Write-Host "[walk] opened and closed the settings section $Name"
            return $true
        }

        [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP'))
        $state = ((& $walkAdb @('get-state')).Output -join '').Trim()
        if ($state -cne 'device') { throw "$Serial is offline or unauthorized ($state)." }
        $reported = ((& $walkAdb @('get-serialno')).Output -join '').Trim()
        if ($reported -cne $Serial) { throw "adb answered for $reported, not $Serial." }
        $model = ((& $walkAdb @('shell', 'getprop', 'ro.product.model')).Output -join '').Trim()
        $avd = $null
        if ($Serial.StartsWith('emulator-', [StringComparison]::Ordinal)) {
            $avd = (@((& $walkAdb @('emu', 'avd', 'name')).Output) | Select-Object -First 1)
            if ($avd) { $avd = $avd.Trim() }
        }
        $window = (& $walkAdb @('shell', 'dumpsys', 'window')).Output -join "`n"
        if ($window -match 'isKeyguardShowing=true|mDreamingLockscreen=true') {
            throw "$Serial is locked. Unlock it by hand and walk again; the walk never unlocks a device."
        }

        if (-not $SkipPatch) {
            Write-Host "[walk] installing $(Split-Path -Leaf $installApk) on $Serial"
            Update-WalkLease $lease
            try {
                Install-AndroidPackage -Adb $Adb -Serial $Serial -PackageName $Package -Apk $installApk -Aapt2 $Aapt2 `
                    -LeaseDirectory $LeaseDirectory -LeaseToken $lease.Token -ChatIdentity $ChatIdentity `
                    -ExpectedModel $model -ExpectedAvd $avd -WorkDirectory $OutDir
            } catch {
                throw ("The build would not install on ${Serial}: $($_.Exception.Message) If the signer differs, patch with the key " +
                    'the installed app uses (-Keystore, -KeyAlias, -CliDefaultKeystore). The installed app and its data were left alone.')
            }
        }
        $started = [DateTimeOffset]::UtcNow
        $startedEpoch = [long]((& $walkAdb @('shell', 'date', '+%s')).Output -join '').Trim()
        [void](& $walkAdb @('shell', 'am', 'force-stop', $Package))
        $launch = & $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity")
        Start-Sleep -Seconds ($SettleSeconds * 2)
        if (($launch.Output -join "`n") -match '(?m)^Status:\s*ok\s*$' -and (& $inFront)) {
            $seen.Screens++; $seen.Scenarios.Add('launch')
            $nodes = & $readScreen
            $account = if (Find-WalkRow $nodes $WalkSignedOutMarker $Package) { 'signed out' } else { 'signed in' }
            Write-Host "[walk] opened Telegram ($account)"
        } else {
            $problems.Add('Telegram would not start')
        }

        if ($account -ceq 'signed in') {
            foreach ($link in $Visit) {
                $opened = & $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', "'$link'", '-p', $Package)
                Start-Sleep -Seconds $SettleSeconds
                $ok = ($opened.Output -join "`n") -match '(?m)^Status:\s*ok\s*$'
                $front = & $inFront
                if ($ok -and $front) {
                    $seen.Screens++; $seen.Scenarios.Add("visit:$link")
                    Write-Host "[walk] opened $link"
                } else {
                    $problems.Add("$link would not open (status ok: $ok, Telegram in front: $front)")
                    Write-Host "[walk] $link would not open"
                }
            }
        } elseif ($account -ceq 'signed out') {
            Write-Host "[walk] Telegram is signed out here, so its screens past sign-in aren't part of this walk"
        }

        $full = -not $SkipSettings
        if (-not $SkipSettings) {
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.APPLICATION_PREFERENCES', '-p', $Package))
            Start-Sleep -Seconds $SettleSeconds
            $nodes = & $readScreen
            if (-not (Test-WalkSettingsHome $nodes $Package)) {
                $problems.Add('the Hush settings would not open from App info''s intent')
                Write-Host '[walk] the Hush settings would not open'
            } else {
                $seen.Screens++; $seen.Scenarios.Add('settings:home')
                Write-Host '[walk] opened the Hush settings'
                $width, $height = & $screenSize
                $onHome = { param($nodes) Test-WalkSettingsHome $nodes $Package }
                # Every section heading the scenarios name, walked or not, so a closed section is
                # told apart by the heading under it.
                $headings = @($walkScenarios | Where-Object Kind -CEQ 'section' | ForEach-Object Page) + @($Sections)
                $listed = $true
                foreach ($section in $Sections) {
                    $listed = & $walkSection $section $headings $width $height
                    if (-not $listed) { break }
                }
                if ($listed) {
                    foreach ($page in $SettingsPages) {
                        if (-not (& $walkPage $page $onHome $width $height 'settings:')) { break }
                    }
                }
            }
            [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Seconds 1
        }
        $screens = $seen.Screens

        $crashLines = @((& $walkAdb @('logcat', '-b', 'crash', '-d', '-v', 'epoch')).Output)
        $fatal = @(Get-WalkCrashLines -Lines $crashLines -Since $startedEpoch -Package $Package)
        if ($fatal.Count -gt 0) {
            [IO.File]::WriteAllLines((Join-Path $OutDir 'crash-buffer.txt'), [string[]]$crashLines)
            $problems.Add("Telegram crashed during the walk: $($fatal[0].Trim())")
        }
        $alive = ((& $walkAdb @('shell', 'pidof', $Package)).Output -join '').Trim()
        if (-not $alive) { $problems.Add('Telegram was no longer running when the walk ended') }

        $reported = ((& $walkAdb @('get-serialno')).Output -join '').Trim()
        if ($reported -cne $Serial) { throw "adb answered for $reported at the end of the walk, not $Serial." }
        $appVersion = @((& $walkAdb @('shell', 'dumpsys', 'package', $Package)).Output |
            Where-Object { $_ -match 'versionName=(.+)$' } | ForEach-Object { $Matches[1].Trim() } | Select-Object -First 1) -join ''
        $apkPath = @((& $walkAdb @('shell', 'pm', 'path', $Package)).Output | Where-Object { $_ -like 'package:*base.apk' }) | Select-Object -First 1
        $installedSha = ''
        if ($apkPath) {
            $installedSha = (((& $walkAdb @('shell', 'sha256sum', $apkPath.Substring(8).Trim())).Output -join '') -split '\s+')[0]
        }

        # The app walked has to be the APK the record names, patched from this bundle.
        if ($null -eq $artifactRecord) {
            $problems.Add("there's no patch artifact record at $Artifact for the installed APK, so nothing ties it to this bundle")
        } else {
            if ($installedSha -cnotmatch '^[0-9a-f]{64}$' -or $installedSha -cne $artifactRecord.apkSha256) {
                $problems.Add("the installed APK ($installedSha) isn't the patched APK $($artifactRecord.apkSha256) in $Artifact")
            }
            if ($artifactRecord.bundleSha256 -cne $bundleSha256) {
                $problems.Add("the patched APK in $Artifact came from another bundle ($($artifactRecord.bundleSha256))")
            }
        }
        $patched = if ($artifactRecord) { [string[]]@($artifactRecord.patches) } else { [string[]]@() }
        $missing = @(Get-WalkRequiredScenarios -Scenarios $walkScenarios -Patches $patched -Account $account |
            Where-Object { $seen.Scenarios -cnotcontains $_ })
        if ($missing.Count -gt 0) { Write-Host "[walk] not walked: $($missing -join ', ')" }

        $full = $full -and $problems.Count -eq 0 -and $missing.Count -eq 0
        $result = Resolve-WalkOutcome -Screens $screens -Crashes $fatal.Count -Problems ([string[]]$problems) -Full $full
        $receipt = New-WalkReceipt -Result $result -Full $full -Serial $Serial -Device $model -Package $Package `
            -AppVersion $appVersion -BundleSha256 $bundleSha256 -InstalledApkSha256 $installedSha -Artifact $artifactRecord `
            -Account $account -Scenarios ([string[]]$seen.Scenarios) `
            -Started $started -Finished ([DateTimeOffset]::UtcNow) -Screens $screens -Crashes $fatal.Count `
            -Problems ([string[]]$problems)
        $receiptPath = Join-Path $OutDir 'walk-receipt.json'
        [IO.File]::WriteAllText($receiptPath, (ConvertTo-Json -InputObject $receipt -Depth 4) + "`n")

        Write-Host "[walk] receipt $receiptPath"
        foreach ($problem in $problems) { Write-Host "[walk]   $problem" }
        if ($result -ne 'PASS') { Write-Host '[walk] this walk does not back a release.' }
        Write-Host "[walk] $result on $model ($Serial, $account, $($receipt.kind)): $screens screens, $($fatal.Count) crashes, $($problems.Count) problems"
        return $receiptPath
    } finally {
        if ($lease) {
            Exit-WalkLease $lease
            Write-Host "[walk] released $Serial"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    $scenarioList = @(Read-WalkScenarios)
    if (-not $PSBoundParameters.ContainsKey('Visit')) { $Visit = @($scenarioList | Where-Object Kind -CEQ 'visit' | ForEach-Object Link) }
    if (-not $PSBoundParameters.ContainsKey('SettingsPages')) {
        $SettingsPages = @($scenarioList | Where-Object Kind -CEQ 'settings' | ForEach-Object Page)
    }
    if (-not $PSBoundParameters.ContainsKey('Sections')) { $Sections = @($scenarioList | Where-Object Kind -CEQ 'section' | ForEach-Object Page) }
    $receiptPath = Invoke-WalkApp -Serial $Serial -Package $Package -Visit $Visit -SettingsPages $SettingsPages `
        -Sections $Sections -SkipPatch:$SkipPatch -Artifact $Artifact -SkipSettings:$SkipSettings -SettleSeconds $SettleSeconds `
        -OutDir $OutDir -Apk $Apk -Keystore $Keystore -KeyAlias $KeyAlias -CliDefaultKeystore:$CliDefaultKeystore `
        -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity -Adb $Adb -Aapt2 $Aapt2 -Root $Root
    $walked = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
    if ($walked.result -cne 'PASS') { exit 1 }
}
