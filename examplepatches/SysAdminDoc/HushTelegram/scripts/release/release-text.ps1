<#
.SYNOPSIS
    The text a release writes: the CHANGELOG cut, the GitHub release notes, the Manager index, the
    bug form's version placeholder and the repository description.

.DESCRIPTION
    Dot-source it. scripts/release/release.ps1 calls these at its stages, and
    scripts/release/test-release-text.ps1 holds them to their contracts. Nothing here runs git, gh
    or Gradle; each function takes text or one file and gives text back or writes that file.

    Files are read with CRLF folded to LF and written as UTF-8 without a byte order mark, LF, the
    way the repository keeps them.
#>

function Read-ReleaseText {
    param([Parameter(Mandatory = $true)][string]$Path)
    return ([IO.File]::ReadAllText($Path) -replace "`r`n", "`n")
}

function Write-ReleaseText {
    param([Parameter(Mandatory = $true)][string]$Path, [Parameter(Mandatory = $true)][string]$Text)
    [IO.File]::WriteAllText($Path, $Text, [Text.UTF8Encoding]::new($false))
}

function Get-ChangelogSection {
    <#
    .SYNOPSIS
        The "## <Name>" section of a CHANGELOG's text, Name being a version or Unreleased: its
        heading line, its date if it has one, its body up to the next level-two heading, and where
        the whole section starts and how long it is. $null when there's no such heading.
    #>
    param([Parameter(Mandatory = $true)][string]$Text, [Parameter(Mandatory = $true)][string]$Name)
    $heading = [regex]::Match($Text, "(?m)^## $([regex]::Escape($Name))(?: \((\d{4}-\d{2}-\d{2})\))?[ \t]*(?:\n|\z)")
    if (-not $heading.Success) { return $null }
    $bodyStart = $heading.Index + $heading.Length
    $next = [regex]::Match($Text.Substring($bodyStart), '(?m)^## ')
    $bodyLength = if ($next.Success) { $next.Index } else { $Text.Length - $bodyStart }
    return [pscustomobject]@{
        Heading = $heading.Value.TrimEnd("`n").TrimEnd()
        Date    = if ($heading.Groups[1].Success) { $heading.Groups[1].Value } else { $null }
        Body    = $Text.Substring($bodyStart, $bodyLength)
        Start   = $heading.Index
        Length  = $heading.Length + $bodyLength
    }
}

function Get-ChangelogBullets {
    <#
    .SYNOPSIS
        A section body's "* " bullets, in order. A bullet that runs onto a second line is refused:
        Morphe Manager reads a scoped bullet one line at a time and drops the rest.
    #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Body)
    $bullets = New-Object System.Collections.Generic.List[string]
    $previousWasBullet = $false
    foreach ($line in ($Body -split "`n")) {
        if ($line.StartsWith('* ')) {
            $bullets.Add($line.TrimEnd())
            $previousWasBullet = $true
            continue
        }
        if ($previousWasBullet -and -not [string]::IsNullOrWhiteSpace($line)) {
            throw "A CHANGELOG bullet runs onto a second line. Join it into one line: $line"
        }
        $previousWasBullet = $false
    }
    return $bullets.ToArray()
}

# The "### " headings a version's section sorts its bullets under, and the heading each gets in the
# GitHub release notes, in the order the notes list them. Tooling bullets go under "Behind the
# scenes" whichever group holds them.
$script:ChangelogGroups = [ordered]@{ 'Added' = 'New in this release'; 'Fixed' = 'Fixes'; 'Changed' = 'Other changes' }

function Get-ChangelogGroups {
    <#
    .SYNOPSIS
        A section body's bullets by the "### Added", "### Changed" or "### Fixed" heading above
        each: an ordered dictionary from group to bullets, groups in the order of
        $ChangelogGroups and bullets in CHANGELOG order. Throws on a bullet above every group
        heading or under any other "### " heading, since the release notes would have nowhere
        to put it.
    #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Body)
    $found = @{}
    $group = $null
    foreach ($line in ($Body -split "`n")) {
        $heading = [regex]::Match($line, '^###\s+(.+?)\s*$')
        if ($heading.Success) {
            $group = $heading.Groups[1].Value
            if (-not $script:ChangelogGroups.Contains($group)) {
                throw "The CHANGELOG section has a ""### $group"" heading. Sort its bullets under ### Added, ### Changed or ### Fixed."
            }
            continue
        }
        if (-not $line.StartsWith('* ')) { continue }
        if (-not $group) {
            throw "A CHANGELOG bullet sits above the section's ### Added, ### Changed and ### Fixed headings. Put it under one: $line"
        }
        if (-not $found.ContainsKey($group)) { $found[$group] = New-Object System.Collections.Generic.List[string] }
        $found[$group].Add($line.TrimEnd())
    }
    $groups = [ordered]@{}
    foreach ($name in $script:ChangelogGroups.Keys) {
        if ($found.ContainsKey($name)) { $groups[$name] = $found[$name].ToArray() }
    }
    return $groups
}

