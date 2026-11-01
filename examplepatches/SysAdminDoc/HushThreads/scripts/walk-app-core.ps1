<#
.SYNOPSIS
    The parts of the whole-app walk that don't need a device: reading a UI dump, deciding what the
    walk may tap, finding Threads crashes in logcat, and turning what the walk reached into PASS,
    PARTIAL or FAIL.

.DESCRIPTION
    Dot-sourced by walk-app.ps1, which drives the device, and by test-walk-app.ps1, which feeds
    these functions recorded dumps and logcat so the verdict rules hold without one.
#>

$WalkPackage = 'com.instagram.barcelona'
$WalkMainActivity = 'com.instagram.barcelona.mainactivity.BarcelonaActivity'
$WalkOpenSettingsExtra = 'app.morphe.extension.hushthreads.OPEN_SETTINGS'

# The Threads screens the walk opens by link, in order. Each link was read from Threads 453's
# manifest (BarcelonaUrlHandlerActivity and the threads.com app links). The post is a public one
# on a public account, so opening it reaches nobody. A screen counts as open only when the dump
# holds its screen's id (ExpectId) and, when given, a node whose text matches Expect: a link
# Threads doesn't route lands on the feed, which Threads being in front would pass.
$WalkScreens = @(
    [pscustomobject]@{ Name = 'Home feed'; Link = 'barcelona://mainfeed'; ExpectId = 'MainFeedScreen'; Expect = $null }
    [pscustomobject]@{ Name = 'Search'; Link = 'barcelona://search'; ExpectId = 'BdsSearchBarInput'; Expect = $null }
    [pscustomobject]@{ Name = 'Activity'; Link = 'barcelona://activity_feed'; ExpectId = 'ActivityFeedScreen'; Expect = $null }
    [pscustomobject]@{ Name = 'Profile'; Link = 'https://www.threads.com/@zuck'; ExpectId = 'ProfileScreen'; Expect = '(?-i)^Mark Zuckerberg$' }
    # Threads opens a post link as the feed with that post on top.
    [pscustomobject]@{ Name = 'Opened post'; Link = 'https://www.threads.com/@zuck/post/DOMD1yDj9M4'; ExpectId = 'MainFeedScreen'; Expect = '(?-i)^You can now attach longer text' }
)

# Threads' own buttons from the feed to the HushThreads row in Threads' settings, the way a user
# gets in. No link opens Threads' settings in 453: barcelona://settings doesn't resolve and
# settings_2 lands on the feed. These and the HushThreads settings page rows are the only nodes the
# walk taps, each only
# on the screen its Beside id marks. On someone else's profile the same settings id is their menu
# (block, report), so the profile's button is tapped only beside the own profile's Edit profile.
# Finding a step's node shows the screen named by Shows was reached.
$WalkSettingsPath = @(
    [pscustomobject]@{ Name = 'the Profile tab'; Id = 'barcelona_tab_profile'; Text = ''; Desc = ''; Beside = 'tabs_screen'; Shows = $null; Scrolls = $false }
    [pscustomobject]@{ Name = "the profile's Settings button"; Id = 'profile_screen_profile_settings'; Text = ''; Desc = 'Settings'; Beside = 'profile_screen_edit_profile_button'; Shows = $null; Scrolls = $false }
    [pscustomobject]@{ Name = "the HushThreads row in Threads' settings"; Id = 'ig_text'; Text = 'HushThreads'; Desc = ''; Beside = 'SettingsScreen'; Shows = "Threads' settings"; Scrolls = $true }
)

