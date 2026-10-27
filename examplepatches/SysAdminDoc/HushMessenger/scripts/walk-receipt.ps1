<#
.SYNOPSIS
    The receipt a whole-app walk leaves, and what makes one good enough to publish a bundle on.

.DESCRIPTION
    Dot-sourced by release/release.ps1, whose publish stage refuses to publish a bundle without a
    receipt that backs it, and by walk-app.ps1, which writes it. Nothing goes public until an APK
    patched from the exact bundle being released has been walked end to end on a release phone or
    an emulator and came back PASS: every required step reached its own screen, with no Messenger
    crash and nothing in the way.

    The walk writes walk-receipt.json with New-WalkReceipt. It names the SHA-256 of the .mpp the
    walked APK was patched with, and publish holds that to the signed bundle it's about to upload,
    so a walk of any other build can't stand in for this one. It also names the APK patched from
    that bundle and the one the device ran, and the two must match, so a walk of whatever was
    already installed can't stand in either.

    Each step names the screen it reached and keeps a screenshot and a UI dump of it beside the
    receipt (steps/<id>.png and steps/<id>.xml), hashed in the receipt. The check reads those files
    again rather than trusting what the receipt says about them: the dump must show the step's own
    screen (its marker), no login or "Restore your chats" prompt, and a screen no other step showed.
    Markers match the English UI. Below Android 13 the message log's window is FLAG_SECURE, so that
    one step keeps its window's dumpsys entry (steps/<id>.window.txt) in place of the screenshot.
#>

# The phones release walks run on, by ro.product.model. An emulator passes by its serial.
$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')
$WalkReceiptSchema = 2

$WalkSettingsComponent = '/app\.hushmessenger\.extension\.Settings(Activity|Launcher)\b'
# Messenger's own screens: anything in Messenger's package that isn't a Hush settings window.
$WalkMessengerComponent = '^com\.facebook\.orca/(?!app\.hushmessenger\.)'
$WalkMessengerNodes = '<node\b[^>]*\bpackage="com\.facebook\.orca"'

# The inbox's own launcher activity. Brought up by am start it resumes under this alias, not MainActivity.
$WalkInboxActivity = '.auth.StartScreenActivity'

# Every screen a release walk must reach, in walk order. A sheet step is required only when its
# patch was applied, and it's opened by tapping its button on the Controls page. Each Messenger step
# names its own activity and a node only its screen has, read off the signed-in S22 on 584.1, so a
# link that falls back to the inbox or any other Messenger screen fails. The markers are English
# labels: walk on an English account. 584.1 drops threads, active_now, montage, compose, stickerstore
# and marketplace from an outside caller, cold or warm (IntentHandlerActivity finishes without routing),
# so those aren't steps; the inbox opens through its launcher activity instead.
$WalkSteps = @(
    [pscustomobject]@{ Id = 'chat'; Kind = 'chat'; Link = ''
        Activity = '^com\.facebook\.orca/com\.facebook\.messaging\.msys\.thread\.fragment\.MsysThreadViewActivity\z'
        Marker = '<node\b[^>]*\bcontent-desc="(?:[^"]*, )?Thread details"' }
    [pscustomobject]@{ Id = 'inbox'; Kind = 'inbox'; Link = ''
        Activity = '^com\.facebook\.orca/(?:\.auth\.StartScreenActivity|com\.facebook\.messenger\.neue\.MainActivity)\z'
        Marker = '<node\b[^>]*\bcontent-desc="New message"' }
    [pscustomobject]@{ Id = 'settings-controls'; Kind = 'settings'; Page = 'controls'; Activity = $WalkSettingsComponent
        Marker = '<node\b[^>]*\btext="Controls"[^>]*\bselected="true"' }
    [pscustomobject]@{ Id = 'settings-app'; Kind = 'settings'; Page = 'app'; Activity = $WalkSettingsComponent
        Marker = '<node\b[^>]*\btext="App"[^>]*\bselected="true"' }
    # Section is the closed-by-default settings section holding the button, opened through the launch extra.
    # SecureBelowSdk: below Android 13 the log keeps out of Recents with FLAG_SECURE, which screencap can't take,
    # so there the step keeps its window's dumpsys entry, showing the flag, in place of a screenshot.
    [pscustomobject]@{ Id = 'message-log'; Kind = 'sheet'; Patch = 'Keep a message log'; Button = 'View log'; Close = 'Close'
        Section = 'privacy'; Activity = $WalkSettingsComponent; Marker = '<node\b[^>]*\btext="Message log"'; SecureBelowSdk = 33 }
    [pscustomobject]@{ Id = 'auto-reply'; Kind = 'sheet'; Patch = 'Auto reply'; Button = 'Edit replies'; Close = 'Cancel'
        Section = 'conversations'; Activity = $WalkSettingsComponent; Marker = '<node\b[^>]*\btext="Auto replies"' }
    # Messenger's own settings, where the HushMessenger row sits, then its story and contact settings.
    [pscustomobject]@{ Id = 'settings'; Kind = 'link'; Link = 'fb-messenger://settings'
        Activity = '^com\.facebook\.orca/com\.facebook\.messaging\.settings\.mesettings\.surface\.MessengerMePreferenceActivity\z'
        Marker = '<node\b[^>]*\btext="Dark mode"' }
    [pscustomobject]@{ Id = 'story-settings'; Kind = 'link'; Link = 'fb-messenger://settings/montage'
        Activity = '^com\.facebook\.orca/com\.facebook\.messaging\.montage\.prefs\.MontagePreferenceActivity\z'
        Marker = '<node\b[^>]*\btext="Who can see your stories\?"' }
    [pscustomobject]@{ Id = 'contact-settings'; Kind = 'link'; Link = 'fb-messenger://upload_contacts_settings'
        Activity = '^com\.facebook\.orca/com\.facebook\.messaging\.contacts\.settings\.mesettings\.NeueContactsPreferenceActivity\z'
        Marker = '<node\b[^>]*\btext="Manage contacts"' }
)

