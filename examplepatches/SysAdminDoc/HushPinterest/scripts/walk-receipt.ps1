<#
.SYNOPSIS
    The receipt a whole-app walk leaves, and what makes one good enough to publish a bundle on.

.DESCRIPTION
    Dot-sourced by release/publish-release.ps1, which refuses to publish a bundle without a
    receipt that backs it. Nothing goes public until an APK patched from the exact bundle being
    released has been walked end to end on a release phone or an emulator and came back PASS:
    every Hush settings page and every patched screen, with no Pinterest crash.

    Schema 3 embeds the checked patch run's stock/catalog/selection and signed APK identity.
    The observed installed APK must match it, and its bundle must match the upload. It also
    carries the case list the walk ran, each case's result, each hook family's verdict and the
    process evidence, and publication needs every canonical case and hook family passed under
    the current case list version with no failing exit, ANR or restart. Older receipts and
    installed-app surveys without build evidence cannot authorize publication.
#>

# The phones release walks run on, by ro.product.model. An emulator passes by its serial.
$WalkReceiptPhones = @('SM-S908U1', 'SM-S938B')
. (Join-Path $PSScriptRoot 'patch-target.ps1')
$WalkReceiptCatalog = Join-Path (Split-Path -Parent $PSScriptRoot) 'patches-list.json'

# The settings list's search box, read by its hint. It sits above the list, so scrolling never hides
# it, and a page hides it, so it going away is how a page is told from the list. (The list's own
# headings scroll off the top once a lower row has been reached.)
$WalkSettingsHome = 'Search settings'
# Raised whenever a case or a hook family is added, dropped or given different anchors, so a
# receipt says which list it walked and publish refuses one walked against another.
$WalkCaseListVersion = 3
$WalkPinLink = 'pinterest://pin/1477812369124424/'
$WalkSettingsPages = @('Feed', 'Privacy', 'Pin actions', 'Interface', 'Links', 'Notifications',
    "Pinterest's own settings", 'Updates', 'Pause, backup and diagnostics', 'About')

function Get-WalkCaseList {
    <#
    .SYNOPSIS
        The canonical cases of a full walk, in the order they run. Each has an Id, a Kind (launch,
        menu, hold, link, inbox, settings or page), a Target for a link or page, the Marks its
        destination has to show and the Absent marks it mustn't (see Test-WalkAnchor in
        walk-app.ps1), and for a menu or hold the Origin case it opens from and returns to. A
        Family's HushMarks are required as well when the walk turned that family's switch on.
    #>
    @(
        # The home feed's list and bottom bar. Not the header's Create button: Hide navigation
        # buttons, which the walk turns on, takes it away.
        @{ Id = 'home'; Kind = 'launch'; Marks = @('id:p_recycler_view_home', 'id:bottom_nav_home_icon', 'id:pin_rep_id') }
        # A home feed pin's overflow menu. Report is in every pin menu; Hush puts Download pin, or
        # Download unavailable, at its top.
        @{ Id = 'grid-menu'; Kind = 'menu'; Origin = 'home'; Marks = @('text:Report')
            Family = 'Download pins'; HushMarks = @('text~^Download (pin|unavailable)$') }
        # The same pin held down: Pinterest's long-press menu, with its Send or Search image button.
        # Not Save: the pop-up menu has a Save row too, and it has Share where this menu has Send.
        @{ Id = 'long-press'; Kind = 'hold'; Origin = 'home'; Marks = @('any~^(Send|Search image)$')
            Absent = @('id:modal_header_dismiss_bt', 'id:pin_closeup_view')
            Family = 'Long-press download'; HushMarks = @('any:Download') }
        # Opened straight from the home feed: over a search, Pinterest 14.44.0 leaves the "Ideas
        # you might love" row out of the pin's related grid.
        @{ Id = 'pin'; Kind = 'link'; Target = $WalkPinLink; Marks = @('id:pin_closeup_view', 'id:closeup_back_button', 'id:overflow_button') }
        @{ Id = 'pin-menu'; Kind = 'menu'; Origin = 'pin'; Marks = @('text:Report')
            Family = 'Download pins'; HushMarks = @('text~^Download (pin|unavailable)$') }
        @{ Id = 'search-pins'; Kind = 'link'; Target = 'pinterest://search/pins/?q=nature'; Marks = @('desc:Search results: nature', 'id:pin_rep_id') }
        # The pins tab lists a board or two among its pins and its filter chip reads just Filter, so
        # the boards and profiles tabs are told by their own chip and by showing no pin.
        @{ Id = 'search-boards'; Kind = 'link'; Target = 'pinterest://search/boards/?q=recipes'
            Marks = @('desc:Search results: recipes', 'desc:Filter: Boards', 'desc~^(Group )?Board: '); Absent = @('id:pin_rep_id') }
        @{ Id = 'search-users'; Kind = 'link'; Target = 'pinterest://search/users/?q=art'
            Marks = @('desc:Search results: art', 'desc:Filter: Profiles', 'id:user_rep_title'); Absent = @('id:pin_rep_id') }
        # The home feed's bottom bar names the Inbox only in a content-desc. The Inbox is told by its
        # title, one node with that id and text, and by the home feed's list being gone. Its Updates
        # header isn't a mark, since Hide Inbox updates can take it away.
        @{ Id = 'inbox'; Kind = 'inbox'; Marks = @('id:title_container_title && text:Inbox'); Absent = @('id:p_recycler_view_home') }
        @{ Id = 'settings'; Kind = 'settings'; Marks = @("text:$WalkSettingsHome") }
        foreach ($page in $WalkSettingsPages) {
            @{ Id = "settings:$page"; Kind = 'page'; Target = $page; Marks = @("text:$page"); Absent = @("text:$WalkSettingsHome") }
        }
    )
}

