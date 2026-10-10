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

function Invoke-ChangelogCut {
    <#
    .SYNOPSIS
        Turns "## Unreleased" into "## <Version> (<Date>)" and says what it did. Run again once the
        heading is there, it changes nothing and says so.
    .DESCRIPTION
        The section keeps its text and bullets as they are, less the "Working version X.Y.Z." line
        source preparation uses. Every bullet has to be one line, and there has to be at least one.
        No new Unreleased heading goes above it: the next change adds one.
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
    $heading = "## $Version ($Date)"
    $rest = $text.Substring($unreleased.Start + $unreleased.Length)
    $cut = $text.Substring(0, $unreleased.Start) + "$heading`n`n$body`n" + $(if ($rest) { "`n$rest" } else { '' })
    Write-ReleaseText -Path $Path -Text $cut
    return "$($bullets.Count) bullets under $heading"
}

function New-ReleaseNotes {
    <#
    .SYNOPSIS
        The GitHub release notes: the intro, then every bullet of the version's CHANGELOG section
        under "What's new" (development-only Tooling bullets under their own heading), then the
        install steps and what was validated.
    .DESCRIPTION
        The bullets are copied as the CHANGELOG has them, so none is dropped or reworded. The
        intro, install and validation text is written for each release and passed in. An em or en
        dash anywhere refuses the notes, and so does an undated section.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Changelog,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][string]$Intro,
        [Parameter(Mandatory = $true)][string]$Install,
        [Parameter(Mandatory = $true)][string]$Validation
    )
    $section = Get-ChangelogSection -Text ($Changelog -replace "`r`n", "`n") -Name $Version
    if (-not $section -or -not $section.Date) {
        throw "The CHANGELOG has no dated $Version section. Run -Stage prepare first."
    }
    $bullets = @(Get-ChangelogBullets -Body $section.Body)
    if ($bullets.Count -eq 0) { throw "The $Version section has no bullets." }
    $tooling = @($bullets | Where-Object { $_.StartsWith('* **Tooling:**') })
    $app = @($bullets | Where-Object { -not $_.StartsWith('* **Tooling:**') })
    $parts = @(($Intro -replace "`r`n", "`n").Trim(), "## What's new")
    if ($app.Count -gt 0) { $parts += ($app -join "`n") }
    if ($tooling.Count -gt 0) { $parts += '### Tooling'; $parts += ($tooling -join "`n") }
    $parts += @('## Install', ($Install -replace "`r`n", "`n").Trim(), '## Validation', ($Validation -replace "`r`n", "`n").Trim())
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
        word. Empty when it carries them all, which is what a published release has to do.
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
    return @(Get-ChangelogBullets -Body $section.Body | Where-Object { -not $lines.Contains($_) })
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

function Get-UpdatedRepoDescription {
    <#
    .SYNOPSIS
        The repository description with this release's version, patch count and Telegram version:
        "HushTelegram vX ... N patches for Telegram Y." Throws when it doesn't have that shape.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][string]$Version,
        [Parameter(Mandatory = $true)][int]$Count,
        [Parameter(Mandatory = $true)][string]$TelegramVersion
    )
    if ($Description -notmatch 'HushTelegram v\d+\.\d+\.\d+' -or $Description -notmatch '\b\d+ patches for Telegram \d+(?:\.\d+)*') {
        throw "The repository description doesn't name ""HushTelegram vX"" and ""N patches for Telegram Y"": $Description"
    }
    return ($Description -replace 'HushTelegram v\d+\.\d+\.\d+', "HushTelegram v$Version" `
        -replace '\b\d+ patches for Telegram \d+(?:\.\d+)*', "$Count patches for Telegram $TelegramVersion")
}