function ConvertTo-NotesBullet {
    <#
    .SYNOPSIS
        A CHANGELOG bullet the way the GitHub release notes show it: "- " and its text, without
        the "**Telegram:**" or "**Tooling:**" scope Manager needs (the repository patches one
        app), and with each bold setting name in backticks.
    #>
    param([Parameter(Mandatory = $true)][string]$Bullet)
    $text = $Bullet -replace '^\* \*\*[^*]+:\*\* ', ''
    return '- ' + [regex]::Replace($text, '\*\*([^*]+)\*\*', '`$1`')
}

function Invoke-ChangelogCut {
    <#
    .SYNOPSIS
        Turns "## Unreleased" into "## <Version> (<Date>)" and says what it did. Run again once the
        heading is there, it changes nothing and says so.
    .DESCRIPTION
        The section keeps its text and bullets as they are, less the "Working version X.Y.Z." line
        source preparation uses. Every bullet has to be one line under ### Added, ### Changed or
        ### Fixed, and there has to be at least one. No new Unreleased heading goes above it: the
        next change adds one.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][string]$Date
    )
    if ($Version -notmatch '^\d+\.\d+\.\d+$') { throw "$Version isn't a version like 0.0.12." }
    if ($Date -notmatch '^\d{4}-\d{2}-\d{2}$') { throw "$Date isn't a date like 2026-10-09." }
    $text = Read-ReleaseText -Path $Path
    $released = Get-ChangelogSection -Text $text -Name $Version
    if ($released) {
        if (-not $released.Date) { throw "The CHANGELOG has a $Version heading with no date. Make it ""## $Version ($Date)""." }
        return "the CHANGELOG already has $($released.Heading)"
    }
    $unreleased = Get-ChangelogSection -Text $text -Name 'Unreleased'
    if (-not $unreleased) { throw 'The CHANGELOG has no "## Unreleased" section to release.' }
    $marker = "^Working version $([regex]::Escape($Version))\.\s*$"
    $body = (@($unreleased.Body -split "`n" | Where-Object { $_ -notmatch $marker }) -join "`n").Trim("`n")
    $bullets = @(Get-ChangelogBullets -Body $body)
    if ($bullets.Count -eq 0) { throw 'The Unreleased section has no bullets to release.' }
    Get-ChangelogGroups -Body $body | Out-Null
    $heading = "## $Version ($Date)"
    $rest = $text.Substring($unreleased.Start + $unreleased.Length)
    $cut = $text.Substring(0, $unreleased.Start) + "$heading`n`n$body`n" + $(if ($rest) { "`n$rest" } else { '' })
    Write-ReleaseText -Path $Path -Text $cut
    return "$($bullets.Count) bullets under $heading"
}