function Get-WalkHookFamilies {
    <#
    .SYNOPSIS
        The canonical hook map: which case reaches each hook family, by case id ('home' for the home
        feed, 'grid-menu' and 'long-press' for a home feed pin's menus, 'pin' for the pin, 'inbox'
        for the Inbox opened from the home feed), and the switch that turns it on: its settings Page,
        its English title and its Key as the diagnostics report prints it.
    #>
    @(
        @{ Family = 'Download pins'; Case = 'grid-menu'; Page = 'Pin actions'; Switch = 'Download pins'; Key = 'hushpinterest_download_pins' }
        @{ Family = 'Long-press download'; Case = 'long-press'; Page = 'Pin actions'; Switch = 'Long-press download'; Key = 'hushpinterest_long_press_download' }
        @{ Family = 'Hide ads'; Case = 'home'; Page = 'Feed'; Switch = 'Hide ads'; Key = 'hushpinterest_hide_ads' }
        @{ Family = 'Hide AI-labeled pins'; Case = 'home'; Page = 'Feed'; Switch = 'Hide AI-labeled pins'; Key = 'hushpinterest_hide_ai_pins' }
        @{ Family = 'Hide shopping and product pins'; Case = 'home'; Page = 'Feed'; Switch = 'Hide shopping and product pins'; Key = 'hushpinterest_hide_shopping' }
        @{ Family = 'Filter feed'; Case = 'home'; Page = 'Feed'; Switch = 'Hide Home suggestions'; Key = 'hushpinterest_hide_home_suggestions' }
        @{ Family = 'Disable analytics'; Case = 'home'; Page = 'Privacy'; Switch = 'Disable analytics'; Key = 'hushpinterest_disable_analytics' }
        @{ Family = 'Hide advertising ID'; Case = 'home'; Page = 'Privacy'; Switch = 'Hide advertising ID'; Key = 'hushpinterest_hide_ad_id' }
        @{ Family = 'Download board'; Case = 'home'; Page = 'Pin actions'; Switch = 'Download board'; Key = 'hushpinterest_download_board' }
        @{ Family = 'No screenshot share menu'; Case = 'home'; Page = 'Interface'; Switch = 'No screenshot share menu'; Key = 'hushpinterest_hide_screenshot_share' }
        @{ Family = 'Hide Assistant'; Case = 'home'; Page = 'Interface'; Switch = 'Hide Assistant'; Key = 'hushpinterest_hide_assistant' }
        @{ Family = 'Hide navigation buttons'; Case = 'home'; Page = 'Interface'; Switch = 'Hide Create button'; Key = 'hushpinterest_hide_nav_create' }
        @{ Family = 'AMOLED black'; Case = 'home'; Page = 'Interface'; Switch = 'Black bottom bar'; Key = 'hushpinterest_black_bottom_bar' }
        @{ Family = 'Original-quality images'; Case = 'home'; Page = 'Interface'; Switch = 'Original-quality images'; Key = 'hushpinterest_original_images' }
        @{ Family = 'Hide closeup buttons'; Case = 'pin'; Page = 'Interface'; Switch = 'Hide lens button on pins'; Key = 'hushpinterest_hide_closeup_lens' }
        @{ Family = 'Hide comments'; Case = 'pin'; Page = 'Interface'; Switch = 'Hide comments'; Key = 'hushpinterest_hide_comments' }
        @{ Family = 'Hide topic suggestions'; Case = 'pin'; Page = 'Interface'; Switch = 'Hide topic suggestions'; Key = 'hushpinterest_hide_topic_suggestions' }
        @{ Family = 'Show posted date'; Case = 'pin'; Page = 'Interface'; Switch = 'Show posted date'; Key = 'hushpinterest_show_posted_date' }
        @{ Family = 'Hide Inbox updates'; Case = 'inbox'; Page = 'Notifications'; Switch = 'Hide Inbox updates'; Key = 'hushpinterest_hide_inbox_updates' }
    )
}