# A screen standing in front of the one a step asked for. Either one in a dump fails the step,
# whether the words sit in a node's text or only in its content-desc (Compose buttons do that).
$WalkBlockingScreens = @(
    # 584.1 draws its headline outside the accessibility tree, so only its "Restore now" button shows in a dump.
    [pscustomobject]@{ Name = 'the "Restore your chats" prompt'; Pattern = '(?i)<node\b[^>]*\b(text|content-desc)="([^"]*\brestore your\b[^"]*\bchats\b[^"]*|Restore now)"' }
    [pscustomobject]@{ Name = 'the login screen'; Pattern = '(?i)<node\b[^>]*\b(text|content-desc)="(Log in|Log into Messenger|Mobile number or email|Continue as [^"]*)"' }
)
$WalkBlockingActivities = @(
    [pscustomobject]@{ Name = 'the login screen'; Pattern = '(?i)/[\w.$]*Login[\w$]*Activity\b' }
    # NeueNuxActivity carries the chat restore prompt and Messenger's other first-run screens.
    [pscustomobject]@{ Name = "one of Messenger's first-run screens"; Pattern = '(?i)/[\w.$]*Nux[\w$]*Activity\b' }
)

# The functions read $script:WalkSteps: names ignore case, so a caller's own $walkSteps would
# otherwise stand in for the table through dynamic scope. Dot-source this file at script level.
function Get-WalkStepDefinition([string]$Id) {
    return @($script:WalkSteps | Where-Object { $_.Id -ceq $Id }) | Select-Object -First 1
}

function Get-WalkRequiredSteps {
    <#
    .SYNOPSIS
        The step ids a walk of an APK with these patches applied must pass, in walk order.
    #>
    param([string[]]$AppliedPatches = @())
    return [string[]]@($script:WalkSteps | Where-Object { $_.Kind -cne 'sheet' -or $AppliedPatches -ccontains $_.Patch } | ForEach-Object { $_.Id })
}

function Get-WalkScreenSignature {
    <#
    .SYNOPSIS
        What a UI dump looks like with its words, times and positions left out: each node's depth,
        class, id and package. Two steps with the same signature showed the same screen.
    #>
    param([Parameter(Mandatory = $true)][string]$Xml)
    $depth = 0
    $shape = [Text.StringBuilder]::new()
    foreach ($tag in [regex]::Matches($Xml, '<(/?)node\b([^>]*?)(/?)>')) {
        if ($tag.Groups[1].Value) { $depth--; continue }
        $attributes = $tag.Groups[2].Value
        $parts = foreach ($name in 'class', 'resource-id', 'package') {
            $found = [regex]::Match($attributes, "\b$name=""([^""]*)""")
            if ($found.Success) { $found.Groups[1].Value } else { '' }
        }
        [void]$shape.Append("$depth|$($parts -join '|')`n")
        if (-not $tag.Groups[3].Value) { $depth++ }
    }
    $bytes = [Text.Encoding]::UTF8.GetBytes($shape.ToString())
    return [Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($bytes)).ToLowerInvariant()
}