function New-ReleaseNotes {
    <#
    .SYNOPSIS
        The GitHub release notes, laid out like every Hush repository's: the intro, then every
        bullet of the version's CHANGELOG section under New in this release, Fixes and Other
        changes (development-only Tooling bullets under Behind the scenes), a link to the
        CHANGELOG, How to update with the install steps and a note on the .mpp, and What was
        checked.
    .DESCRIPTION
        Each bullet keeps its CHANGELOG words, less its scope, with bold names in backticks
        (ConvertTo-NotesBullet), so none is dropped or reworded. The intro, install and
        validation text is written for each release and passed in. An em or en dash anywhere
        refuses the notes, and so does an undated section or a bullet under no group heading.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Changelog,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][string]$Intro,
        [Parameter(Mandatory = $true)][string]$Install,
        [Parameter(Mandatory = $true)][string]$Validation,
        [Parameter(Mandatory = $true)][string]$Repository
    )
    $section = Get-ChangelogSection -Text ($Changelog -replace "`r`n", "`n") -Name $Version
    if (-not $section -or -not $section.Date) {
        throw "The CHANGELOG has no dated $Version section. Run -Stage prepare first."
    }
    $bullets = @(Get-ChangelogBullets -Body $section.Body)
    if ($bullets.Count -eq 0) { throw "The $Version section has no bullets." }
    $groups = Get-ChangelogGroups -Body $section.Body
    $parts = @(($Intro -replace "`r`n", "`n").Trim())
    $tooling = New-Object System.Collections.Generic.List[string]
    foreach ($group in $groups.Keys) {
        $app = @($groups[$group] | Where-Object { -not $_.StartsWith('* **Tooling:**') })
        foreach ($bullet in @($groups[$group] | Where-Object { $_.StartsWith('* **Tooling:**') })) { $tooling.Add($bullet) }
        if ($app.Count -eq 0) { continue }
        $parts += $script:ChangelogGroups[$group]
        $parts += @($app | ForEach-Object { ConvertTo-NotesBullet $_ })
    }
    if ($tooling.Count -gt 0) {
        $parts += 'Behind the scenes'
        $parts += @($tooling | ForEach-Object { ConvertTo-NotesBullet $_ })
    }
    $parts += @(
        "The [changelog](https://github.com/$Repository/blob/main/CHANGELOG.md) has every earlier release too.",
        'How to update', ($Install -replace "`r`n", "`n").Trim(),
        "The ``.mpp`` download is a patch bundle, not a Telegram APK. [Installation instructions](https://github.com/$Repository#install).",
        'What was checked', ($Validation -replace "`r`n", "`n").Trim())
    $notes = ($parts -join "`n`n") + "`n"
    $dash = [regex]::Match($notes, "[^\n]*[$([char]0x2013)$([char]0x2014)][^\n]*")
    if ($dash.Success) { throw "The release notes carry an em or en dash. Reword it: $($dash.Value)" }
    $missing = @(Get-MissingChangelogBullets -Changelog $Changelog -Version $Version -Notes $notes)
    if ($missing.Count -gt 0) { throw "The notes left out $($missing.Count) of the section's bullets." }
    return $notes
}

function Get-MissingChangelogBullets {
    <#
    .SYNOPSIS
        The bullets of the version's CHANGELOG section that a release body doesn't carry word for
        word, as ConvertTo-NotesBullet writes them. Empty when it carries them all, which is what a
        published release has to do.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Changelog,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][AllowEmptyString()][string]$Notes
    )
    $section = Get-ChangelogSection -Text ($Changelog -replace "`r`n", "`n") -Name $Version
    if (-not $section) { throw "The CHANGELOG has no $Version section." }
    $lines = [Collections.Generic.HashSet[string]]::new([string[]]@(($Notes -replace "`r`n", "`n") -split "`n" |
        ForEach-Object { $_.TrimEnd() }), [StringComparer]::Ordinal)
    return @(Get-ChangelogBullets -Body $section.Body | Where-Object { -not $lines.Contains((ConvertTo-NotesBullet $_)) })
}

function Get-ManagerChanges {
    <#
    .SYNOPSIS
        The part of the Manager description that lists the release's changes: "### What's new"
        and every bullet of the version's CHANGELOG section but the Tooling ones, word for word.
        Empty when the section has only Tooling bullets.
    .DESCRIPTION
        Morphe Manager shows the bundle description, not the CHANGELOG, for the release a phone
        was patched with, and reads a "### " heading and "* **Scope:** text" bullets in it as a
        list of changes. Without them the newest release read as one paragraph while every older
        one listed its changes. validate-release-facts.ps1 reads the description only above its
        first "### " line, since a bullet may name an older build or another patch count.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Changelog,
        [Parameter(Mandatory = $true)][string]$Version
    )
    $section = Get-ChangelogSection -Text ($Changelog -replace "`r`n", "`n") -Name $Version
    if (-not $section -or -not $section.Date) {
        throw "The CHANGELOG has no dated $Version section. Run -Stage prepare first."
    }
    $app = @(Get-ChangelogBullets -Body $section.Body | Where-Object { -not $_.StartsWith('* **Tooling:**') })
    if ($app.Count -eq 0) { return '' }
    return "### What's new`n`n" + ($app -join "`n")
}