function Get-WalkHookShortfall {
    <#
    .SYNOPSIS
        The canonical hook families -Families leaves out or maps differently (another case, page,
        switch or key), by name. A walk with any can't be full.
    #>
    param([object[]]$Families = @())
    $given = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($entry in @($Families | Where-Object { $_ })) {
        [void]$given.Add("$($entry.Family)|$($entry.Case)|$($entry.Page)|$($entry.Switch)|$($entry.Key)")
    }
    foreach ($entry in @(Get-WalkHookFamilies)) {
        if (-not $given.Contains("$($entry.Family)|$($entry.Case)|$($entry.Page)|$($entry.Switch)|$($entry.Key)")) { $entry.Family }
    }
}

function ConvertFrom-WalkTime {
    <#
    .SYNOPSIS
        A device time in the form exit-info and the walk's stop write it, yyyy-MM-dd HH:mm:ss with
        or without milliseconds, or $null. Both JSON readers keep that form a string. A DateTime
        means the receipt held another form (ISO or /Date()/), so it reads as no time at all.
    #>
    param($Value)
    if ($Value -isnot [string]) { return $null }
    $parsed = [datetime]::MinValue
    $formats = [string[]]@('yyyy-MM-dd HH:mm:ss.fff', 'yyyy-MM-dd HH:mm:ss')
    if ([datetime]::TryParseExact($Value, $formats, [Globalization.CultureInfo]::InvariantCulture,
            [Globalization.DateTimeStyles]::None, [ref]$parsed)) { return $parsed }
    return $null
}