function Get-WalkSections {
    <#
    .SYNOPSIS
        The HushThreads settings pages, by their English names, in the order the home page lists
        them, read from SettingsNavigation.java's section(...) calls.
    #>
    param([Parameter(Mandatory = $true)][string]$Root)
    $path = Join-Path $Root 'extensions/threads/src/main/java/app/morphe/extension/hushthreads/settings/SettingsNavigation.java'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "There's no SettingsNavigation.java at $path to read the settings pages from." }
    $source = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
    $names = @([regex]::Matches($source, '(?m)^\s*section\(\s*"((?:[^"\\]|\\.)+)"\s*,') | ForEach-Object { [regex]::Unescape($_.Groups[1].Value) })
    if ($names.Count -eq 0) { throw "SettingsNavigation.java names no settings pages: $path" }
    $names
}

function Get-WalkExpectedScreens {
    param([Parameter(Mandatory = $true)][string]$Root)
    @($WalkScreens | ForEach-Object { $_.Name }) + @("Threads' settings", 'Settings: home') +
        @(Get-WalkSections -Root $Root | ForEach-Object { "Settings: $_" })
}

function ConvertFrom-UiDump {
    <#
    .SYNOPSIS
        The nodes of a uiautomator dump, each with its labels, flags and screen bounds.
    #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Xml)
    if (-not $Xml.Trim()) { return @() }
    $doc = [xml]$Xml
    foreach ($node in $doc.SelectNodes('//node')) {
        $bounds = [regex]::Match($node.GetAttribute('bounds'), '^\[(-?\d+),(-?\d+)\]\[(-?\d+),(-?\d+)\]$')
        if (-not $bounds.Success) { continue }
        $left = [int]$bounds.Groups[1].Value; $top = [int]$bounds.Groups[2].Value
        $right = [int]$bounds.Groups[3].Value; $bottom = [int]$bounds.Groups[4].Value
        $id = $node.GetAttribute('resource-id')
        [pscustomobject]@{
            Text = $node.GetAttribute('text'); Desc = $node.GetAttribute('content-desc')
            Id = if ($id.Contains('/')) { $id.Substring($id.IndexOf('/') + 1) } else { $id }
            Class = $node.GetAttribute('class'); Package = $node.GetAttribute('package')
            Clickable = $node.GetAttribute('clickable') -eq 'true'; Scrollable = $node.GetAttribute('scrollable') -eq 'true'
            Left = $left; Top = $top; Right = $right; Bottom = $bottom
            X = [int][Math]::Floor(($left + $right) / 2); Y = [int][Math]::Floor(($top + $bottom) / 2)
        }
    }
}

function Find-UiNode {
    <#
    .SYNOPSIS
        The nodes whose text or content description matches -Label (a regex), with a usable area.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @(), [Parameter(Mandatory = $true)][string]$Label, [string]$Id)
    @($Nodes | Where-Object {
            ($_.Text -match $Label -or $_.Desc -match $Label) -and
            (-not $Id -or $_.Id -ceq $Id) -and $_.Right -gt $_.Left -and $_.Bottom -gt $_.Top
        })
}

function Find-WalkSectionRow {
    <#
    .SYNOPSIS
        The row on the HushThreads home page that opens the page named -Section, or nothing.
    .DESCRIPTION
        Only a row title (id "title", Threads' package) whose text is the page's name exactly and
        that is big enough to tap. Each row also carries a one-pixel copy of its title for screen
        readers, which a tap would miss.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @(), [Parameter(Mandatory = $true)][string]$Section)
    @($Nodes | Where-Object { Test-WalkTapAllowed -Node $_ -Sections @($Section) }) | Select-Object -First 1
}