function Test-WalkPng([string]$Path) {
    # Whether -Path is a PNG by its first eight bytes. A failed screencap leaves an empty file or an error message.
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return $false }
    $stream = [IO.File]::OpenRead($Path)
    try {
        $head = [byte[]]::new(8)
        return $stream.Read($head, 0, 8) -eq 8 -and [Convert]::ToHexString($head) -ceq '89504E470D0A1A0A'
    } finally { $stream.Dispose() }
}

# A Hush settings window's entry in dumpsys window windows.
$WalkSettingsWindow = 'Window\{[0-9a-f]+ u\d+ com\.facebook\.orca/app\.hushmessenger\.extension\.SettingsActivity\}'

function Get-WalkSettingsWindows {
    <#
    .SYNOPSIS
        The entries of dumpsys window windows that belong to Hush's settings windows, each from its
        "Window #n" line to the next one. '' when none is listed.
    #>
    param([string[]]$Lines = @())
    $kept = [Text.StringBuilder]::new()
    $inside = $false
    foreach ($line in $Lines) {
        if ($line -match '^\s*Window #\d+ Window\{') { $inside = $line -match $WalkSettingsWindow }
        if ($inside) { [void]$kept.Append("$line`n") }
    }
    return $kept.ToString()
}

function Test-WalkSecureWindow([AllowEmptyString()][string]$Text) {
    # Whether one Hush settings window in those entries carries FLAG_SECURE (fl= may sit on a wrapped mAttrs line).
    foreach ($entry in [regex]::Split([string]$Text, '(?m)^(?=\s*Window #\d+ )')) {
        if ($entry -match $WalkSettingsWindow -and $entry -match '\bfl=[^\r\n]*\bSECURE\b') { return $true }
    }
    return $false
}

function Test-WalkStepScreen {
    <#
    .SYNOPSIS
        Why the screen a step reached isn't the one it asked for, or $null when it is. Reads the
        step's UI dump; the walk asks this while it walks and publish asks it again of the files.
    #>
    param([Parameter(Mandatory = $true)]$Definition, [AllowEmptyString()][string]$Activity, [AllowEmptyString()][string]$Xml)
    if ([string]::IsNullOrEmpty($Xml) -or $Xml -notmatch '<hierarchy\b') {
        # uiautomator often can't dump another app's busy screen, so name the app that had it.
        $front = [regex]::Match([string]$Activity, '^([\w.]+)/')
        if ($front.Success -and $front.Groups[1].Value -cne 'com.facebook.orca') {
            return "$($Definition.Id) left no UI dump, with $($front.Groups[1].Value) in front instead of Messenger (another app or session had the screen)"
        }
        return "$($Definition.Id) left no UI dump"
    }
    foreach ($blocking in $WalkBlockingScreens) {
        if ($Xml -match $blocking.Pattern) { return "$($Definition.Id) showed $($blocking.Name) instead" }
    }
    foreach ($blocking in $WalkBlockingActivities) {
        if ($Activity -match $blocking.Pattern) { return "$($Definition.Id) showed $($blocking.Name) instead ($Activity)" }
    }
    if ($Activity -notmatch $Definition.Activity) { return "$($Definition.Id) reached $(if ($Activity) { $Activity } else { 'no screen' }), not its own" }
    if ($Xml -notmatch $Definition.Marker) { return "$($Definition.Id)'s screen doesn't show what it should" }
    return $null
}