function Resolve-WalkExits {
    <#
    .SYNOPSIS
        Each exit record with the Class it earns against the walk. A record carries Time,
        ProcessId, Process, User, Reason, Subreason, SubreasonText, Importance and Description, as
        ConvertFrom-WalkExitInfo reads them off the device or ConvertFrom-WalkExitEvidence out of
        a receipt, so the walk and the publish gate class the same facts the same way:
          old              from before the stop
          unrelated        another user's, such as a work profile's or a clone's
          initial stop     the force-stop itself: user requested (reason 10) with the force stop
                           subreason (21) or a "stop <package>" description, of a pid running
                           just before the stop, within 30 seconds of it
          failure          a crash, native crash, ANR or failed start of any process, any other
                           exit of the main process, any record missing its time or reason, and a
                           helper still in use (importance under 400, cached) going any other way
                           than the two below
          helper eviction  the system reclaiming a helper: an isolated process no longer needed
                           (subreason 17) at any importance, or a cached helper's exit self, low
                           memory kill, other kill by the system, freeze, or cached, empty or
                           MemoryLimiter:AnonSwap kill
          helper exit      a helper's own exit (reason 1) while in use, or a cached helper gone
                           some other way
        The main process is the one named -Package. Every other process in the package's exit
        records is a helper, whatever its name. -RunningBefore holds the pids listed just before
        the stop, -StoppedAt the device time then. Being in the baseline read after the stop earns
        a record nothing: S22 pids come round again within the hour. An ANR is reason 6 here, so
        one the event log has already lost still fails the walk.
    #>
    param([object[]]$Records = @(), [string[]]$RunningBefore = @(), [datetime]$StoppedAt,
        [string]$Package = 'com.pinterest', [int]$User = 0)
    $running = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($id in @($RunningBefore | Where-Object { $_ })) { [void]$running.Add([string]$id) }
    $stopText = "^stop $([regex]::Escape($Package))\b"
    $reclaimText = 'MemoryLimiter:AnonSwap|\bcached\b|\bempty\b'
    foreach ($record in @($Records | Where-Object { $_ })) {
        $main = "$($record.Process)" -ceq $Package
        $cached = $null -ne $record.Importance -and [long]$record.Importance -ge 400
        $isolated = $null -ne $record.Subreason -and [long]$record.Subreason -eq 17
        $stop = $null -ne $record.Time -and $record.Reason -eq 10 -and
            ($record.Subreason -eq 21 -or "$($record.Description)" -cmatch $stopText) -and
            $running.Contains([string]$record.ProcessId) -and $record.Time -ge $StoppedAt -and $record.Time -le $StoppedAt.AddSeconds(30)
        $class = if ($null -eq $record.Time) { 'failure' }
        elseif ($record.Time -lt $StoppedAt) { 'old' }
        elseif ($null -ne $record.User -and [long]$record.User -ne $User) { 'unrelated' }
        elseif ($stop) { 'initial stop' }
        elseif ($null -eq $record.Reason -or @(4, 5, 6, 7) -contains [long]$record.Reason -or $main) { 'failure' }
        elseif ($isolated) { 'helper eviction' }
        elseif ($cached -and (@(1, 3, 13, 14) -contains [long]$record.Reason -or
                "$($record.Description) $($record.SubreasonText)" -match $reclaimText)) { 'helper eviction' }
        elseif ($cached -or [long]$record.Reason -eq 1) { 'helper exit' }
        else { 'failure' }
        $record | Add-Member -NotePropertyName Class -NotePropertyValue $class -Force -PassThru
    }
}

function ConvertTo-WalkExitEvidence {
    <#
    .SYNOPSIS
        One classed exit record as the receipt keeps it: the facts Resolve-WalkExits reads, so
        the publish gate can class it again, and the class the walk gave it.
    #>
    param([Parameter(Mandatory = $true)]$Record)
    [ordered]@{
        timestamp = $Record.Timestamp; pid = [string]$Record.ProcessId; process = $Record.Process; user = $Record.User
        reason = $Record.Reason; reasonText = $Record.ReasonText; subreason = $Record.Subreason; subreasonText = $Record.SubreasonText
        importance = $Record.Importance; description = $Record.Description; class = $Record.Class
    }
}

