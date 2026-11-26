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
      PASS      every case of the canonical case list reached its destination, Pinterest's main
                process stayed the one the launch started, and no crash, ANR or failing exit.
      PARTIAL   a canonical case or hook family was left out (-SkipSettings, a -Visit,
                -SettingsPages or -HookFamilies list without it), a hook family wasn't
                exercised, or the installed build isn't bound to the bundle.
      FAIL      a crash, an ANR, a failing exit, a restart or stop of the main process, a case that
                didn't reach its destination, or Pinterest gone at the end.
    Only a PASS backs a release.

    The cases come from Get-WalkCaseList in walk-receipt.ps1, in order: the home feed, a home feed pin's overflow menu
    and its long-press menu, the pin, the pin's own overflow menu, three searches, the Inbox, the
    Hush settings list and each of its pages. A case passes only when its destination shows: the
    anchors its entry names (resource ids, descriptions or texts in a fresh plain uiautomator
    dump, for the menus Hush's own row too while that family's switch is on) and, for every case
    inside Pinterest, its main activity resumed, so a login, error or fallback screen fails the
    case by name. The receipt's cases field holds each case's result, resumed activity and
    anchor, and for a menu which of Pinterest's implementations served it when the dump shows
    one: the pop-up menu or the round long-press menu, unrecognized otherwise. Its caseList
    field holds the list's version, the canonical cases and hook families left out, which keep a
    walk from being full, and the extra links or pages walked, which count toward nothing.
    Publish checks all of it again: the list's version, every canonical case and hook family
    passed, and the process evidence below with no failing exit, ANR or restart.

    A link is opened with am start -W -a VIEW -d ... -p com.pinterest and has to report Status: ok.
    No link reaches the Inbox (Pinterest sends pinterest://notifications/ to the home feed), so
    the walk opens it from the home feed: the bottom bar's Home, then the header's Inbox button,
    each read by its description from a fresh dump. The Hush settings open through
    APPLICATION_PREFERENCES, the intent Android's App info page sends. Settings has no intent for a
    single page, so each page is opened from the settings list: a fresh uiautomator dump, the row
    whose text is exactly the page's name, a tap on its centre, and a page counts when its title
    shows and the list's search box is gone. Back returns to the list. Taps only ever
    land on Hush settings rows read from a dump taken after the last scroll or Back.

    The menus are only read. A pin's overflow button is tapped from a fresh dump, the menu is
    dumped, Back closes it and the screen it opened from has to show again with neither menu
    over it. The long press starts from a fresh dump that has to show the home feed with no
    menu over it, picks the pin from that dump and holds it in one shell command that dumps the
    menu while it's held and then cancels the touch, which can't pick anything whatever menu
    came up. A retry does all of that again. No row or button of a menu is ever tapped.

    Process health: Pinterest is started if it isn't running, so the deliberate force-stop always
    leaves its own exit record. Just before the stop the walk lists the device's processes, and
    two seconds after it saves Pinterest's exit records (dumpsys activity exit-info) as the
    baseline. After every case it follows the main process's pid, user 0's only, and reads the
    exit records again, keeping each one it hasn't seen, since the device keeps only the last
    few. At the end Resolve-WalkExits (walk-receipt.ps1) classes them all: old, the initial stop
    (the force-stop's own record for a pid that was running), unrelated (another user's), a
    helper eviction or other helper exit, or a failure (a crash, ANR or failed start of any
    Pinterest process, any other exit of the main one, or a helper still in use killed). An ANR
    the event log has already dropped still shows as an exit record. A failure, an ANR in user
    0 or a main pid that changed or went away fails the walk, and so does a crash in the crash
    buffer unless the exit records place its pid in another user. The receipt's process field
    holds the stop time, the pids running before it, the baseline, every exit since the stop
    with the facts its class comes from, the ANRs and the restarts, and the publish gate
    classes each exit again from those facts.

    The walk also holds the patches' hooks to account. Before it restarts Pinterest it turns on the
    switch of every family in -HookFamilies (the canonical Get-WalkHookFamilies map by default), and after the last settings page it saves the full
    diagnostics report from Pause, backup and diagnostics, copies it to the output folder as
    diagnostics.txt and deletes the phone's copy. A family whose case opened with its switch on
    fails the walk, by name, when [HOOK STATUS] shows its hook never ran or lists a target it
    missed or found more than once. Every family the map leaves out, or whose case didn't open, is
    reported as not exercised rather than passed. The receipt's hooks field holds each verdict.
    The switches the walk turned on are turned back off before it ends, even when it fails. The
    walk also turns off, for its run, any switch of Get-WalkRouteSwitches it finds on (the pin's
    back arrow and the Notifications button take away what it finds or reaches a case by), and
    turns those back on the same way.

    Device safety: the walk takes an exclusive serial lease and releases it when it's done. It
    changes no device setting, only wakes the screen, and stops when the phone is locked rather than
    unlocking it. It never uninstalls or clears the installed app; an install that can't update
    the app in place is a problem the walk reports, not one it forces past. On the pin it only
    opens its overflow menu and swipes, and on the Inbox, which lists suggested people, it only
    reads the title and goes Back. Every other tap lands on a Hush settings row, its export
    dialog, a pin's overflow button, the bottom bar's Home or the Inbox button. Nothing it does
    sends a message, saves a pin or changes a board.

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
    # The deep links to open, the canonical list's (Get-WalkCaseList) when not given. A canonical
    # link left out makes the walk PARTIAL, and a link the list doesn't have is walked as an extra
    # case that counts toward nothing. A link that won't open fails the walk rather than skipping it.
    [string[]]$Visit = @(),
    # Swipes up once a case has opened, by case id (an extra link's id is the link), for a surface
    # below its first screen: Hide topic suggestions works on the pin's "Ideas you might love" row,
    # in the related grid that loads four or five screens down. Swiping past it is harmless; it
    # only has to be bound once.
    [hashtable]$CaseSwipes = @{ pin = 7 },
    # Which case reaches each hook family, by case id: 'home' for the home feed, 'grid-menu' and
    # 'long-press' for a home feed pin's menus, 'pin' for the pin, 'inbox' for the Inbox opened from
    # the home feed, or an extra link. Page, Switch and Key name the switch that turns it on: its
    # settings page and English title, and its key as the diagnostics report prints it. The
    # canonical map (Get-WalkHookFamilies) when not given. A family left out is reported as not
    # exercised, and a canonical family left out or mapped differently makes the walk PARTIAL.
    [object[]]$HookFamilies,
    # The Hush settings pages to open, by the name each row shows in English, the canonical list's
    # when not given. Leaving one out makes the walk PARTIAL; one the list doesn't have is extra.
    [string[]]$SettingsPages = @(),
    # An unbound installed build can be surveyed, but only matching build evidence permits a
    # release walk. The sidecar comes from patch-for-device.ps1 after its checks pass.
    [switch]$SkipPatch,
    [string]$BuildEvidence,
    # Leave the Hush settings pages out of the walk. Makes the walk PARTIAL, not a release walk.
    [switch]$SkipSettings,
    [ValidateRange(1, 30)][int]$SettleSeconds = 4,
    [string]$OutDir = (Join-Path $env:TEMP 'hushpinterest-walk'),
    # Patches left out of the walked build, passed to patch-for-device.ps1, which records them in
    # the build evidence: GmsCore support and Spoof signature for Google sign-in on a phone without
    # microG-RE, where Pinterest would lose Play services. Commas split a single value.
    [string[]]$Exclude = @(),
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
# Where Save full report leaves morphe-diagnostics-<time>-<id>.txt.
$WalkReportFolder = '/sdcard/Download/Morphe'
# The activity Pinterest's signed-in screens resume in: the home feed, pins, searches and the
# Inbox. A case inside Pinterest passes only with it in front, so a login, error or fallback
# screen can't stand in for one.
$WalkHomeActivity = 'com.pinterest.activityLibrary.activity.task.activity.MainActivity'
# What a signed-out Pinterest resumes instead, named when it's in front.
$WalkLoginActivity = 'com.pinterest.identity.UnauthActivity'

function Resolve-WalkPlan {
    <#
    .SYNOPSIS
        The cases a walk runs, from the canonical list: every one, unless -Visit or -SettingsPages
        names a shorter list or -SkipSettings drops the settings. LeftOut holds the canonical ids
        the walk won't run (a walk with any is PARTIAL), Extra the ids of links and pages the list
        doesn't have, which run as extra cases. A pin left out takes its menu with it.
    #>
    param([object[]]$Cases = @(Get-WalkCaseList), [AllowNull()][string[]]$Visit, [AllowNull()][string[]]$SettingsPages,
        [bool]$SkipSettings)
    $planned = [Collections.Generic.List[object]]::new()
    $leftOut = [Collections.Generic.List[string]]::new()
    $extra = [Collections.Generic.List[string]]::new()
    $ids = [Collections.Generic.HashSet[string]]::new()
    foreach ($case in @($Cases)) {
        $keep = switch ($case.Kind) {
            'link' { $null -eq $Visit -or @($Visit) -ccontains $case.Target }
            'settings' { -not $SkipSettings }
            'page' { -not $SkipSettings -and ($null -eq $SettingsPages -or @($SettingsPages) -ccontains $case.Target) }
            default { -not $case.Origin -or $ids.Contains($case.Origin) }
        }
        if ($keep) { $planned.Add($case); [void]$ids.Add($case.Id) } else { $leftOut.Add($case.Id) }
        if ($case.Id -ceq 'search-users') {
            foreach ($link in @($Visit | Where-Object { $_ -and @($Cases | ForEach-Object { $_.Target }) -cnotcontains $_ } | Select-Object -Unique)) {
                $planned.Add(@{ Id = $link; Kind = 'link'; Target = $link; Marks = @() }); $extra.Add($link)
            }
        }
    }
    if (-not $SkipSettings) {
        foreach ($page in @($SettingsPages | Where-Object { $_ -and $WalkSettingsPages -cnotcontains $_ } | Select-Object -Unique)) {
            $planned.Add(@{ Id = "settings:$page"; Kind = 'page'; Target = $page; Marks = @("text:$page"); Absent = @("text:$WalkSettingsHome") })
            $extra.Add("settings:$page")
        }
    }
    [pscustomobject]@{ Cases = @($planned); LeftOut = @($leftOut); Extra = @($extra) }
}

function Get-WalkNodes {
    <#
    .SYNOPSIS
        Every node of a uiautomator dump: its resource id's name, text, content description,
        package, bounds and centre. A failed dump has none.
    #>
    param([string]$Xml)
    if ([string]::IsNullOrWhiteSpace($Xml) -or $Xml -notmatch '<hierarchy') { return @() }
    $document = [xml]$Xml
    foreach ($node in $document.SelectNodes('//node')) {
        if ($node.GetAttribute('bounds') -notmatch '^\[(\d+),(\d+)\]\[(\d+),(\d+)\]$') { continue }
        $left = [int]$Matches[1]; $top = [int]$Matches[2]; $right = [int]$Matches[3]; $bottom = [int]$Matches[4]
        $resource = [string]$node.GetAttribute('resource-id')
        [pscustomobject]@{
            Id = if ($resource -match ':id/(.+)$') { $Matches[1] } else { '' }
            Text = [string]$node.GetAttribute('text'); Desc = [string]$node.GetAttribute('content-desc')
            Package = [string]$node.GetAttribute('package')
            Left = $left; Top = $top; Right = $right; Bottom = $bottom
            X = [int](($left + $right) / 2); Y = [int](($top + $bottom) / 2)
        }
    }
}

function Test-WalkMark {
    <#
    .SYNOPSIS
        Whether a node from Get-WalkNodes carries -Mark: kind:value for an exact match or
        kind~pattern for a case-sensitive regex, where kind is id (the resource id's name), desc,
        text, or any (the text or the description). Marks joined by ' && ' all have to be on this
        one node.
    #>
    param($Node, [string]$Mark)
    if ($Mark.Contains(' && ')) {
        foreach ($part in $Mark -split ' && ') { if (-not (Test-WalkMark $Node $part)) { return $false } }
        return $true
    }
    if ($Mark -notmatch '^(id|desc|text|any)([:~])(.*)$') { throw "The walk mark $Mark isn't kind:value or kind~pattern." }
    $kind = $Matches[1]; $exact = $Matches[2] -ceq ':'; $value = $Matches[3]
    $fields = switch ($kind) { 'id' { @($Node.Id) } 'desc' { @($Node.Desc) } 'text' { @($Node.Text) } default { @($Node.Text, $Node.Desc) } }
    foreach ($field in $fields) {
        if ([string]::IsNullOrEmpty($field)) { continue }
        if ($exact -and $field -ceq $value) { return $true }
        if (-not $exact -and $field -cmatch $value) { return $true }
    }
    return $false
}

function Test-WalkAnchor {
    <#
    .SYNOPSIS
        What keeps a dump from being a case's destination: one line for each of -Marks no Pinterest
        node carries and each of -Absent one still does. Nothing when the dump is the destination.
    #>
    param([string]$Xml, [string[]]$Marks = @(), [string[]]$Absent = @(), [string]$Package = 'com.pinterest')
    $nodes = @(Get-WalkNodes $Xml | Where-Object { $_.Package -ceq $Package })
    if ($nodes.Count -eq 0) { return 'no Pinterest screen in the dump' }
    foreach ($mark in @($Marks | Where-Object { $_ })) {
        if (-not @($nodes | Where-Object { Test-WalkMark $_ $mark }).Count) { "no $mark" }
    }
    foreach ($mark in @($Absent | Where-Object { $_ })) {
        if (@($nodes | Where-Object { Test-WalkMark $_ $mark }).Count) { "$mark still showing" }
    }
}

function Get-WalkMenuKind {
    <#
    .SYNOPSIS
        Which of Pinterest's implementations served a menu case, named only from what the dump
        shows: for an overflow menu the pop-up menu (the modal header's dismiss button), for a long
        press the round menu (a Send or Search image button with a description and no text, and no
        pop-up menu). Anything else, Pinterest's full-screen sheet and its Compose long-press list
        included, is unrecognized: neither has a mark the walk has seen on a device.
    #>
    param([string]$Xml, [string]$Kind, [string]$Package = 'com.pinterest')
    $nodes = @(Get-WalkNodes $Xml | Where-Object { $_.Package -ceq $Package })
    $popup = @($nodes | Where-Object { $_.Id -ceq 'modal_header_dismiss_bt' }).Count -gt 0
    if ($Kind -ceq 'menu') { return $(if ($popup) { 'pop-up menu' } else { 'unrecognized' }) }
    $round = @($nodes | Where-Object { -not $_.Text -and $_.Desc -cmatch '^(Send|Search image)$' }).Count -gt 0
    if ($round -and -not $popup) { return 'round menu' }
    'unrecognized'
}

function Get-WalkMainPids {
    <#
    .SYNOPSIS
        The pids of -Package's main process for user 0 in ps -A -o PID,UID,NAME output, so a copy
        running for a work profile or another user is never the one the walk follows. The UID
        column is numeric (under 100000 for user 0) or a name like u0_a234.
    #>
    param([string[]]$Lines, [string]$Package = 'com.pinterest')
    foreach ($line in @($Lines)) {
        $fields = @("$line".Trim() -split '\s+')
        if ($fields.Count -ne 3 -or $fields[0] -cnotmatch '^\d+$' -or $fields[2] -cne $Package) { continue }
        if (($fields[1] -cmatch '^\d+$' -and [long]$fields[1] -lt 100000) -or $fields[1] -cmatch '^u0_') { $fields[0] }
    }
}

function Get-WalkResumedActivity {
    <#
    .SYNOPSIS
        The resumed activity in dumpsys activity activities output, as Package and Class with a
        leading-dot class expanded. The topResumedActivity line wins over a display's own.
    #>
    param([string[]]$Lines)
    $found = $null
    foreach ($line in @($Lines)) {
        if ($line -notmatch '(top)?ResumedActivity[=:]\s*ActivityRecord\{\S+ u\d+ ([\w.]+)/([\w.$]+)') { continue }
        $className = if ($Matches[3].StartsWith('.')) { $Matches[2] + $Matches[3] } else { $Matches[3] }
        $activity = [pscustomobject]@{ Package = $Matches[2]; Class = $className }
        if ($Matches[1]) { return $activity }
        if (-not $found) { $found = $activity }
    }
    $found
}

function Get-WalkCallProblem {
    <#
    .SYNOPSIS
        Why an input can't go to the device now, or $null when it can. A phone that carries a work
        line (Aircall on the S25) shows an incoming call's card over Pinterest, and a tap there can
        answer or reject the call. Telecom's current calls sit between mCalls: and mCallAudioManager:
        (its history further down names calls too), and the last mAudioModeOwner line holds the
        audio mode in force (0 is normal). A phone that prints no audio mode isn't read as calm; an
        emulator that prints none is.
    #>
    param([string]$Serial, [string[]]$Telecom, [string[]]$Audio)
    $telecomText = @($Telecom) -join "`n"
    if ([string]::IsNullOrWhiteSpace($telecomText)) { return 'dumpsys telecom gave nothing' }
    $current = ($telecomText -split 'mCalls:', 2)[-1]
    $current = ($current -split 'mCallAudioManager:', 2)[0]
    if ($current -match 'TC@') { return 'a call is live' }
    $modes = @([regex]::Matches((@($Audio) -join "`n"), 'mAudioModeOwner.*?mMode=(\d+)') | ForEach-Object { $_.Groups[1].Value })
    if ($modes.Count -eq 0) {
        if ($Serial -like 'emulator-*') { return $null }
        return 'dumpsys audio named no audio mode'
    }
    if ($modes[-1] -ne '0') { return "audio mode $($modes[-1]), a call or ringing" }
    $null
}

function Select-WalkGridPin {
    <#
    .SYNOPSIS
        The first pin of a home feed dump that sits whole between the header and the bottom bar,
        with its overflow button inside it and neither its centre nor that button under a banner:
        the points to hold and to tap. $null when no pin qualifies.
    #>
    param([string]$Xml, [int]$Height, [string]$Package = 'com.pinterest')
    $nodes = @(Get-WalkNodes $Xml | Where-Object { $_.Package -ceq $Package })
    $header = @($nodes | Where-Object { $_.Id -ceq 'home_feed_greeting_header_view' })
    $bar = @($nodes | Where-Object { $_.Id -ceq 'bottom_nav_bar' })
    $top = if ($header.Count) { $header[0].Bottom } else { [int]($Height * 0.1) }
    $bottom = if ($bar.Count) { $bar[0].Top } else { [int]($Height * 0.9) }
    $covers = @($nodes | Where-Object { ($_.Id -ceq 'upsell_view' -or $_.Id -clike 'bannerOverlay*') -and $_.Right -gt $_.Left -and $_.Bottom -gt $_.Top })
    foreach ($pin in @($nodes | Where-Object { $_.Id -ceq 'pin_rep_id' })) {
        if ($pin.Top -lt $top -or $pin.Bottom -gt $bottom) { continue }
        $menu = @($nodes | Where-Object { $_.Id -ceq 'pin_overflow_action_id' -and $_.Left -ge $pin.Left -and $_.Right -le $pin.Right -and
                $_.Top -ge $pin.Top -and $_.Bottom -le $pin.Bottom })
        if ($menu.Count -eq 0) { continue }
        $hidden = $false
        foreach ($cover in $covers) {
            foreach ($point in @($pin, $menu[0])) {
                if ($point.X -ge $cover.Left -and $point.X -le $cover.Right -and $point.Y -ge $cover.Top -and $point.Y -le $cover.Bottom) { $hidden = $true }
            }
        }
        if ($hidden) { continue }
        return [pscustomobject]@{ X = $pin.X; Y = $pin.Y; MenuX = $menu[0].X; MenuY = $menu[0].Y }
    }
    $null
}

function Get-WalkScrimPoint {
    <#
    .SYNOPSIS
        A point on the long-press menu's backdrop for a touch that closes the menu, which stays
        open after the hold is cancelled and lets Back through to the home feed, so Back leaves
        Pinterest. The menu's buttons ring the finger, and the dump can't place them (each one's
        bounds run to the screen's bottom right corner), so the point is the middle of the
        screen's width in whichever half is the far one from -HoldY, clear of the bars.
    #>
    param([int]$HoldY, [int]$Width, [int]$Height)
    $y = if ($HoldY -le $Height / 2) { 0.75 } else { 0.25 }
    [pscustomobject]@{ X = [int]($Width / 2); Y = [int]($Height * $y) }
}

function ConvertFrom-WalkExitInfo {
    <#
    .SYNOPSIS
        The records of dumpsys activity exit-info <package>: each process exit with its time, pid,
        uids, user, process name, reason, subreason, importance and description. Key, the
        timestamp and pid together, tells one record from another across two dumps. A record whose
        timestamp line doesn't read comes back with no Time, which fails the walk, keyed by its
        own lines.
    #>
    param([string]$Text)
    $record = $null
    $finish = {
        if (-not $record.Key) { $record.Key = 'unread/' + ($record.Lines -join '|') }
        $record.Remove('Lines')
        [pscustomobject]$record
    }
    foreach ($line in @($Text -split "`r?`n")) {
        if ($line -match '^\s*ApplicationExitInfo #\d+:') {
            if ($record) { & $finish }
            $record = [ordered]@{ Key = $null; Timestamp = ''; Time = $null; ProcessId = ''; Lines = [Collections.Generic.List[string]]::new() }
            continue
        }
        if (-not $record) { continue }
        if ($line.Trim()) { $record.Lines.Add($line.Trim()) }
        if ($line -match '^\s*timestamp=(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d\.\d{3}) pid=(\d+) realUid=(\d+) packageUid=(\d+)\b.*\buser=(\d+)') {
            $record.Timestamp = $Matches[1]
            $record.Time = [datetime]::ParseExact($Matches[1], 'yyyy-MM-dd HH:mm:ss.fff', [Globalization.CultureInfo]::InvariantCulture)
            $record.ProcessId = $Matches[2]; $record.RealUid = [long]$Matches[3]; $record.PackageUid = [long]$Matches[4]
            $record.User = [long]$Matches[5]; $record.Key = "$($Matches[1])/$($Matches[2])"
        } elseif ($line -match '^\s*timestamp=.*?\bpid=(\d+)') {
            $record.ProcessId = $Matches[1]
        } elseif ($line -match '^\s*process=(\S+) reason=(\d+) \(((?:[^()]|\([^()]*\))*)\) subreason=(\d+) \(((?:[^()]|\([^()]*\))*)\)') {
            # Crash reasons nest a pair of parentheses: reason=4 (APP CRASH(EXCEPTION)).
            $record.Process = $Matches[1]; $record.Reason = [long]$Matches[2]; $record.ReasonText = $Matches[3]
            $record.Subreason = [long]$Matches[4]; $record.SubreasonText = $Matches[5]
        } elseif ($line -match '^\s*importance=(\d+)\b.*?\bdescription=(.*?)(?:\s+state=.*)?$') {
            $record.Importance = [long]$Matches[1]
            $record.Description = if ($Matches[2] -ceq 'null') { '' } else { $Matches[2] }
        }
    }
    if ($record) { & $finish }
}

function Get-WalkAnrLines {
    <#
    .SYNOPSIS
        The event log's am_anr lines (logcat -b events -v epoch) for Pinterest or one of its :name
        processes in -User at or after -Since, device epoch seconds. An am_anr line opens with the
        user: [user,pid,process,flags,reason].
    #>
    param([string[]]$Lines, [long]$Since, [string]$Package = 'com.pinterest', [int]$User = 0)
    $name = [regex]::Escape($Package) + '(?::[\w.-]+)?'
    foreach ($line in @($Lines)) {
        if ($line -notmatch '^\s*(\d+)\.\d+\s' -or [long]$Matches[1] -lt $Since) { continue }
        if ($line -match "\bam_anr\s*:\s*\[$User,\d+,$name,") { $line }
    }
}

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
        crash, one from before the walk, and one whose pid is in -OtherUserPids (the pids the exit
        records give another user, a work profile or a clone) are left out. The pid comes from the
        line itself: "PID: n" on a Java crash, "pid: n" on a native one.
    #>
    param([string[]]$Lines, [long]$Since, [string]$Package = 'com.pinterest', [string[]]$OtherUserPids = @())
    $current = $false
    $name = [regex]::Escape($Package) + '(?::[\w.-]+)?(?![\w.:-])'
    $others = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($id in @($OtherUserPids | Where-Object { $_ })) { [void]$others.Add([string]$id) }
    foreach ($line in @($Lines)) {
        if ($line -match '^\s*(\d+)\.\d+\s') { $current = [long]$Matches[1] -ge $Since }
        if (-not $current) { continue }
        if ($line -notmatch "Process:\s*$name" -and $line -notmatch ">>>\s*$name\s*<<<") { continue }
        if ($line -cmatch '\b(?:PID|pid):\s*(\d+)' -and $others.Contains($Matches[1])) { continue }
        $line
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

function Find-WalkSwitch {
    <#
    .SYNOPSIS
        The switch row whose title is exactly -Title in a uiautomator dump: the title's nearest
        checkable ancestor, with its checked state and the centre of its bounds. $null when no
        title, or more than one, says -Title, or the title isn't in a switch row.
    #>
    param([string]$Xml, [string]$Title, [string]$Package = 'com.pinterest')
    if ([string]::IsNullOrWhiteSpace($Xml) -or $Xml -notmatch '<hierarchy') { return $null }
    $document = [xml]$Xml
    $titles = @($document.SelectNodes('//node') |
        Where-Object { $_.GetAttribute('package') -ceq $Package -and $_.GetAttribute('text') -ceq $Title })
    if ($titles.Count -ne 1) { return $null }
    $row = $titles[0].SelectSingleNode("ancestor::node[@checkable='true'][1]")
    if (-not $row -or $row.GetAttribute('bounds') -notmatch '^\[(\d+),(\d+)\]\[(\d+),(\d+)\]$') { return $null }
    [pscustomobject]@{
        Checked = $row.GetAttribute('checked') -ceq 'true'
        X = [int](([int]$Matches[1] + [int]$Matches[3]) / 2); Y = [int](([int]$Matches[2] + [int]$Matches[4]) / 2)
    }
}

function Find-WalkButton {
    <#
    .SYNOPSIS
        The centre of the one node whose content description is exactly -Description in a
        uiautomator dump, for a button that carries no text. $null when there isn't exactly one.
    #>
    param([string]$Xml, [string]$Description, [string]$Package = 'com.pinterest')
    if ([string]::IsNullOrWhiteSpace($Xml) -or $Xml -notmatch '<hierarchy') { return $null }
    $document = [xml]$Xml
    $buttons = @($document.SelectNodes('//node') |
        Where-Object { $_.GetAttribute('package') -ceq $Package -and $_.GetAttribute('content-desc') -ceq $Description })
    if ($buttons.Count -ne 1 -or $buttons[0].GetAttribute('bounds') -notmatch '^\[(\d+),(\d+)\]\[(\d+),(\d+)\]$') { return $null }
    [pscustomobject]@{ X = [int](([int]$Matches[1] + [int]$Matches[3]) / 2); Y = [int](([int]$Matches[2] + [int]$Matches[4]) / 2) }
}

function Read-WalkHookReport {
    <#
    .SYNOPSIS
        The [HOOK STATUS] and [PATCHES] sections of an English diagnostics report. Status holds
        each family's counts by name (a family whose hook never ran has no line there), Patches
        each family's switches as saved, as key = 'on', 'off' or a count.
    #>
    param([string]$Text)
    $status = @{}; $patches = @{}; $notInBuild = [Collections.Generic.List[string]]::new()
    $paused = [Collections.Generic.List[string]]::new()
    $sections = [Collections.Generic.HashSet[string]]::new()
    $section = $null
    foreach ($line in @($Text -split "`r?`n")) {
        if ($line -match '^\[([A-Z][A-Z -]*)\]\s*$') { $section = $Matches[1]; [void]$sections.Add($section); continue }
        if ($section -ceq 'HOOK STATUS' -and $line -match ('^(?<family>[^:]+): invoked (?<invoked>\d+), (?<found>\d+) found, ' +
                '(?:(?<ambiguous>\d+) ambiguous, )?(?<missing>\d+) missing(?<rest>.*)$')) {
            $parts = $Matches
            $first = if ($parts.rest -match '\. First (?:missing|ambiguous): (.+?)(?:\. Counted: .*)?$') { $Matches[1] } else { '' }
            $status[$parts.family] = [pscustomobject]@{
                Invoked = [int]$parts.invoked; Found = [int]$parts.found
                Ambiguous = if ($parts.ambiguous) { [int]$parts.ambiguous } else { 0 }
                Missing = [int]$parts.missing; First = $first
            }
        } elseif ($section -ceq 'PATCHES') {
            if ($line -match '^not in this build: (.+)$') {
                foreach ($name in $Matches[1] -split ', ') { $notInBuild.Add($name.Trim()) }
            } elseif ($line -match '^(?<family>.+?): (?<state>on|disabled by its switch|disabled while paused) \((?:saved )?(?<keys>[^)]*)\)') {
                $keys = @{}
                foreach ($pair in [regex]::Matches($Matches.keys, '(\w+)=(\w+)')) { $keys[$pair.Groups[1].Value] = $pair.Groups[2].Value }
                $patches[$Matches.family] = $keys
                if ($Matches.state -ceq 'disabled while paused') { $paused.Add($Matches.family) }
            } elseif ($line -match '^(?<family>.+?): no switch, ') {
                $patches[$Matches.family] = @{}
            }
        }
    }
    [pscustomobject]@{
        HasStatus = $sections.Contains('HOOK STATUS'); HasPatches = $sections.Contains('PATCHES')
        Status = $status; Patches = $patches; NotInBuild = @($notInBuild); Paused = @($paused)
    }
}

function Resolve-WalkHooks {
    <#
    .SYNOPSIS
        A verdict for every hook family: pass or fail for each one in -Families whose case opened
        and whose switch the walk turned on, and not exercised for the rest, those the map leaves
        out included. Without a -Report every family is not exercised.
    #>
    param([object[]]$Families = @(), $Report, [string[]]$Opened = @(), [string[]]$SwitchedOn = @())
    $mapped = [Collections.Generic.HashSet[string]]::new()
    foreach ($entry in @($Families)) {
        [void]$mapped.Add($entry.Family)
        $counts = if ($Report) { $Report.Status[$entry.Family] } else { $null }
        $verdict = [ordered]@{
            family = $entry.Family; case = $entry.Case; verdict = 'not exercised'
            invoked = if ($counts) { $counts.Invoked } else { 0 }
            missing = if ($counts) { $counts.Missing } else { 0 }
            ambiguous = if ($counts) { $counts.Ambiguous } else { 0 }
            detail = ''
        }
        $where = switch -CaseSensitive ($entry.Case) {
            'home' { 'the home feed' } 'inbox' { 'the Inbox' } 'pin' { 'the pin' }
            'grid-menu' { "a home feed pin's menu" } 'long-press' { "a home feed pin's long-press menu" }
            'pin-menu' { "the pin's menu" } default { $entry.Case }
        }
        if (-not $Report) { $verdict.detail = 'no diagnostics report to read' }
        elseif (@($Opened) -cnotcontains $entry.Case) { $verdict.detail = "$where didn't open" }
        elseif (@($SwitchedOn) -cnotcontains $entry.Family) { $verdict.detail = "its switch $($entry.Switch) couldn't be turned on" }
        elseif (-not $Report.Patches.ContainsKey($entry.Family)) {
            $verdict.verdict = 'fail'
            $verdict.detail = if (@($Report.NotInBuild) -ccontains $entry.Family) {
                "is listed as not in this build, though the walk turned its switch $($entry.Switch) on"
            } else { "has no line in the report's [PATCHES], though the walk turned its switch $($entry.Switch) on" }
        } elseif (@($Report.Paused) -ccontains $entry.Family) {
            $verdict.verdict = 'fail'; $verdict.detail = 'was disabled because Hush was paused'
        } elseif ($Report.Patches[$entry.Family][$entry.Key] -cne 'on') {
            $verdict.verdict = 'fail'; $verdict.detail = "read its switch $($entry.Key) as off in the report, after the walk turned it on"
        } elseif ($verdict.invoked -eq 0) {
            $verdict.verdict = 'fail'; $verdict.detail = "never ran, with its switch on and $where open"
        } elseif ($verdict.missing -gt 0) {
            $verdict.verdict = 'fail'; $verdict.detail = "missed $($verdict.missing) of its targets (first: $($counts.First))"
        } elseif ($verdict.ambiguous -gt 0) {
            $verdict.verdict = 'fail'; $verdict.detail = "found $($verdict.ambiguous) of its targets more than once (first: $($counts.First))"
        } else {
            $verdict.verdict = 'pass'; $verdict.detail = "ran $($verdict.invoked) times on $where"
        }
        $verdict
    }
    if (-not $Report) { return }
    $others = @($Report.Patches.Keys) + @($Report.NotInBuild) | Where-Object { -not $mapped.Contains($_) } | Sort-Object -Unique
    foreach ($family in $others) {
        $counts = $Report.Status[$family]
        [ordered]@{
            family = $family; case = $null; verdict = 'not exercised'
            invoked = if ($counts) { $counts.Invoked } else { 0 }
            missing = if ($counts) { $counts.Missing } else { 0 }
            ambiguous = if ($counts) { $counts.Ambiguous } else { 0 }
            detail = if (@($Report.NotInBuild) -ccontains $family) { 'not in this build' } else { 'no case of the walk is mapped to it' }
        }
    }
}

function Invoke-WalkApp {
    param(
        [string]$Serial, [string]$Package, [string[]]$Visit, [string[]]$SettingsPages,
        [hashtable]$CaseSwipes = @{}, [object[]]$HookFamilies = @(Get-WalkHookFamilies),
        [bool]$SkipPatch, [bool]$SkipSettings, [int]$SettleSeconds, [string]$OutDir,
        [string]$BuildEvidence, [string[]]$Exclude = @(),
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
        $leaveOut = @($Exclude | ForEach-Object { "$_" -split ',' } | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        if ($leaveOut.Count -gt 0) { $patchArguments.Exclude = [string[]]$leaveOut }
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

    # The cases this walk runs. A canonical case left out keeps it from being a full walk.
    $planVisit = $null
    if ($PSBoundParameters.ContainsKey('Visit')) { $planVisit = [string[]]@($Visit) }
    $planPages = $null
    if ($PSBoundParameters.ContainsKey('SettingsPages')) { $planPages = [string[]]@($SettingsPages) }
    $plan = Resolve-WalkPlan -Visit $planVisit -SettingsPages $planPages -SkipSettings $SkipSettings
    $planned = @{}
    foreach ($case in $plan.Cases) { $planned[$case.Id] = $case }
    if ($plan.LeftOut.Count -gt 0) { Write-Host "[walk] left out of this walk, so it can't be full: $($plan.LeftOut -join ', ')" }
    # The canonical hook families the given map leaves out or maps differently, which keep it
    # from being a full walk too.
    $hooksLeftOut = @(Get-WalkHookShortfall -Families $HookFamilies)
    if ($hooksLeftOut.Count -gt 0) { Write-Host "[walk] hook families not checked as the canonical map has them, so it can't be full: $($hooksLeftOut -join ', ')" }

    $lease = $null
    $problems = [Collections.Generic.List[string]]::new()
    $screens = 0
    $dumpPath = '/sdcard/hushpinterest-walk.xml'
    # The cases that passed, the hook families whose switch is on, the map entries whose switch
    # the walk tapped on, and the route switches it tapped off, all of which it turns back.
    $opened = [Collections.Generic.List[string]]::new()
    $switchedOn = [Collections.Generic.HashSet[string]]::new()
    $flipped = [Collections.Generic.List[object]]::new()
    $routeOff = [Collections.Generic.List[object]]::new()
    $hooks = @()
    $restore = $null
    # Each case's result for the receipt, and the main process the walk follows from its launch.
    $caseResults = [Collections.Generic.List[object]]::new()
    $health = @{ MainPid = $null; FirstPid = $null; Restarts = [Collections.Generic.List[object]]::new() }
    $processEvidence = $null
    try {
        $lease = Enter-HushDeviceLease -Adb $Adb -Serial $Serial -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
        # Ownership is checked on every call. The device identity was bound when the lease was
        # taken and is checked again by the install and at the end.
        $walkAdb = {
            param([string[]]$Arguments)
            Renew-HushDeviceLease $lease
            # Every tap, swipe and key waits out a live call first (two minutes at most, then the
            # walk stops), so nothing lands on a call card. A failed dump is read again, never tapped past.
            if ($Arguments.Count -ge 2 -and $Arguments[0] -eq 'shell' -and $Arguments[1] -eq 'input') {
                $callProblem = $null
                for ($try = 0; $try -lt 24; $try++) {
                    if ($try -gt 0) { Start-Sleep -Seconds 5 }
                    $telecom = Invoke-HushPinterestAdbCommand -Adb $Adb -Arguments @('-s', $Serial, 'shell', 'dumpsys', 'telecom')
                    $audio = Invoke-HushPinterestAdbCommand -Adb $Adb -Arguments @('-s', $Serial, 'shell', 'dumpsys', 'audio')
                    $callProblem = Get-WalkCallProblem -Serial $Serial -Telecom $telecom.Output -Audio $audio.Output
                    if (-not $callProblem) { break }
                    if ($try -eq 0) { Write-Host "[walk] holding input: $callProblem" }
                }
                if ($callProblem) { throw "The walk stopped before an input, since $callProblem for two minutes." }
            }
            Invoke-HushPinterestAdbCommand -Adb $Adb -Arguments (@('-s', $Serial) + $Arguments)
        }
        # A screen that's still moving (a playing video pin) can fail a dump, so a failed one is
        # taken again, twice at most. The old file goes first, so a failure never reads stale nodes.
        $readXml = {
            $xml = ''
            for ($try = 0; $try -lt 3 -and $xml -notmatch '<hierarchy'; $try++) {
                if ($try -gt 0) { Start-Sleep -Seconds 1 }
                [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
                [void](& $walkAdb @('shell', 'uiautomator', 'dump', $dumpPath))
                $xml = (& $walkAdb @('shell', 'cat', $dumpPath)).Output -join "`n"
            }
            [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            $xml
        }
        $readScreen = { @(ConvertFrom-WalkDump (& $readXml)) }
        $inFront = {
            # The resumed-activity line is named differently by Android version: mResumedActivity=
            # on older ones, topResumedActivity= and "ResumedActivity:" on API 36.
            $resumed = @((& $walkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output |
                Where-Object { $_ -match 'ResumedActivity' }) -join ' '
            $resumed -match "\b$([regex]::Escape($Package))/"
        }
        $resumedActivity = { Get-WalkResumedActivity @((& $walkAdb @('shell', 'dumpsys', 'activity', 'activities')).Output) }
        # The device's clock, in the form exit-info prints its timestamps in.
        $deviceTime = {
            $now = ((& $walkAdb @('shell', 'date', '+%Y-%m-%d_%H:%M:%S')).Output -join '').Trim()
            [datetime]::ParseExact($now, 'yyyy-MM-dd_HH:mm:ss', [Globalization.CultureInfo]::InvariantCulture)
        }
        # Its offset from UTC. Exit-info times carry none, so a change during the walk (a daylight
        # saving fall-back) could put an exit before the stop.
        $deviceZone = { ((& $walkAdb @('shell', 'date', '+%z')).Output -join '').Trim() }
        $readExits = { @(ConvertFrom-WalkExitInfo ((& $walkAdb @('shell', 'dumpsys', 'activity', 'exit-info', $Package)).Output -join "`n")) }
        # Every exit record read so far, by key. The device keeps only the newest few per package,
        # so the walk reads them after every case and keeps each one it hasn't seen.
        $exitsSeen = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
        $collectExits = {
            $now = @(& $readExits)
            foreach ($entry in $now) { if (-not $exitsSeen.ContainsKey($entry.Key)) { $exitsSeen[$entry.Key] = $entry } }
            $now
        }
        $mainPids = { @(Get-WalkMainPids -Lines @((& $walkAdb @('shell', 'ps', '-A', '-o', 'PID,UID,NAME')).Output) -Package $Package) }
        # Whether the dump -Xml is -Case's destination: its marks shown, its Absent marks gone, and
        # for a case inside Pinterest its main activity resumed. Answers the failures and the
        # resumed activity.
        $checkAnchor = {
            param($Case, [string]$Xml)
            $marks = @($Case.Marks)
            if ($Case.Family -and $switchedOn.Contains($Case.Family)) { $marks += @($Case.HushMarks) }
            $failures = @(Test-WalkAnchor -Xml $Xml -Marks $marks -Absent @($Case.Absent) -Package $Package)
            $activity = & $resumedActivity
            $where = if ($activity) { "$($activity.Package)/$($activity.Class)" } else { 'nothing' }
            if (-not $activity -or $activity.Package -cne $Package) {
                $failures = @("Pinterest wasn't in front ($where was)") + $failures
            } elseif (@('page', 'settings') -cnotcontains $Case.Kind -and $activity.Class -cne $WalkHomeActivity) {
                $what = if ($activity.Class -ceq $WalkLoginActivity) { "Pinterest's login screen" } else { $activity.Class }
                $failures = @("$what was in front, not Pinterest's main screen") + $failures
            }
            $anchor = @($marks | Where-Object { $_ }) + @($Case.Absent | Where-Object { $_ } | ForEach-Object { "not $_" })
            [pscustomobject]@{ Failures = $failures; Activity = $where; Anchor = $anchor -join ', ' }
        }
        # The main process after -After: the pid the launch started, or a restart or stop that fails
        # the walk.
        $checkHealth = {
            param([string]$After)
            if (-not $health.MainPid) { return }
            $now = @(& $mainPids)
            if ($now -ccontains $health.MainPid) { return }
            $was = $health.MainPid
            $health.MainPid = if ($now.Count) { $now[0] } else { $null }
            $health.Restarts.Add([ordered]@{ after = $After; pid = $was; now = $health.MainPid })
            if ($health.MainPid) { $problems.Add("Pinterest's main process restarted during $After (pid $was, then $($health.MainPid))") }
            else { $problems.Add("Pinterest's main process stopped during $After (pid $was)") }
            Write-Host "[walk] $($problems[$problems.Count - 1])"
        }
        # One case's result, in the receipt's order. A failure is a problem named after the case.
        $record = {
            param($Case, [bool]$Passed, [string]$Activity = '', [string]$Anchor = '', [string]$Implementation = '', [string]$Detail = '')
            $caseResults.Add([ordered]@{
                    id = $Case.Id; kind = $Case.Kind; result = if ($Passed) { 'pass' } else { 'fail' }
                    activity = $Activity; anchor = $Anchor; implementation = $Implementation; detail = $Detail
                })
            if ($Passed) {
                $opened.Add($Case.Id)
                $served = if ($Implementation) { " ($Implementation)" } else { '' }
                Write-Host "[walk] $($Case.Id): reached$served"
            } else {
                $problems.Add("the $($Case.Id) case didn't reach its destination: $Detail")
                Write-Host "[walk] $($Case.Id): $Detail"
            }
            & $checkHealth $Case.Id
            [void](& $collectExits)
        }
        # -Origin's destination with no menu left over it. The long-press menu leaves the home
        # feed's marks in the dump, so the marks of both menus have to be gone as well.
        $menuGone = {
            param($Origin)
            @{ Id = $Origin.Id; Kind = $Origin.Kind; Marks = @($Origin.Marks)
                Absent = @($Origin.Absent | Where-Object { $_ }) + @('id:modal_header_dismiss_bt', 'desc~^(Send|Search image)$') }
        }
        # A read-only menu case: the button at -X,-Y tapped from a fresh dump, the menu read, Back,
        # and its origin's destination read again. No row of the menu is ever tapped.
        $runMenu = {
            param($Case, [int]$X, [int]$Y)
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$X, [string]$Y))
            Start-Sleep -Seconds 2
            $xml = & $readXml
            $seen = & $checkAnchor $Case $xml
            $kind = Get-WalkMenuKind -Xml $xml -Kind 'menu' -Package $Package
            [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Milliseconds 1500
            $back = & $checkAnchor (& $menuGone $planned[$Case.Origin]) (& $readXml)
            $detail = @($seen.Failures) + @($back.Failures | ForEach-Object { "after Back, $_" })
            & $record $Case ($detail.Count -eq 0) $seen.Activity $seen.Anchor $kind ($detail -join '; ')
        }
        # The long-press case. Every hold starts from a fresh dump that shows the home feed with no
        # menu over it and picks the pin to hold from that dump. One shell command holds the pin,
        # dumps the menu while it's held and cancels the touch, so no menu, known or not, takes a
        # row from it. The round menu stays open after that, and Back goes past it and leaves
        # Pinterest, so a menu still showing is closed by a touch on its backdrop, cancelled too.
        $menuShowing = {
            param($Origin, [string]$Xml)
            @(Test-WalkAnchor -Xml $Xml -Absent @($Origin.Absent) -Package $Package | Where-Object { $_ -clike '* still showing' }).Count -gt 0
        }
        $closeMenu = {
            param([int]$HoldY)
            $point = Get-WalkScrimPoint -HoldY $HoldY -Width $width -Height $height
            [void](& $walkAdb @('shell', "input motionevent DOWN $($point.X) $($point.Y); input motionevent CANCEL $($point.X) $($point.Y)"))
            Start-Sleep -Milliseconds 1000
        }
        $runHold = {
            param($Case)
            $origin = & $menuGone $planned[$Case.Origin]
            $xml = ''
            $why = ''
            for ($try = 0; $try -lt 2 -and $xml -notmatch '<hierarchy'; $try++) {
                if ($try -gt 0) { Start-Sleep -Seconds 1 }
                $originXml = & $readXml
                $ready = & $checkAnchor $origin $originXml
                # A hold whose dump failed leaves its menu open, around the pin that try held.
                if ($try -gt 0 -and $ready.Failures.Count -and (& $menuShowing $origin $originXml)) {
                    & $closeMenu $pin.Y
                    $originXml = & $readXml
                    $ready = & $checkAnchor $origin $originXml
                }
                if ($ready.Failures.Count) { $why = "before the hold, $($ready.Failures -join '; ')"; break }
                $pin = Select-WalkGridPin -Xml $originXml -Height $height -Package $Package
                if (-not $pin) { $why = 'the home feed showed no pin whole on screen with its menu button'; break }
                [void](& $walkAdb @('shell', ("rm -f $dumpPath; input motionevent DOWN $($pin.X) $($pin.Y); sleep 1.5; " +
                            "uiautomator dump $dumpPath >/dev/null 2>&1; input motionevent CANCEL $($pin.X) $($pin.Y)")))
                $xml = (& $walkAdb @('shell', 'cat', $dumpPath)).Output -join "`n"
                [void](& $walkAdb @('shell', 'rm', '-f', $dumpPath))
            }
            if ($why) {
                & $record $Case $false '' '' '' $why
                return
            }
            Start-Sleep -Seconds 1
            $seen = & $checkAnchor $Case $xml
            $kind = if ($xml -match '<hierarchy') { Get-WalkMenuKind -Xml $xml -Kind 'hold' -Package $Package } else { '' }
            $afterXml = & $readXml
            $back = & $checkAnchor $origin $afterXml
            if ($back.Failures.Count -and (& $menuShowing $origin $afterXml)) {
                & $closeMenu $pin.Y
                $back = & $checkAnchor $origin (& $readXml)
            }
            $detail = @($seen.Failures) + @($back.Failures | ForEach-Object { "after closing the menu, $_" })
            & $record $Case ($detail.Count -eq 0) $seen.Activity $seen.Anchor $kind ($detail -join '; ')
        }

        [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP'))
        $window = (& $walkAdb @('shell', 'dumpsys', 'window')).Output -join "`n"
        if ($window -match 'isKeyguardShowing=true|mDreamingLockscreen=true') {
            throw "$Serial is locked. Unlock it by hand and walk again; the walk never unlocks a device."
        }
        $size = ((& $walkAdb @('shell', 'wm', 'size')).Output -join ' ')
        $width = 720; $height = 1600
        if ($size -match '(\d+)x(\d+)\s*$') { $width = [int]$Matches[1]; $height = [int]$Matches[2] }

        # One 400 ms swipe down the middle of the screen, from -From to -To as fractions of its height.
        $drag = {
            param([double]$From, [double]$To)
            [void](& $walkAdb @('shell', 'input', 'swipe', [string][int]($width / 2), [string][int]($height * $From),
                [string][int]($width / 2), [string][int]($height * $To), '400'))
            Start-Sleep -Milliseconds 900
        }
        # The settings row whose text is exactly -Row, or the switch titled -Switch, brought in from
        # the screen's edges: on down the list first, then back up it, with a fresh dump after every
        # swipe. A swipe that moved nothing is the list's end that way, so each leg goes as far as
        # the page does, up to -Swipes (twice that back up). Only the Hush settings are on screen
        # while this runs.
        $seek = {
            param([string]$Row, [string]$Switch, [int]$Swipes = 6)
            foreach ($leg in @(@{ From = 0.75; To = 0.35; Tries = $Swipes }, @{ From = 0.35; To = 0.75; Tries = $Swipes * 2 })) {
                $low = $null
                $lastShown = $null
                for ($try = 0; ; $try++) {
                    $xml = & $readXml
                    $hit = if ($Switch) { Find-WalkSwitch $xml $Switch $Package } else { Find-WalkRow (ConvertFrom-WalkDump $xml) $Row $Package }
                    if ($hit -and $hit.Y -ge $height * 0.12 -and $hit.Y -le $height * 0.85) { return $hit }
                    # A low row the last drag left where it was is the end of the list: the last
                    # row of a long page can't come up past the line, and the dump has it on screen.
                    if ($hit -and $low -and $hit.Y -gt $height * 0.85 -and $hit.Y -eq $low.Y) { return $hit }
                    $low = if ($hit -and $hit.Y -gt $height * 0.85) { $hit } else { $null }
                    $shown = @(ConvertFrom-WalkDump $xml | ForEach-Object { "$($_.Text)@$($_.Y)" }) -join "`n"
                    if (-not $hit -and $null -ne $lastShown -and $shown -ceq $lastShown) { break }
                    $lastShown = $shown
                    if ($try -ge $leg.Tries) { break }
                    if ($hit -and $hit.Y -gt $height * 0.85) { & $drag 0.6 0.45 }
                    elseif ($hit) { & $drag 0.45 0.6 }
                    else { & $drag $leg.From $leg.To }
                }
            }
            return $null
        }
        # The Hush settings list, opened over the home feed through App info's intent.
        $openSettings = {
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity"))
            Start-Sleep -Seconds $SettleSeconds
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.APPLICATION_PREFERENCES', '-p', $Package))
            Start-Sleep -Seconds $SettleSeconds
            [bool](Find-WalkRow (& $readScreen) $WalkSettingsHome $Package)
        }
        # A settings page, from the list: its row tapped, then its title showing and the list gone.
        $openPage = {
            param([string]$Page)
            $row = & $seek -Row $Page
            if (-not $row) { return $false }
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
            Start-Sleep -Seconds 2
            $nodes = & $readScreen
            [bool]((Find-WalkRow $nodes $Page $Package) -and -not (Find-WalkRow $nodes $WalkSettingsHome $Package) -and (& $inFront))
        }
        $backToList = {
            [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
            Start-Sleep -Seconds 2
            [bool](Find-WalkRow (& $readScreen) $WalkSettingsHome $Package)
        }
        # Sets the switch titled -Title on the open page -Page to -On. Tapped says the walk touched
        # it, so it gets turned back; Lost, that the page wasn't in front after the tap.
        $setSwitch = {
            param([string]$Page, [string]$Title, [bool]$On)
            # Interface holds up to 75 rows, past 8 swipes on a tall phone (2026-11-25, S25).
            $found = & $seek -Switch $Title -Swipes 40
            if (-not $found) { return [pscustomobject]@{ Found = $false; Tapped = $false; Lost = $false; On = $false } }
            if ($found.Checked -eq $On) { return [pscustomobject]@{ Found = $true; Tapped = $false; Lost = $false; On = $found.Checked } }
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$found.X, [string]$found.Y))
            Start-Sleep -Milliseconds 1500
            if (-not (Find-WalkRow (& $readScreen) $Page $Package)) {
                return [pscustomobject]@{ Found = $true; Tapped = $true; Lost = $true; On = -not $On }
            }
            $after = & $seek -Switch $Title -Swipes 3
            [pscustomobject]@{ Found = $true; Tapped = $true; Lost = $false; On = [bool]$after -and $after.Checked }
        }
        # Every switch in -Entries set to -On, a page at a time. A switch this taps joins -Tapped
        # right away, so a stop partway still turns it back; a switch that won't take is a problem
        # named after its family. A route switch never counts as a hook family switched on.
        $setSwitches = {
            param([object[]]$Entries, [bool]$On, $Tapped)
            $word = if ($On) { 'on' } else { 'off' }
            foreach ($page in @($Entries | ForEach-Object { $_.Page } | Select-Object -Unique)) {
                if (-not (& $openPage $page)) {
                    $problems.Add("the settings page $page would not open to turn its switches $word")
                    if (& $backToList) { continue } else { break }
                }
                $lost = $false
                foreach ($entry in @($Entries | Where-Object { $_.Page -ceq $page })) {
                    $state = & $setSwitch $page $entry.Switch $On
                    if ($state.Tapped -and $null -ne $Tapped) { $Tapped.Add($entry) }
                    if (-not $state.Found) { $problems.Add("$($entry.Family): the switch $($entry.Switch) isn't on the $page page") }
                    elseif ($state.Lost) { $problems.Add("$($entry.Family): after its switch $($entry.Switch) was tapped, the $page page wasn't in front"); $lost = $true; break }
                    elseif ($state.On -ne $On) { $problems.Add("$($entry.Family): the switch $($entry.Switch) on the $page page wouldn't turn $word") }
                    elseif ($On -and -not $entry.Route) { [void]$switchedOn.Add($entry.Family) }
                }
                if (-not (& $backToList) -or $lost) {
                    $problems.Add("Back from $page didn't return to the settings list while its switches were turned $word")
                    break
                }
            }
        }
        # Save full report from Pause, backup and diagnostics, copied to the output folder, and the
        # phone's copy deleted. Answers the local path or the problem that stopped it.
        $exportReport = {
            if (-not (& $openSettings)) { return [pscustomobject]@{ Path = $null; Problem = 'the Hush settings would not open to export the diagnostics report' } }
            if (-not (& $openPage 'Pause, backup and diagnostics')) {
                return [pscustomobject]@{ Path = $null; Problem = 'Pause, backup and diagnostics would not open to export the diagnostics report' }
            }
            $row = & $seek -Row 'Export diagnostic report'
            if (-not $row) { return [pscustomobject]@{ Path = $null; Problem = 'Pause, backup and diagnostics has no Export diagnostic report row' } }
            $listing = {
                @((& $walkAdb @('shell', 'ls', '-1', $WalkReportFolder)).Output | ForEach-Object { $_.Trim() } |
                    Where-Object { $_ -match '^morphe-diagnostics-[\w.-]+\.txt$' })
            }
            $before = @(& $listing)
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
            Start-Sleep -Seconds 2
            $save = Find-WalkRow (& $readScreen) 'Save full report' $Package
            if (-not $save) {
                [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
                return [pscustomobject]@{ Path = $null; Problem = 'Export diagnostic report offered no Save full report' }
            }
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$save.X, [string]$save.Y))
            $new = @()
            for ($wait = 0; $wait -lt 10 -and $new.Count -eq 0; $wait++) {
                Start-Sleep -Seconds 2
                $new = @(& $listing | Where-Object { $before -cnotcontains $_ })
            }
            # Every report this saved comes off the phone, its media store row with it so it doesn't
            # linger in Downloads. Answers a problem when one is still there.
            $dropNew = {
                foreach ($name in @($new)) {
                    [void](& $walkAdb @('shell', "content delete --uri content://media/external/file --where _display_name=\'$name\'"))
                    [void](& $walkAdb @('shell', 'rm', '-f', "$WalkReportFolder/$name"))
                }
                $left = @(& $listing | Where-Object { @($new) -ccontains $_ })
                if ($left.Count -gt 0) { "the diagnostics report $($left -join ', ') is still in $WalkReportFolder after its delete" }
            }
            if ($new.Count -ne 1) {
                $problem = "Save full report left $($new.Count) new reports in $WalkReportFolder"
                $left = & $dropNew
                if ($left) { $problem = "$problem, and $left" }
                return [pscustomobject]@{ Path = $null; Problem = $problem }
            }
            $local = Join-Path $OutDir 'diagnostics.txt'
            $pulled = $null
            $left = $null
            try {
                if (Test-Path -LiteralPath $local) { Remove-Item -LiteralPath $local -Force }
                $pulled = & $walkAdb @('pull', "$WalkReportFolder/$($new[0])", $local)
            } finally {
                $left = & $dropNew
            }
            [void](& $backToList)
            if ($left) { return [pscustomobject]@{ Path = $null; Problem = $left } }
            if ($pulled.ExitCode -ne 0 -or -not (Test-Path -LiteralPath $local -PathType Leaf)) {
                return [pscustomobject]@{ Path = $null; Problem = "the diagnostics report wouldn't copy off the phone" }
            }
            Write-Host "[walk] saved the diagnostics report to $local and deleted the phone's copy"
            [pscustomobject]@{ Path = $local; Problem = $null }
        }
        # The switches the walk turned on, turned back off, and the route switches it turned off,
        # turned back on. Runs once, from the walk's end or from the finally when something stopped it.
        $restore = {
            if ($flipped.Count -eq 0 -and $routeOff.Count -eq 0) { return }
            Write-Host "[walk] putting back the $($flipped.Count + $routeOff.Count) switches it changed"
            $known = $problems.Count
            try {
                if (& $openSettings) {
                    if ($flipped.Count -gt 0) { [void](& $setSwitches ([object[]]@($flipped)) $false $null) }
                    if ($routeOff.Count -gt 0) { [void](& $setSwitches ([object[]]@($routeOff)) $true $null) }
                }
                else { $problems.Add('the Hush settings would not open to put the walk''s switches back') }
                [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
                Start-Sleep -Seconds 1
            } catch {
                $problems.Add("turning the walk's switches back off stopped: $($_.Exception.Message)")
            }
            for ($i = $known; $i -lt $problems.Count; $i++) { Write-Host "[walk] $($problems[$i])" }
            $flipped.Clear()
            $routeOff.Clear()
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
        $checkHooks = -not $SkipSettings -and @($HookFamilies).Count -gt 0
        if ($checkHooks) {
            Write-Host "[walk] turning on the switches of $(@($HookFamilies).Count) hook families"
            if (& $openSettings) { [void](& $setSwitches $HookFamilies $true $flipped) }
            else { $problems.Add('the Hush settings would not open to turn the hook families'' switches on') }
            Write-Host "[walk] $($switchedOn.Count) switches on, $($flipped.Count) of them turned on by the walk"
        }
        if (-not $SkipSettings) {
            $routes = @(Get-WalkRouteSwitches)
            if (& $openSettings) { [void](& $setSwitches $routes $false $routeOff) }
            else { $problems.Add('the Hush settings would not open to turn off the switches that hide the walk''s route') }
            Write-Host "[walk] $($routeOff.Count) of $($routes.Count) switches hiding the walk's route turned off for the walk"
        }
        # The restart also clears the hook counts, so the report counts only what the cases reach.
        # Every process running just before it, so an exit the stop caused is told from a later
        # one, and Pinterest's exit records just after it, the baseline nothing older gets past.
        # Pinterest is started first if it isn't running, so the stop leaves its own exit record.
        if (@(& $mainPids).Count -eq 0) {
            [void](& $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity"))
            Start-Sleep -Seconds $SettleSeconds
        }
        $stoppedAt = & $deviceTime
        $zoneAtStop = & $deviceZone
        $runningBefore = @((& $walkAdb @('shell', 'ps', '-A', '-o', 'PID')).Output | ForEach-Object { "$_".Trim() } | Where-Object { $_ -match '^\d+$' })
        [void](& $walkAdb @('shell', 'am', 'force-stop', $Package))
        Start-Sleep -Seconds 2
        $baseline = @(& $collectExits)
        Write-Host "[walk] stopped Pinterest at $($stoppedAt.ToString('yyyy-MM-dd HH:mm:ss')) with $($runningBefore.Count) processes running; $($baseline.Count) exit records before the walk"
        $launch = & $walkAdb @('shell', 'am', 'start', '-W', '-n', "$Package/$WalkMainActivity")
        Start-Sleep -Seconds ($SettleSeconds * 2)
        $homeCase = $planned['home']
        $launched = ($launch.Output -join "`n") -match '(?m)^Status:\s*ok\s*$'
        $health.MainPid = @(& $mainPids)[0]
        $health.FirstPid = $health.MainPid
        $homeXml = & $readXml
        $seen = & $checkAnchor $homeCase $homeXml
        $detail = @($seen.Failures)
        if (-not $launched) { $detail = @('the launch didn''t report Status: ok') + $detail }
        if (-not $health.MainPid) { $detail += "Pinterest's main process wasn't running" }
        & $record $homeCase ($detail.Count -eq 0) $seen.Activity $seen.Anchor '' ($detail -join '; ')

        # A home feed pin's menus, both read-only, while the feed is still at its top. The menu's
        # pin comes from the launch's dump; the hold takes its own from a fresh one.
        foreach ($id in @('grid-menu', 'long-press')) {
            if (-not $planned.ContainsKey($id)) { continue }
            $gridPin = if ($id -ceq 'grid-menu' -and $opened -ccontains 'home') { Select-WalkGridPin -Xml $homeXml -Height $height -Package $Package } else { $null }
            if ($opened -cnotcontains 'home') { & $record $planned[$id] $false '' '' '' 'the home feed didn''t open' }
            elseif ($id -ceq 'long-press') { & $runHold $planned[$id] }
            elseif (-not $gridPin) { & $record $planned[$id] $false '' '' '' 'the home feed showed no pin whole on screen with its menu button' }
            else { & $runMenu $planned[$id] $gridPin.MenuX $gridPin.MenuY }
        }

        foreach ($case in @($plan.Cases | Where-Object { $_.Kind -ceq 'link' })) {
            $start = & $walkAdb @('shell', 'am', 'start', '-W', '-a', 'android.intent.action.VIEW', '-d', "'$($case.Target)'", '-p', $Package)
            Start-Sleep -Seconds $SettleSeconds
            $ok = ($start.Output -join "`n") -match '(?m)^Status:\s*ok\s*$'
            $xml = & $readXml
            $seen = & $checkAnchor $case $xml
            $detail = @($seen.Failures)
            if (-not $ok) { $detail = @("$($case.Target) didn't report Status: ok") + $detail }
            & $record $case ($detail.Count -eq 0) $seen.Activity $seen.Anchor '' ($detail -join '; ')
            if ($detail.Count) { continue }
            # The pin's own overflow menu, read before the swipes move its button off screen.
            $menuCase = @($plan.Cases | Where-Object { $_.Kind -ceq 'menu' -and $_.Origin -ceq $case.Id })
            foreach ($menu in $menuCase) {
                $button = @(Get-WalkNodes $xml | Where-Object { $_.Package -ceq $Package -and $_.Id -ceq 'overflow_button' })
                if ($button.Count -ne 1) { & $record $menu $false '' '' '' "the $($case.Id) showed $($button.Count) overflow buttons, not one" }
                else { & $runMenu $menu $button[0].X $button[0].Y }
            }
            $swipes = if ($CaseSwipes -and $CaseSwipes.ContainsKey($case.Id)) { [int]$CaseSwipes[$case.Id] } else { 0 }
            # What comes into view loads from the network, so each swipe gets time to bind it.
            for ($done = 0; $done -lt $swipes -and (& $inFront); $done++) { & $drag 0.75 0.35; Start-Sleep -Milliseconds 600 }
            if ($swipes -gt 0) { Write-Host "[walk] swiped $($case.Id) up $done times" }
        }

        # The Inbox, from the home feed. Each tap is on a button read from a dump taken after the
        # last change of screen, and the Inbox itself is only read: it lists suggested people.
        $inboxCase = $planned['inbox']
        $inboxStop = $null
        $homeTab = Find-WalkButton (& $readXml) 'Home' $Package
        if (-not $homeTab) { $inboxStop = 'the bottom bar''s Home button wasn''t on screen' }
        elseif (-not (& $inFront)) { $inboxStop = 'Pinterest wasn''t in front' }
        else {
            [void](& $walkAdb @('shell', 'input', 'tap', [string]$homeTab.X, [string]$homeTab.Y))
            Start-Sleep -Seconds $SettleSeconds
            $inboxButton = Find-WalkButton (& $readXml) 'Inbox' $Package
            if (-not $inboxButton) { $inboxStop = 'the home feed showed no Inbox button' }
            elseif (-not (& $inFront)) { $inboxStop = 'Pinterest wasn''t in front' }
            else {
                [void](& $walkAdb @('shell', 'input', 'tap', [string]$inboxButton.X, [string]$inboxButton.Y))
                Start-Sleep -Seconds $SettleSeconds
            }
        }
        if ($inboxStop) { & $record $inboxCase $false '' '' '' $inboxStop }
        else {
            $seen = & $checkAnchor $inboxCase (& $readXml)
            & $record $inboxCase ($seen.Failures.Count -eq 0) $seen.Activity $seen.Anchor '' (@($seen.Failures) -join '; ')
            if ($seen.Failures.Count -eq 0) {
                [void](& $walkAdb @('shell', 'input', 'keyevent', 'KEYCODE_BACK'))
                Start-Sleep -Seconds 1
            }
        }

        $full = $null -ne $build -and $plan.LeftOut.Count -eq 0 -and $hooksLeftOut.Count -eq 0
        $settingsCase = $planned['settings']
        if ($settingsCase) {
            $listOpen = & $openSettings
            $seen = & $checkAnchor $settingsCase (& $readXml)
            $detail = @($seen.Failures)
            if (-not $listOpen -and $detail.Count -eq 0) { $detail = @('App info''s intent didn''t show the settings list') }
            & $record $settingsCase ($detail.Count -eq 0) $seen.Activity $seen.Anchor '' ($detail -join '; ')
            if ($detail.Count -eq 0) {
                $nodes = & $readScreen
                foreach ($pageCase in @($plan.Cases | Where-Object { $_.Kind -ceq 'page' })) {
                    $page = $pageCase.Target
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
                        & $record $pageCase $false '' '' '' "no row titled $page in the settings list"
                        continue
                    }
                    [void](& $walkAdb @('shell', 'input', 'tap', [string]$row.X, [string]$row.Y))
                    Start-Sleep -Seconds 2
                    $seen = & $checkAnchor $pageCase (& $readXml)
                    & $record $pageCase ($seen.Failures.Count -eq 0) $seen.Activity $seen.Anchor '' (@($seen.Failures) -join '; ')
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

        if ($checkHooks) {
            $export = & $exportReport
            $report = $null
            if ($export.Problem) {
                $problems.Add("$($export.Problem), so the hook families weren't checked")
            } else {
                $report = Read-WalkHookReport ([IO.File]::ReadAllText($export.Path))
                if (-not $report.HasStatus -or -not $report.HasPatches) {
                    $problems.Add('the diagnostics report has no [HOOK STATUS] or no [PATCHES] section, so the hook families weren''t checked')
                    $report = $null
                }
            }
            $hooks = @(Resolve-WalkHooks -Families $HookFamilies -Report $report -Opened ([string[]]$opened) `
                -SwitchedOn ([string[]]@($switchedOn)))
            $failed = @($hooks | Where-Object { $_.verdict -ceq 'fail' })
            foreach ($hook in $failed) { $problems.Add("$($hook.family) $($hook.detail)") }
            Write-Host ("[walk] hook families: $(@($hooks | Where-Object { $_.verdict -ceq 'pass' }).Count) passed, $($failed.Count) failed, " +
                "$(@($hooks | Where-Object { $_.verdict -ceq 'not exercised' }).Count) not exercised")
            foreach ($hook in $hooks) { Write-Host "[walk]   $($hook.verdict): $($hook.family), $($hook.detail)" }
        }
        # A full walk passes every family the map gives it; one not exercised is no pass.
        $full = $full -and $checkHooks -and @($hooks | Where-Object { $null -ne $_.case -and $_.verdict -cne 'pass' }).Count -eq 0
        & $restore

        & $checkHealth 'the hook check and the switches turned back'
        $alive = @(& $mainPids).Count -gt 0
        if (-not $alive) { $problems.Add('Pinterest was no longer running when the walk ended') }

        # Every exit record the walk read since the stop, classed, the crash buffer's Pinterest
        # crashes in user 0 and the ANRs the event log saw since the start.
        $zoneAtEnd = & $deviceZone
        if ($zoneAtEnd -cne $zoneAtStop -or $zoneAtStop -cnotmatch '\A[+-]\d{4}\z') {
            $problems.Add("the device's offset from UTC went from '$zoneAtStop' to '$zoneAtEnd' during the walk, so its exit times can't be held to the stop")
        }
        [void](& $collectExits)
        $exits = @(Resolve-WalkExits -Records @($exitsSeen.Values | Sort-Object Time -Descending) -RunningBefore $runningBefore -StoppedAt $stoppedAt -Package $Package)
        $otherUserPids = [string[]]@($exits | Where-Object { $_.Class -ceq 'unrelated' } | ForEach-Object { [string]$_.ProcessId })
        $crashLines = @((& $walkAdb @('logcat', '-b', 'crash', '-d', '-v', 'epoch')).Output)
        $fatal = @(Get-WalkCrashLines -Lines $crashLines -Since $startedEpoch -Package $Package -OtherUserPids $otherUserPids)
        if ($fatal.Count -gt 0) {
            [IO.File]::WriteAllLines((Join-Path $OutDir 'crash-buffer.txt'), [string[]]$crashLines)
            $problems.Add("Pinterest crashed during the walk: $($fatal[0].Trim())")
        }
        foreach ($exit in @($exits | Where-Object { $_.Class -ceq 'failure' })) {
            if ($null -eq $exit.Time) {
                $problems.Add("an exit record of Pinterest's didn't read, so it can't be told from a crash: $($exit.Key.Substring(7))")
                continue
            }
            $what =if ($exit.Process -ceq $Package) { "Pinterest's main process" } else { "Pinterest's $($exit.Process)" }
            $why = "$($exit.Reason) ($($exit.ReasonText)), subreason $($exit.Subreason) ($($exit.SubreasonText))"
            if ($exit.Description) { $why = "$why, $($exit.Description)" }
            $problems.Add("$what (pid $($exit.ProcessId)) exited at $($exit.Timestamp): reason $why")
        }
        $eventLines = @((& $walkAdb @('logcat', '-b', 'events', '-d', '-v', 'epoch')).Output)
        $anrs = @(Get-WalkAnrLines -Lines $eventLines -Since $startedEpoch -Package $Package)
        if ($anrs.Count -gt 0) {
            [IO.File]::WriteAllLines((Join-Path $OutDir 'events-buffer.txt'), [string[]]$eventLines)
            foreach ($line in $anrs) { $problems.Add("Pinterest stopped responding during the walk: $($line.Trim())") }
        }
        $newest = if ($baseline.Count) { $baseline[0] } else { $null }
        $processEvidence = [ordered]@{
            stoppedAt = $stoppedAt.ToString('yyyy-MM-dd HH:mm:ss'); runningBefore = @($runningBefore)
            baseline = [ordered]@{
                records = $baseline.Count
                newest = if ($newest) { "$($newest.Timestamp) pid $($newest.ProcessId) $($newest.Process) reason $($newest.Reason) ($($newest.ReasonText))" } else { '' }
            }
            mainPid = $health.FirstPid; mainPidAtEnd = $health.MainPid; restarts = @($health.Restarts)
            exits = @($exits | Where-Object { $_.Class -cne 'old' } | ForEach-Object { ConvertTo-WalkExitEvidence $_ })
            anrs = @($anrs | ForEach-Object { $_.Trim() })
        }
        Write-Host ("[walk] process health: main pid $($health.FirstPid) to $($health.MainPid), $($health.Restarts.Count) restarts, " +
            "$(@($exits | Where-Object { $_.Class -cne 'old' }).Count) exits since the stop ($(@($exits | Where-Object { $_.Class -ceq 'failure' }).Count) failing), $($anrs.Count) ANRs")

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

        # Every planned case in the list's order, one a stop kept the walk from reaching included.
        $byId = @{}
        foreach ($entry in $caseResults) { $byId[$entry.id] = $entry }
        $cases = @(foreach ($case in $plan.Cases) {
                if ($byId.ContainsKey($case.Id)) { $byId[$case.Id] }
                else {
                    [ordered]@{ id = $case.Id; kind = $case.Kind; result = 'not run'; activity = ''; anchor = ''; implementation = ''
                        detail = 'the walk stopped before it' }
                }
            })
        $notRun = @($cases | Where-Object { $_.result -ceq 'not run' } | ForEach-Object { $_.id })
        if ($notRun.Count -gt 0) { $problems.Add("the walk never reached $($notRun -join ', ')") }
        $screens = @($cases | Where-Object { $_.result -ceq 'pass' }).Count
        $caseList = [ordered]@{
            version = $WalkCaseListVersion; complete = $plan.LeftOut.Count -eq 0
            leftOut = @($plan.LeftOut); extra = @($plan.Extra); hooksLeftOut = @($hooksLeftOut)
        }

        $full = $full -and $problems.Count -eq 0
        $result = Resolve-WalkOutcome -Screens $screens -Crashes $fatal.Count -Problems ([string[]]$problems) -Full $full
        $receipt = New-WalkReceipt -Result $result -Full $full -Serial $Serial -Device $identity.Model `
            -AppVersion $appVersion -AppVersionCode $appVersionCode -Build $build `
            -BundleSha256 $bundleSha256 -InstalledApkSha256 $installedSha `
            -Started $started -Finished ([DateTimeOffset]::UtcNow) -Screens $screens -Crashes $fatal.Count `
            -Problems ([string[]]$problems) -Hooks $hooks -CaseList $caseList -Cases $cases -Process $processEvidence
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
        if ($restore -and ($flipped.Count -gt 0 -or $routeOff.Count -gt 0)) { & $restore }
        if ($lease) { Exit-HushDeviceLease $lease }
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    # A list left at its default walks the canonical one; one given is compared with it.
    $listed = @{}
    if ($PSBoundParameters.ContainsKey('Visit')) { $listed.Visit = $Visit }
    if ($PSBoundParameters.ContainsKey('SettingsPages')) { $listed.SettingsPages = $SettingsPages }
    if ($PSBoundParameters.ContainsKey('HookFamilies')) { $listed.HookFamilies = $HookFamilies }
    $receiptPath = Invoke-WalkApp -Serial $Serial -Package $Package @listed `
        -CaseSwipes $CaseSwipes -SkipPatch:$SkipPatch -SkipSettings:$SkipSettings `
        -BuildEvidence $BuildEvidence -Exclude $Exclude -SettleSeconds $SettleSeconds -OutDir $OutDir `
        -Keystore $Keystore -KeyAlias $KeyAlias -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity `
        -Adb $Adb -Aapt2 $Aapt2 -Root $Root
    $walked = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
    if ($walked.result -cne 'PASS') { exit 1 }
}