function New-WalkReceipt {
    <#
    .SYNOPSIS
        The receipt for one walk, as an ordered dictionary ready for ConvertTo-Json.
    #>
    param(
        [Parameter(Mandatory = $true)][ValidateSet('PASS', 'PARTIAL', 'FAIL')][string]$Result,
        [Parameter(Mandatory = $true)][bool]$Full,
        [Parameter(Mandatory = $true)][string]$Serial,
        [Parameter(Mandatory = $true)][string]$Device,
        # ro.build.version.sdk, 0 when it didn't read. Decides whether a secure window may stand in for a screenshot.
        [int]$Sdk,
        [AllowEmptyString()][string]$AppVersion,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        # The APK patched from that bundle, and the one the device ran. '' when unknown.
        [AllowEmptyString()][string]$PatchedApkSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        # The patches Desktop applied to the walked APK, which decide the required steps.
        [string[]]$AppliedPatches = @(),
        # One record per step walked: id, activity, opened, problem, screenshot/uiDump paths and hashes.
        [object[]]$Steps = @(),
        [int]$Crashes,
        [string[]]$Problems = @()
    )
    return [ordered]@{
        schema = $WalkReceiptSchema; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal); sdk = $Sdk
        appVersion = $AppVersion; bundleSha256 = $BundleSha256.ToLowerInvariant()
        patchedApkSha256 = $PatchedApkSha256; installedApkSha256 = $InstalledApkSha256
        started = $Started.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ'); finished = $Finished.UtcDateTime.ToString('yyyy-MM-ddTHH:mm:ssZ')
        appliedPatches = @($AppliedPatches); requiredSteps = @(Get-WalkRequiredSteps -AppliedPatches $AppliedPatches)
        steps = @($Steps); screens = @($Steps | Where-Object { $_.opened -eq $true }).Count
        crashes = $Crashes; problems = @($Problems)
    }
}