function ConvertFrom-WalkExitEvidence {
    <#
    .SYNOPSIS
        A receipt's exit entry back as a record Resolve-WalkExits can class, with the class the
        walk wrote as RecordedClass. A field of the wrong type comes back $null, which classes
        as a failure or, for the user, as the walk's own.
    #>
    param($Entry)
    $number = { param($Value) if ($Value -is [int] -or $Value -is [long]) { [long]$Value } else { $null } }
    $text = { param($Value) if ($Value -is [string]) { $Value } else { '' } }
    [pscustomobject]@{
        Timestamp = & $text $Entry.timestamp; Time = ConvertFrom-WalkTime $Entry.timestamp
        ProcessId = if ($Entry.pid -is [string] -or $Entry.pid -is [int] -or $Entry.pid -is [long]) { [string]$Entry.pid } else { '' }
        Process = & $text $Entry.process; User = & $number $Entry.user
        Reason = & $number $Entry.reason; ReasonText = & $text $Entry.reasonText
        Subreason = & $number $Entry.subreason; SubreasonText = & $text $Entry.subreasonText
        Importance = & $number $Entry.importance; Description = & $text $Entry.description
        RecordedClass = & $text $Entry.class
    }
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
        [AllowEmptyString()][string]$AppVersion,
        [AllowEmptyString()][string]$AppVersionCode,
        [Parameter(Mandatory = $true)][string]$BundleSha256,
        [AllowEmptyString()][string]$InstalledApkSha256,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Started,
        [Parameter(Mandatory = $true)][DateTimeOffset]$Finished,
        [int]$Screens,
        [int]$Crashes,
        [string[]]$Problems = @(),
        $Build,
        # The walk's verdict on each hook family: pass, fail or not exercised, with its counts.
        [object[]]$Hooks = @(),
        # The case list walked: its version, whether every canonical case was planned, the ids
        # left out or added, and the canonical hook families the walk's map left out.
        $CaseList,
        # Each case's id, kind, result, resumed activity, anchor, menu implementation and detail.
        [object[]]$Cases = @(),
        # The process evidence: the stop, the exit-info baseline after it, the main pid at launch
        # and at the end, every exit since the stop with its class, the ANRs and the restarts.
        $Process
    )
    return [ordered]@{
        schema = 3; result = $Result; full = $Full
        serial = $Serial; device = $Device; emulator = $Serial.StartsWith('emulator-', [StringComparison]::Ordinal)
        appVersion = $AppVersion; appVersionCode = $AppVersionCode
        bundleSha256 = $BundleSha256.ToLowerInvariant(); installedApkSha256 = $InstalledApkSha256
        build = $Build
        started = $Started.UtcDateTime.ToString('o'); finished = $Finished.UtcDateTime.ToString('o')
        screens = $Screens; crashes = $Crashes; problems = @($Problems); hooks = @($Hooks)
        caseList = $CaseList; cases = @($Cases); process = $Process
    }
}