function Test-WalkTapAllowed {
    <#
    .SYNOPSIS
        Whether the walk may tap this node: the title of a HushThreads settings page row, or a
        step of $WalkSettingsPath on its own screen (-Nodes is the dump the node came from). The
        walk opens Threads' screens by link and taps nothing else in Threads, so it can't follow,
        like, reply, post or message anyone, whatever a lookup hands it.
    #>
    param(
        [Parameter(Mandatory = $true)]$Node, [Parameter(Mandatory = $true)][AllowEmptyCollection()][string[]]$Sections,
        [AllowEmptyCollection()][object[]]$Nodes = @()
    )
    if ($Node.Package -cne $WalkPackage -or ($Node.Right - $Node.Left) -lt 10 -or ($Node.Bottom - $Node.Top) -lt 10) { return $false }
    if ($Node.Id -ceq 'title' -and $Sections -ccontains $Node.Text) { return $true }
    foreach ($step in $WalkSettingsPath) {
        if ($Node.Id -ceq $step.Id -and $Node.Text -ceq $step.Text -and $Node.Desc -ceq $step.Desc -and
            @($Nodes | Where-Object { $_.Id -ceq $step.Beside -and $_.Package -ceq $WalkPackage }).Count -gt 0) { return $true }
    }
    $false
}

function Find-WalkPathNode {
    <#
    .SYNOPSIS
        The node a step of $WalkSettingsPath taps on this dump, or nothing when it isn't there.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @(), [Parameter(Mandatory = $true)]$Step)
    @($Nodes | Where-Object { $_.Id -ceq $Step.Id -and (Test-WalkTapAllowed -Node $_ -Sections @() -Nodes $Nodes) }) | Select-Object -First 1
}

function Wait-WalkStep {
    <#
    .SYNOPSIS
        Waits for a step of $WalkSettingsPath, answering as Wait-WalkScreen does.
    .DESCRIPTION
        A step that scrolls may sit below the fold of a short screen, so once its own screen is up
        the list gets swiped until the row shows or a swipe changes nothing. No other screen is
        swiped: the swipe is only ever on the screen the step names.
    #>
    param(
        [Parameter(Mandatory = $true)]$Step, [Parameter(Mandatory = $true)][scriptblock]$Read, [Parameter(Mandatory = $true)][scriptblock]$Swipe,
        [int]$Seconds = 20, [int]$PauseMilliseconds = 2000, [int]$MaxSwipes = 8
    )
    $seen = Wait-WalkScreen -Read $Read -Seconds $Seconds -PauseMilliseconds $PauseMilliseconds -Test {
        param($dump)
        (Find-WalkPathNode -Nodes $dump -Step $Step) -or
            ($Step.Scrolls -and @($dump | Where-Object { $_.Id -ceq $Step.Beside -and $_.Package -ceq $WalkPackage }).Count -gt 0)
    }
    $current = @($seen.Nodes)
    $found = $seen.Found -and [bool](Find-WalkPathNode -Nodes $current -Step $Step)
    for ($swipes = 0; $seen.Found -and -not $found -and $swipes -lt $MaxSwipes; $swipes++) {
        $before = Get-UiFingerprint -Nodes $current
        & $Swipe
        $current = @(& $Read)
        $found = [bool](Find-WalkPathNode -Nodes $current -Step $Step)
        if ((Get-UiFingerprint -Nodes $current) -ceq $before) { break }
    }
    [pscustomobject]@{ Found = $found; Nodes = $current; Unread = $current.Count -eq 0 }
}

function Test-WalkScreenShown {
    <#
    .SYNOPSIS
        Whether a dump shows a $WalkScreens screen: its screen id, and its Expect text when given.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @(), [Parameter(Mandatory = $true)]$Screen)
    $ours = @($Nodes | Where-Object { $_.Package -ceq $WalkPackage })
    @($ours | Where-Object { $_.Id -ceq $Screen.ExpectId }).Count -gt 0 -and
        (-not $Screen.Expect -or @(Find-UiNode -Nodes $ours -Label $Screen.Expect).Count -gt 0)
}