function ConvertTo-JsonText {
    <# One JSON string literal, escaped the way pwsh writes patches-bundle.json: quotes,
       backslashes and control characters, and nothing else. #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Value)
    $builder = New-Object System.Text.StringBuilder
    [void]$builder.Append('"')
    foreach ($character in $Value.ToCharArray()) {
        switch ([int]$character) {
            0x22 { [void]$builder.Append('\"'); continue }
            0x5C { [void]$builder.Append('\\'); continue }
            0x0A { [void]$builder.Append('\n'); continue }
            0x0D { [void]$builder.Append('\r'); continue }
            0x09 { [void]$builder.Append('\t'); continue }
            default {
                if ([int]$character -lt 0x20) { [void]$builder.Append(('\u{0:x4}' -f [int]$character)) }
                else { [void]$builder.Append($character) }
            }
        }
    }
    [void]$builder.Append('"')
    return $builder.ToString()
}

function Set-ManagerIndex {
    <#
    .SYNOPSIS
        Writes patches-bundle.json, the index Morphe Manager reads, for a published release.
    .DESCRIPTION
        Its five keys in the order the file has always kept them. created_at is the release's
        publish time in UTC with no Z, which is how Manager's parser wants it, and download_url is
        the release's .mpp asset.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][string]$CreatedAt,
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][string]$Repository
    )
    if ($Version -notmatch '^\d+\.\d+\.\d+$') { throw "$Version isn't a version like 0.0.12." }
    if ($CreatedAt -notmatch '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$') {
        throw "created_at is the UTC publish time with no Z, like 2026-10-08T23:35:35, not $CreatedAt."
    }
    $text = ($Description -replace "`r`n", "`n").Trim()
    if (-not $text) { throw 'The Manager description is empty.' }
    $url = "https://github.com/$Repository/releases/download/v$Version/patches-$Version.mpp"
    $json = "{`n" +
        "  ""created_at"": $(ConvertTo-JsonText $CreatedAt),`n" +
        "  ""description"": $(ConvertTo-JsonText $text),`n" +
        "  ""download_url"": $(ConvertTo-JsonText $url),`n" +
        "  ""signature_download_url"": """",`n" +
        "  ""version"": $(ConvertTo-JsonText $Version)`n" +
        "}`n"
    Write-ReleaseText -Path $Path -Text $json
}

function Set-BugFormVersion {
    <#
    .SYNOPSIS
        Points the bug form's version placeholder at a release: "HushTelegram X on Telegram Y",
        the same wording as the About page's Version row. There has to be exactly one.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][string]$TelegramVersion
    )
    $text = Read-ReleaseText -Path $Path
    $pattern = '(?m)^([ \t]*placeholder: )HushTelegram \d+\.\d+\.\d+ on Telegram \d+(?:\.\d+)*[ \t]*$'
    $found = [regex]::Matches($text, $pattern).Count
    if ($found -ne 1) { throw "The bug form has $found ""HushTelegram X on Telegram Y"" placeholders, not one: $Path" }
    Write-ReleaseText -Path $Path -Text ([regex]::Replace($text, $pattern,
        { param($match) "$($match.Groups[1].Value)HushTelegram $Version on Telegram $TelegramVersion" }))
}

function Test-RepoDescriptionNamesFacts {
    <#
    .SYNOPSIS
        Whether the repository description names a release version, a patch count or a Telegram
        build. One that names none of them has nothing a release can leave stale, so a release
        neither holds it to the catalog nor rewrites it.
    #>
    param([Parameter(Mandatory = $true)][AllowEmptyString()][string]$Description)
    return ($Description -match '\bv\d+\.\d+\.\d+\b' -or $Description -match '(?<![\d.])\d+ patches\b' -or
        $Description -match 'Telegram\s+\d+(?:\.\d+)+(?!\d)')
}

function Get-UpdatedRepoDescription {
    <#
    .SYNOPSIS
        The repository description with this release's version, patch count and Telegram version:
        "HushTelegram vX ... N patches for Telegram Y." One that names none of those comes back as it
        is. Throws when it names some of them without that shape.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][int]$Count,
        [Parameter(Mandatory = $true)][string]$TelegramVersion
    )
    if (-not (Test-RepoDescriptionNamesFacts -Description $Description)) { return $Description }
    if ($Description -notmatch 'HushTelegram v\d+\.\d+\.\d+' -or $Description -notmatch '\b\d+ patches for Telegram \d+(?:\.\d+)*') {
        throw "The repository description doesn't name ""HushTelegram vX"" and ""N patches for Telegram Y"": $Description"
    }
    return ($Description -replace 'HushTelegram v\d+\.\d+\.\d+', "HushTelegram v$Version" `
        -replace '\b\d+ patches for Telegram \d+(?:\.\d+)*', "$Count patches for Telegram $TelegramVersion")
}