function Test-WalkReceipt {
    <#
    .SYNOPSIS
        Whether the receipt at -Path is a full, passing walk of the bundle at -BundlePath, on a
        release phone or an emulator. Answers @{ Valid; Reason; Receipt }.
    #>
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$BundlePath,
        [string]$PatchList = $WalkReceiptCatalog)
    function Fail([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason; Receipt = $null } }
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return Fail "there's no walk receipt at $Path" }
    try {
        $json = Get-Content -LiteralPath $Path -Raw
        $receipt = if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
            $json | ConvertFrom-Json -DateKind String
        } else { $json | ConvertFrom-Json }
    }
    catch { return Fail "the walk receipt doesn't read as JSON: $($_.Exception.Message)" }
    if ($null -eq $receipt -or ($receipt.schema -isnot [int] -and $receipt.schema -isnot [long]) -or $receipt.schema -ne 3) {
        return Fail "the walk receipt isn't schema 3 with build, case and process evidence; run a new walk"
    }
    if ($receipt.result -isnot [string] -or $receipt.result -cne 'PASS') {
        return Fail "the walk ended $(if ($receipt.result -is [string] -and $receipt.result) { $receipt.result } else { 'with no result' }), not PASS"
    }
    if ($receipt.full -isnot [bool] -or -not $receipt.full) { return Fail 'the walk skipped part of the app, so it was not the whole app' }
    if (($receipt.screens -isnot [int] -and $receipt.screens -isnot [long]) -or $receipt.screens -lt 1) {
        return Fail "the walk receipt doesn't say it opened any screen"
    }
    if (($receipt.crashes -isnot [int] -and $receipt.crashes -isnot [long]) -or $receipt.crashes -ne 0) {
        return Fail 'the walk recorded a Pinterest crash'
    }
    if ($null -eq $receipt.problems -or $receipt.problems -isnot [Array] -or $receipt.problems.Count -ne 0) {
        return Fail 'the walk has problems or no problems list'
    }
    # The whole case list, at this version, with every case and hook family passed.
    $list = $receipt.caseList
    if ($null -eq $list -or ($list.version -isnot [int] -and $list.version -isnot [long]) -or $list.version -ne $WalkCaseListVersion -or
        $list.complete -isnot [bool] -or -not $list.complete -or $list.leftOut -isnot [Array] -or $list.leftOut.Count -ne 0 -or
        $list.hooksLeftOut -isnot [Array] -or $list.hooksLeftOut.Count -ne 0) {
        return Fail "the walk didn't run all of case list version $WalkCaseListVersion and its hook map"
    }
    # One result per case, every one of them a pass: each canonical case, and any other case one
    # the list names as an extra the walk was asked for.
    $results = [Collections.Generic.Dictionary[string, string]]::new([StringComparer]::Ordinal)
    if ($receipt.cases -isnot [Array]) { return Fail 'the walk receipt has no case results' }
    foreach ($entry in $receipt.cases) {
        if ($null -eq $entry -or $entry.id -isnot [string] -or $entry.result -isnot [string]) { return Fail 'a case result has no id or result' }
        if ($results.ContainsKey($entry.id)) { return Fail "the walk receipt lists the $($entry.id) case more than once" }
        $results[$entry.id] = $entry.result
    }
    $canonicalCases = @(Get-WalkCaseList)
    foreach ($case in $canonicalCases) {
        if (-not $results.ContainsKey($case.Id) -or $results[$case.Id] -cne 'pass') { return Fail "the walk's $($case.Id) case didn't pass" }
    }
    $extraCases = if ($list.extra -is [Array]) { @($list.extra | ForEach-Object { "$_" }) } else { @() }
    foreach ($id in $results.Keys) {
        if (@($canonicalCases | Where-Object { $_.Id -ceq $id }).Count -eq 0 -and $extraCases -cnotcontains $id) {
            return Fail "the walk receipt has a $id case that's neither in the case list nor a listed extra"
        }
        if ($results[$id] -cne 'pass') { return Fail "the walk's $id case didn't pass" }
    }
    # One verdict per canonical hook family, on the case the map gives it, and no other family.
    $verdicts = [Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
    if ($receipt.hooks -isnot [Array]) { return Fail 'the walk receipt has no hook verdicts' }
    foreach ($entry in $receipt.hooks) {
        if ($null -eq $entry -or $entry.family -isnot [string] -or $entry.verdict -isnot [string]) { return Fail 'a hook verdict has no family or verdict' }
        if ($verdicts.ContainsKey($entry.family)) { return Fail "the walk receipt lists the $($entry.family) hook more than once" }
        $verdicts[$entry.family] = $entry
    }
    $canonicalFamilies = @(Get-WalkHookFamilies)
    foreach ($family in $canonicalFamilies) {
        $entry = if ($verdicts.ContainsKey($family.Family)) { $verdicts[$family.Family] } else { $null }
        if ($null -eq $entry -or $entry.verdict -cne 'pass' -or "$($entry.case)" -cne $family.Case) {
            return Fail "the walk didn't check and pass the $($family.Family) hook on its $($family.Case) case"
        }
    }
    # The walk also lists every family the report names that the map leaves out, or the build lacks,
    # as not exercised with no case. Any other extra family, or one claiming a verdict, isn't the map's.
    foreach ($family in $verdicts.Keys) {
        if (@($canonicalFamilies | Where-Object { $_.Family -ceq $family }).Count -gt 0) { continue }
        $extra = $verdicts[$family]
        if ($extra.verdict -cne 'not exercised' -or $null -ne $extra.case) {
            return Fail "the walk receipt gives the $family hook, which the canonical map doesn't have, a verdict or a case"
        }
    }
    # One main process from launch to the end, and nothing since the stop but the stop itself,
    # helpers the system reclaimed and other users' processes.
    $process = $receipt.process
    if ($null -eq $process -or $null -eq $process.baseline -or $process.mainPid -isnot [string] -or $process.mainPid -cnotmatch '\A\d+\z' -or
        $process.mainPidAtEnd -isnot [string] -or $process.mainPidAtEnd -cne $process.mainPid -or $process.restarts -isnot [Array] -or $process.restarts.Count -ne 0 -or
        $process.anrs -isnot [Array] -or $process.anrs.Count -ne 0 -or $process.exits -isnot [Array] -or $process.runningBefore -isnot [Array]) {
        return Fail "the walk's process evidence is missing or shows an ANR or a restart"
    }
    # Every exit classed again from the facts recorded with it, so a class the facts don't earn,
    # or a failing one, refuses the receipt, and the stop's own record has to be there.
    $stoppedAt = ConvertFrom-WalkTime $process.stoppedAt
    if ($null -eq $stoppedAt) { return Fail "the walk's process evidence doesn't say when Pinterest was stopped" }
    $runningBefore = [string[]]@($process.runningBefore | Where-Object { $null -ne $_ } | ForEach-Object { "$_" })
    $benign = @('initial stop', 'unrelated', 'helper eviction', 'helper exit')
    $stops = 0
    foreach ($entry in $process.exits) {
        $exit = ConvertFrom-WalkExitEvidence $entry
        $class = @(Resolve-WalkExits -Records @($exit) -RunningBefore $runningBefore -StoppedAt $stoppedAt)[0].Class
        if ($class -cne $exit.RecordedClass) {
            return Fail "the walk's exit of pid $($exit.ProcessId) at $($exit.Timestamp) is written as '$($exit.RecordedClass)' but its facts make it '$class'"
        }
        if ($benign -cnotcontains $class) { return Fail "the walk recorded a failing exit: pid $($exit.ProcessId) $($exit.Process) at $($exit.Timestamp)" }
        if ($class -ceq 'initial stop' -and $exit.Process -ceq 'com.pinterest') { $stops++ }
    }
    if ($stops -lt 1) { return Fail "the walk's process evidence has no record of the stop it started from" }
    # ConvertFrom-Json returns DateTime in newer PowerShell and text in 5.1. Normalize both
    # explicitly; a date without a zone is not evidence of an unambiguous instant.
    $times = @{}
    $isoTime = '\A\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,7})?(?:Z|[+-]\d{2}:\d{2})\z'
    foreach ($field in @('started', 'finished')) {
        $value = $receipt.$field
        if ($value -is [DateTime]) {
            if ($value.Kind -eq [DateTimeKind]::Unspecified) { return Fail "ambiguous $field time" }
            $value = $value.ToUniversalTime().ToString('o')
        }
        $parsed = [DateTimeOffset]::MinValue
        if ($value -isnot [string] -or $value -notmatch $isoTime -or
            -not [DateTimeOffset]::TryParse($value, [Globalization.CultureInfo]::InvariantCulture,
                [Globalization.DateTimeStyles]::None, [ref]$parsed)) { return Fail "invalid $field time" }
        $times[$field] = $parsed
    }
    if ($times.finished -lt $times.started -or $times.finished -gt [DateTimeOffset]::UtcNow.AddMinutes(5)) {
        return Fail 'the walk times are reversed or in the future'
    }
    if ($receipt.device -isnot [string] -or $receipt.serial -isnot [string] -or $receipt.emulator -isnot [bool]) {
        return Fail "the walk receipt doesn't say which device walked it"
    }
    $isEmulator = $receipt.serial.StartsWith('emulator-', [StringComparison]::Ordinal)
    if ($receipt.serial -notmatch '\A[A-Za-z0-9][A-Za-z0-9._-]*\z' -or
        ($isEmulator -and $receipt.serial -notmatch '\Aemulator-\d+\z') -or [string]::IsNullOrWhiteSpace($receipt.device)) {
        return Fail 'invalid walk device identity'
    }
    if ($receipt.emulator -ne $isEmulator -or (-not $isEmulator -and $WalkReceiptPhones -cnotcontains $receipt.device)) {
        return Fail "$($receipt.device) isn't one of the release walk phones ($($WalkReceiptPhones -join ', ')) or an emulator"
    }
    if (-not (Test-Path -LiteralPath $BundlePath -PathType Leaf)) { return Fail "there's no bundle at $BundlePath to hold the walk to" }
    $bundleSha256 = (Get-FileHash -LiteralPath $BundlePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($receipt.bundleSha256 -isnot [string] -or $receipt.bundleSha256 -cne $bundleSha256) {
        return Fail "the walked APK was patched with bundle '$($receipt.bundleSha256)', and this one is '$bundleSha256'"
    }
    $build = $receipt.build
    if ($null -eq $build -or ($build.schema -isnot [int] -and $build.schema -isnot [long]) -or $build.schema -ne 1) {
        return Fail 'no versioned patch/build evidence binds this installed APK'
    }
    foreach ($hash in @($receipt.installedApkSha256, $build.bundleSha256, $build.fixtureSha256,
            $build.catalogSha256, $build.signedApkSha256)) {
        if ($hash -isnot [string] -or $hash -cnotmatch '\A[0-9a-f]{64}\z') { return Fail 'missing or malformed build/install hash' }
    }
    if ($build.bundleSha256 -cne $bundleSha256 -or $build.signedApkSha256 -cne $receipt.installedApkSha256) {
        return Fail 'the installed APK does not match the APK patched from this bundle'
    }
    try {
        $catalog = Get-Content -LiteralPath $PatchList -Raw | ConvertFrom-Json
        $target = Get-PatchTarget -PatchList $catalog
        $catalogHash = (Get-FileHash -LiteralPath $PatchList -Algorithm SHA256).Hash.ToLowerInvariant()
    } catch { return Fail "the patch catalog could not be verified: $($_.Exception.Message)" }
    if ($build.packageName -isnot [string] -or $build.appVersion -isnot [string] -or $build.appVersionCode -isnot [string] -or
        $build.catalogSha256 -cne $catalogHash -or $build.packageName -cne $target.PackageName -or
        $receipt.appVersion -isnot [string] -or $receipt.appVersionCode -isnot [string] -or
        $receipt.appVersion -cne $build.appVersion -or $receipt.appVersionCode -cne $build.appVersionCode -or
        -not (Test-DeclaredBuild -Target $target -VersionName $receipt.appVersion -VersionCode $receipt.appVersionCode)) {
        return Fail 'the build/install app identity does not match the supported catalog'
    }
    $selected = $build.selectedPatches
    if ($selected -isnot [Array] -or $selected.Count -eq 0) { return Fail 'the build has no patch selection' }
    $seen = [Collections.Generic.HashSet[string]]::new([StringComparer]::Ordinal)
    foreach ($name in $selected) {
        if ($name -isnot [string] -or @($catalog.patches.name) -cnotcontains $name -or -not $seen.Add($name)) {
            return Fail 'the build patch selection is unknown or duplicated'
        }
    }
    $builtAt = $build.completed
    if ($builtAt -is [DateTime]) {
        if ($builtAt.Kind -eq [DateTimeKind]::Unspecified) { return Fail 'ambiguous patch/build time' }
        $builtAt = $builtAt.ToUniversalTime().ToString('o')
    }
    $builtTime = [DateTimeOffset]::MinValue
    if ($builtAt -isnot [string] -or $builtAt -notmatch $isoTime -or
        -not [DateTimeOffset]::TryParse($builtAt, [Globalization.CultureInfo]::InvariantCulture,
            [Globalization.DateTimeStyles]::None, [ref]$builtTime) -or $builtTime -gt $times.started) {
        return Fail 'the patch/build time is invalid or after the walk started'
    }
    return [pscustomobject]@{ Valid = $true; Reason = $null; Receipt = $receipt }
}