function Wait-WalkScreen {
    <#
    .SYNOPSIS
        Reads the screen until -Test passes on what -Read returns, or -Seconds run out.
    .DESCRIPTION
        A screen still drawing reads as the one before it, and a playing video keeps uiautomator from
        reading anything, so one read after a fixed wait fails a screen that opened fine. Answers
        Found, the Nodes of the last read, and Unread when that read got nothing at all, which isn't
        the same as reading a screen without the thing in it.
    #>
    param(
        [Parameter(Mandatory = $true)][scriptblock]$Read, [Parameter(Mandatory = $true)][scriptblock]$Test,
        [int]$Seconds = 20, [int]$PauseMilliseconds = 2000
    )
    $deadline = [DateTimeOffset]::UtcNow.AddSeconds($Seconds)
    while ($true) {
        $seen = @(& $Read)
        $found = $seen.Count -gt 0 -and [bool](& $Test $seen)
        if ($found -or [DateTimeOffset]::UtcNow -ge $deadline) {
            return [pscustomobject]@{ Found = $found; Nodes = $seen; Unread = $seen.Count -eq 0 }
        }
        Start-Sleep -Milliseconds $PauseMilliseconds
    }
}

function Get-WalkSettingsPage {
    <#
    .SYNOPSIS
        Which HushThreads settings page a dump shows: 'home', the name of a page, or nothing when
        it isn't the settings screen.
    .DESCRIPTION
        The screen's header is two lines: "HushThreads", and under it "Settings" on home or the
        page's own name. Home also has the search box, which a page hides. Read in English: the
        walk devices run Threads in English.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @(), [Parameter(Mandatory = $true)][AllowEmptyCollection()][string[]]$Sections)
    $ours = @($Nodes | Where-Object { $_.Package -ceq $WalkPackage -and -not $_.Id })
    $search = @($ours | Where-Object { $_.Class -ceq 'android.widget.EditText' -and $_.Desc -ceq 'Search settings' }).Count -gt 0
    foreach ($brand in @($ours | Where-Object { $_.Text -ceq 'HushThreads' -and $_.Class -ceq 'android.widget.TextView' })) {
        $title = @($ours | Where-Object { $_.Class -ceq 'android.widget.TextView' -and $_.Top -eq $brand.Bottom -and $_.Left -eq $brand.Left }) |
            Select-Object -First 1
        if (-not $title) { continue }
        if ($title.Text -ceq 'Settings' -and $search) { return 'home' }
        if ($Sections -ccontains $title.Text -and -not $search) { return $title.Text }
    }
    $null
}

function Get-UiFingerprint {
    <#
    .SYNOPSIS
        A string that changes when what a dump shows changes, used to tell a scroll that moved
        from one that hit the bottom.
    #>
    param([AllowEmptyCollection()][object[]]$Nodes = @())
    (@($Nodes | Where-Object { $_.Text -or $_.Desc } | ForEach-Object { "$($_.Text)|$($_.Desc)|$($_.Top)" }) -join "`n")
}