function Test-WalkReceipt {
    <#
    .SYNOPSIS
        Whether the receipt at -Path is a full, passing walk of the bundle at -BundlePath, on a
        release phone or an emulator, with every required step's evidence beside it. Answers
        @{ Valid; Reason; Receipt }.
    #>
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$BundlePath)
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null } }
    function IsCount($Value) { return $Value -is [int] -or $Value -is [long] }
    function IsSha256($Value) { return $Value -is [string] -and $Value -cmatch '^[0-9a-f]{64}\z' }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try { $receipt = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json -NoEnumerate }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    if ($null -eq $receipt -or $receipt -isnot [pscustomobject] -or -not (IsCount $receipt.schema) -or $receipt.schema -ne $WalkReceiptSchema) {
        return Fail "the walk receipt isn't schema $WalkReceiptSchema (an older receipt only counted screens, so walk again)"
    }
    if ($receipt.result -isnot [string] -or $receipt.result -cne 'PASS') {
        return Fail "the walk ended $(if ($receipt.result -is [string] -and $receipt.result) { $receipt.result } else { 'with no result' }), not PASS"
    }
    if ($receipt.full -isnot [bool] -or -not $receipt.full) { return Fail 'the walk skipped part of the app, so it was not the whole app' }
    if (-not (IsCount $receipt.crashes) -or $receipt.crashes -ne 0) { return Fail 'the walk recorded a Messenger crash' }
    if ($receipt.problems -isnot [array] -or @($receipt.problems | Where-Object { $_ -isnot [string] }).Count) {
        return Fail "the walk receipt's problems aren't a list"
    }
    if ($receipt.problems.Count) { return Fail "the walk recorded problems: $($receipt.problems -join '; ')" }
    if ($receipt.device -isnot [string] -or $receipt.serial -isnot [string] -or $receipt.emulator -isnot [bool]) {
        return Fail "the walk receipt doesn't say which device walked it"
    }
    $isEmulator = $receipt.serial.StartsWith('emulator-', [StringComparison]::Ordinal)
    if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
        return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
    }
    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
        return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
    }
    if (-not (IsSha256 $receipt.patchedApkSha256)) {
        return Fail "the walk receipt doesn't name the APK patched from this bundle, so nothing shows the walked app came from it"
    }
    if ($receipt.installedApkSha256 -isnot [string] -or $receipt.installedApkSha256 -cne $receipt.patchedApkSha256) {
        return Fail "the walk ran APK '$($receipt.installedApkSha256)', not '$($receipt.patchedApkSha256)', the one patched from this bundle"
    }

    if ($receipt.appliedPatches -isnot [array] -or $receipt.appliedPatches.Count -eq 0 -or
        @($receipt.appliedPatches | Where-Object { $_ -isnot [string] -or -not $_ }).Count) {
        return Fail "the walk receipt doesn't list the patches the walked APK has"
    }
    $required = @(Get-WalkRequiredSteps -AppliedPatches ([string[]]$receipt.appliedPatches))
    $listed = $receipt.requiredSteps
    $sameSteps = $listed -is [array] -and $listed.Count -eq $required.Count
    for ($i = 0; $sameSteps -and $i -lt $required.Count; $i++) { $sameSteps = $listed[$i] -is [string] -and $listed[$i] -ceq $required[$i] }
    if (-not $sameSteps) {
        return Fail "the walk receipt's required steps ($(@($receipt.requiredSteps) -join ', ')) aren't the ones this APK needs ($($required -join ', '))"
    }
    if ($receipt.steps -isnot [array]) { return Fail "the walk receipt doesn't list its steps" }
    if (-not (IsCount $receipt.screens) -or $receipt.screens -ne $receipt.steps.Count) {
        return Fail "the walk receipt counts $($receipt.screens) screens but lists $($receipt.steps.Count) steps"
    }
    $folder = Split-Path -Parent ([IO.Path]::GetFullPath($Path))
    $seen = @{}
    $shapes = @{}
    foreach ($step in $receipt.steps) {
        if ($step -isnot [pscustomobject] -or $step.id -isnot [string] -or -not $step.id) { return Fail 'the walk receipt lists a step with no id' }
        $definition = Get-WalkStepDefinition $step.id
        if ($null -eq $definition) { return Fail "the walk receipt lists a step it doesn't know ($($step.id))" }
        if ($seen.ContainsKey($step.id)) { return Fail "the walk receipt lists $($step.id) twice" }
        $seen[$step.id] = $true
        if ($required -cnotcontains $step.id) { return Fail "the walk receipt lists $($step.id), which this APK doesn't have" }
        if ($step.problem -isnot [string]) { return Fail "$($step.id)'s problem isn't a line of text" }
        if ($step.opened -isnot [bool] -or -not $step.opened -or $step.problem) {
            return Fail "$($step.id) didn't open$(if ($step.problem) { ": $($step.problem)" })"
        }
        # A step whose window is FLAG_SECURE below its SDK keeps that window's dumpsys entry instead of a screenshot.
        $kinds = @(@('screenshot', '.png'), @('uiDump', '.xml'))
        $secureShot = $definition.SecureBelowSdk -and $step.screenshot -ceq '' -and $null -ne $step.secureWindow
        if ($secureShot) {
            if (-not (IsCount $receipt.sdk) -or $receipt.sdk -le 0 -or $receipt.sdk -ge $definition.SecureBelowSdk) {
                return Fail "$($step.id) has no screenshot, and only below Android SDK $($definition.SecureBelowSdk) does its window keep one out"
            }
            $kinds = @(@('secureWindow', '.window.txt'), @('uiDump', '.xml'))
        }
        $evidence = @{}
        foreach ($kind in $kinds) {
            $relative = $step.($kind[0])
            $hash = $step.("$($kind[0])Sha256")
            if ($relative -cne "steps/$($step.id)$($kind[1])" -or -not (IsSha256 $hash)) {
                return Fail "$($step.id) doesn't name its $($kind[0]) and its SHA-256"
            }
            $file = Join-Path $folder $relative
            if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { return Fail "$($step.id)'s $($kind[0]) isn't beside the receipt ($relative)" }
            if ((Get-FileHash -LiteralPath $file -Algorithm SHA256).Hash.ToLowerInvariant() -cne $hash) {
                return Fail "$($step.id)'s $($kind[0]) changed after the walk ($relative)"
            }
            $evidence[$kind[0]] = $file
        }
        if ($secureShot) {
            if (-not (Test-WalkSecureWindow ([IO.File]::ReadAllText($evidence.secureWindow)))) {
                return Fail "$($step.id) has no screenshot, and its window entry doesn't show FLAG_SECURE"
            }
        } elseif (-not (Test-WalkPng $evidence.screenshot)) { return Fail "$($step.id)'s screenshot isn't a PNG" }
        $xml = [IO.File]::ReadAllText($evidence.uiDump)
        $wrong = Test-WalkStepScreen -Definition $definition -Activity ([string]$step.activity) -Xml $xml
        if ($wrong) { return Fail $wrong }
        $shape = Get-WalkScreenSignature -Xml $xml
        if ($shapes.ContainsKey($shape)) { return Fail "$($step.id) showed the same screen as $($shapes[$shape])" }
        $shapes[$shape] = $step.id
    }
    foreach ($id in $required) { if (-not $seen.ContainsKey($id)) { return Fail "the walk left out $id" } }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt }
}