function Get-WalkCrashes {
    <#
    .SYNOPSIS
        The crashes and ANRs of -Package (and its own processes, like :mqtt) in logcat lines.
    .DESCRIPTION
        A Java crash is "FATAL EXCEPTION" with "Process: <package>" on one of the next lines. A
        native crash is libc's "Fatal signal" or debuggerd's ">>> <package> <<<" for the same pid,
        which count once. ActivityManager's "ANR in <package>" is an ANR. A process that ends
        because the walk force-stopped it logs none of these.
    #>
    param([AllowEmptyCollection()][string[]]$Lines = @(), [string]$Package = $WalkPackage)
    $seen = @{}
    $crashes = [Collections.Generic.List[object]]::new()
    $ours = {
        param([string]$Name)
        $Name.Split(':')[0] -ceq $Package
    }
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        $line = [string]$Lines[$i]
        $kind = $null; $process = $null; $processId = $null; $detail = $line.Trim()
        if ($line -match 'FATAL EXCEPTION') {
            for ($j = $i + 1; $j -lt [Math]::Min($Lines.Count, $i + 4); $j++) {
                $m = [regex]::Match([string]$Lines[$j], 'Process: ([\w.:]+), PID: (\d+)')
                if ($m.Success) {
                    if (& $ours $m.Groups[1].Value) {
                        $kind = 'java'; $process = $m.Groups[1].Value; $processId = $m.Groups[2].Value
                        if ($j + 1 -lt $Lines.Count) {
                            # The message without logcat's time, pid and tag columns, in the epoch
                            # format the walk reads or the default threadtime one.
                            $message = [regex]::Match([string]$Lines[$j + 1],
                                '^\s*(?:\d+\.\d+|\S+\s+\S+)\s+\d+\s+\d+\s+[VDIWEFA]\s+[^:]*:\s?(.*)$')
                            $detail = if ($message.Success) { $message.Groups[1].Value.Trim() } else { ([string]$Lines[$j + 1]).Trim() }
                        }
                    }
                    break
                }
            }
        } elseif ($line -match 'Fatal signal \d+') {
            $m = [regex]::Match($line, 'pid (\d+) \(([^)]+)\)')
            if ($m.Success -and (& $ours $m.Groups[2].Value)) { $kind = 'native'; $process = $m.Groups[2].Value; $processId = $m.Groups[1].Value }
        } elseif ($line -match '>>> ([\w.:]+) <<<') {
            $name = $Matches[1]
            $m = [regex]::Match($line, 'pid: (\d+)')
            if (& $ours $name) { $kind = 'native'; $process = $name; $processId = if ($m.Success) { $m.Groups[1].Value } else { "line$i" } }
        } elseif ($line -match 'ANR in ([\w.:]+)') {
            if (& $ours $Matches[1]) { $kind = 'anr'; $process = $Matches[1]; $processId = "line$i" }
        }
        if (-not $kind) { continue }
        $key = "$kind|$processId"
        if ($seen.ContainsKey($key)) { continue }
        $seen[$key] = $true
        $crashes.Add([pscustomobject]@{ Kind = $kind; Process = $process; Pid = $processId; Detail = $detail })
    }
    $crashes.ToArray()
}

function Select-WalkLogSince {
    <#
    .SYNOPSIS
        The logcat lines (read with -v epoch) from -Since on. A line with no time of its own, like
        a crash's stack, goes with the line before it.
    #>
    param([AllowEmptyCollection()][string[]]$Lines = @(), [Parameter(Mandatory = $true)][long]$Since)
    $keep = $false
    foreach ($line in $Lines) {
        $stamp = [regex]::Match([string]$line, '^\s*(\d+)\.\d+\s')
        if ($stamp.Success) { $keep = [long]$stamp.Groups[1].Value -ge $Since }
        if ($keep) { $line }
    }
}

function Get-WalkVerdict {
    <#
    .SYNOPSIS
        PASS when every planned screen was reached with no crash and no fault, PARTIAL when the
        walk skipped a screen, FAIL on any crash or fault (Threads died, left the front, or a
        screen wouldn't open).
    #>
    param(
        [AllowEmptyCollection()][string[]]$Planned = @(),
        [AllowEmptyCollection()][string[]]$Reached = @(),
        [AllowEmptyCollection()][object[]]$Crashes = @(),
        [AllowEmptyCollection()][string[]]$Faults = @()
    )
    $missing = @($Planned | Where-Object { $Reached -notcontains $_ })
    $problems = [Collections.Generic.List[string]]::new()
    foreach ($crash in $Crashes) { $problems.Add("$($crash.Kind) crash in $($crash.Process) (pid $($crash.Pid)): $($crash.Detail)") }
    foreach ($fault in $Faults) { $problems.Add($fault) }
    foreach ($screen in $missing) { $problems.Add("not reached: $screen") }
    $full = $Planned.Count -gt 0 -and $missing.Count -eq 0
    $result = if ($Crashes.Count -gt 0 -or $Faults.Count -gt 0 -or $Reached.Count -eq 0) { 'FAIL' }
    elseif (-not $full) { 'PARTIAL' } else { 'PASS' }
    [pscustomobject]@{ Result = $result; Full = $full; Missing = $missing; Problems = $problems.ToArray() }
}
