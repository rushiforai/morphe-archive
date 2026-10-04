<#
.SYNOPSIS
    The advisory gate: what OSV knows about the libraries a release's SBOM lists, and whether the
    release may go out with them.

.DESCRIPTION
    Dot-sourced by build-release-receipt.ps1 and validate-release-facts.ps1, beside
    release-receipt.ps1, whose Read-ReleaseSbom reads the SBOM these functions take.

    Gradle's dependency verification (gradle/verification-metadata.xml) says an artifact is the one
    somebody checked the hash of. It says nothing about the advisories published against that
    version since, and the libraries a bundle carries are chosen by conflict resolution several
    levels down, so nobody reads them one by one. This asks OSV (https://api.osv.dev/v1/query)
    about every library the SBOM lists, one query per package URL, and refuses a release that
    carries a high or critical advisory.

    High or critical means OSV's own label says so (the GitHub advisory database's, which every
    Maven advisory there carries) or a CVSS 3 vector scores 7.0 or more, whichever is worse. An
    advisory with neither, or with any unsupported or malformed vector, is held until somebody
    reads it. A lower label can't dismiss a CVSS 4 vector this gate doesn't score. Moderate and
    low advisories with fully supported severity data are printed and let through.

    An advisory can be accepted in scripts/advisory-exceptions.txt for one package, until a date
    at most 90 days out, with the reason it doesn't apply to what the bundle does with that
    library. An exception past its date covers nothing, and one that matches no advisory any more
    fails the run, as the manifest allowlist does: an exception that outlives its advisory stops
    being a review.

    OSV has to answer. A query that fails, or an answer this can't read, stops the run rather than
    reading as no advisories. -SkipAdvisoryCheck is the way through for offline work, and it says
    so in a warning. The pre-push hook never passes it, so the index push that hands a release to
    Manager users asks OSV again.
#>

function Read-AdvisoryExceptions {
    <#
    .SYNOPSIS
        The accepted advisories, one per line: "<advisory> <group>:<name> <yyyy-MM-dd> <reason>".
    .DESCRIPTION
        The advisory is OSV's id or one of its aliases (a CVE, say). The date is the last day the
        exception holds on this computer's calendar (-Today defaults to the local date, not UTC's),
        at most 90 days after -Today, so accepting an advisory means reading it
        again at least that often. The reason is at least three words: an exception is a claim
        about how the bundle uses the library, and a claim nobody wrote down can't be checked.
        Blank lines and # comments are ignored. A line in any other shape stops the run, naming
        it, rather than being skipped: a skipped exception would fail the release for a reason
        nobody could see in the file.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Path,
        [datetime]$Today = [datetime]::Today
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "The advisory exception list is missing: $Path"
    }
    $entries = New-Object System.Collections.Generic.List[object]
    $seen = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $number = 0
    foreach ($line in Get-Content -LiteralPath $Path) {
        $number++
        $text = ([string]$line).Trim()
        if (-not $text -or $text.StartsWith('#')) { continue }
        $shape = [regex]::Match($text,
            '^(?<id>[A-Za-z][A-Za-z0-9]*-[A-Za-z0-9._-]+)\s+(?<package>[A-Za-z0-9_.-]+:[A-Za-z0-9_.-]+)\s+(?<until>\S+)\s+(?<reason>.*\S)$')
        if (-not $shape.Success) {
            throw ("Line $number of $Path is not ""<advisory> <group>:<name> <yyyy-MM-dd> <reason>"": $text")
        }
        $until = [datetime]::MinValue
        if (-not [datetime]::TryParseExact($shape.Groups['until'].Value, 'yyyy-MM-dd',
                [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::None, [ref]$until)) {
            throw "Line $number of $Path gives $($shape.Groups['until'].Value) as the last day, which isn't a yyyy-MM-dd date: $text"
        }
        $advisory = $shape.Groups['id'].Value
        $package = $shape.Groups['package'].Value
        if ($until -gt $Today.AddDays(90)) {
            throw ("Line $number of $Path accepts $advisory for $package until $($until.ToString('yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture)), more than " +
                "90 days out. Read the advisory again when the date comes, and give it a date within 90 days.")
        }
        $reason = $shape.Groups['reason'].Value
        if (@($reason -split '\s+' | Where-Object { $_ -match '[A-Za-z]' }).Count -lt 3) {
            throw ("Line $number of $Path accepts $advisory for $package without saying why. Give the reason it " +
                "doesn't apply to what the bundle does with the library: $text")
        }
        if (-not $seen.Add("$advisory $package")) {
            throw "Line $number of $Path accepts $advisory for $package a second time."
        }
        $entries.Add([pscustomobject]@{
            Advisory = $advisory
            Package  = $package
            Until    = $until
            Reason   = $reason
            Line     = $number
            Expired  = $until -lt $Today
        })
    }
    # No comma wrap: an empty list comes back as nothing, and every caller writes @(...).
    return $entries.ToArray()
}

function Get-Cvss3BaseScore {
    <#
    .SYNOPSIS
        The base score of a CVSS 3.0 or 3.1 vector, or $null for anything else.
    .DESCRIPTION
        The formula and the rounding the CVSS 3.1 specification gives, which 3.0 vectors score the
        same way to one decimal. Temporal and environmental metrics after the base ones are
        ignored, as the base score ignores them. A vector missing a base metric, or with a value
        the specification doesn't define, has no score here rather than a guessed one.
    #>
    param([string]$Vector)

    if ("$Vector" -notmatch '^CVSS:3\.[01]/') { return $null }
    $metrics = @{}
    foreach ($part in @($Vector -split '/' | Select-Object -Skip 1)) {
        if ($part -cnotmatch '^[A-Z]{1,3}:[A-Z]$') { return $null }
        $pair = $part -split ':', 2
        if ($metrics.ContainsKey($pair[0])) { return $null }
        $metrics[$pair[0]] = $pair[1]
    }
    # A metric the vector leaves out reads as '', which neither check below lets through.
    $scopeChanged = $metrics['S'] -ceq 'C'
    if (-not $scopeChanged -and $metrics['S'] -cne 'U') { return $null }
    $weights = @{
        AV = @{ N = 0.85; A = 0.62; L = 0.55; P = 0.2 }
        AC = @{ L = 0.77; H = 0.44 }
        PR = if ($scopeChanged) { @{ N = 0.85; L = 0.68; H = 0.5 } } else { @{ N = 0.85; L = 0.62; H = 0.27 } }
        UI = @{ N = 0.85; R = 0.62 }
        C  = @{ H = 0.56; L = 0.22; N = 0.0 }
        I  = @{ H = 0.56; L = 0.22; N = 0.0 }
        A  = @{ H = 0.56; L = 0.22; N = 0.0 }
    }
    # Optional temporal/environmental metrics don't change the base score, but still have to
    # be valid CVSS 3 metrics. Otherwise the gate would rate a malformed vector as trustworthy.
    $optional = @{
        E = 'XUPFH'; RL = 'XOTWU'; RC = 'XURC'; CR = 'XHML'; IR = 'XHML'; AR = 'XHML'
        MAV = 'XNALP'; MAC = 'XLH'; MPR = 'XNLH'; MUI = 'XNR'; MS = 'XUC'
        MC = 'XHLN'; MI = 'XHLN'; MA = 'XHLN'
    }
    foreach ($name in $metrics.Keys) {
        if ($name -ceq 'S' -or $weights.ContainsKey($name)) { continue }
        if (-not $optional.ContainsKey($name) -or $optional[$name].IndexOf([string]$metrics[$name]) -lt 0) {
            return $null
        }
    }
    $value = @{}
    foreach ($name in $weights.Keys) {
        $letter = [string]$metrics[$name]
        # Case matters in a vector, and a hashtable's keys don't.
        if ($letter -cnotmatch '^[A-Z]$' -or -not $weights[$name].ContainsKey($letter)) { return $null }
        $value[$name] = [double]$weights[$name][$letter]
    }

    $iss = 1 - ((1 - $value['C']) * (1 - $value['I']) * (1 - $value['A']))
    $impact = if ($scopeChanged) {
        7.52 * ($iss - 0.029) - 3.25 * [Math]::Pow($iss - 0.02, 15)
    } else {
        6.42 * $iss
    }
    if ($impact -le 0) { return 0.0 }
    $exploitability = 8.22 * $value['AV'] * $value['AC'] * $value['PR'] * $value['UI']
    $raw = if ($scopeChanged) { [Math]::Min(1.08 * ($impact + $exploitability), 10) } else {
        [Math]::Min($impact + $exploitability, 10)
    }
    # Roundup as 3.1 defines it: through an integer, so 4.000000001 doesn't become 4.1.
    $scaled = [long][Math]::Round($raw * 100000, [MidpointRounding]::AwayFromZero)
    if ($scaled % 10000 -eq 0) { return $scaled / 100000.0 }
    return ([Math]::Floor($scaled / 10000) + 1) / 10.0
}

function Test-AdvisoryObject {
    param($Value)
    return ($Value -is [System.Collections.IDictionary] -or $Value -is [System.Management.Automation.PSCustomObject])
}

function Test-AdvisoryField {
    param($Value, [string]$Name)
    if ($Value -is [System.Collections.IDictionary]) { return $Value.Contains($Name) }
    if ($Value -is [System.Management.Automation.PSCustomObject]) { return $null -ne $Value.PSObject.Properties[$Name] }
    return $false
}

function Get-AdvisorySeverity {
    <#
    .SYNOPSIS
        How serious an OSV advisory is: @{ Level; Serious; Why }.
    .DESCRIPTION
        The worse of OSV's own label (database_specific.severity) and the level each applicable CVSS 3 vector
        scores to: CRITICAL from 9.0, HIGH from 7.0, MODERATE from 4.0, LOW above 0. Serious is
        HIGH or CRITICAL, or UNRATED for incomplete severity data. Any unsupported or malformed
        vector requires review even beside a LOW/MODERATE label or a lower supported vector.
        CVSS 4 isn't sent to the CVSS 3 calculator.
    #>
    param([Parameter(Mandatory = $true)]$Advisory, $Library)

    $rank = @{ NONE = 0; LOW = 1; MODERATE = 2; HIGH = 3; CRITICAL = 4 }
    $level = $null
    $why = $null
    $review = $false
    if (-not (Test-AdvisoryObject $Advisory)) { $review = $true }
    $label = ''
    if (Test-AdvisoryField $Advisory 'database_specific') {
        $database = $Advisory.database_specific
        if (-not (Test-AdvisoryObject $database)) { $review = $true }
        elseif (Test-AdvisoryField $database 'severity') {
            if ($database.severity -is [string]) { $label = $database.severity.Trim().ToUpperInvariant() }
            if (-not $label) { $review = $true }
        }
    }
    if ($label -eq 'MEDIUM') { $label = 'MODERATE' }
    if ($label -and $rank.ContainsKey($label)) {
        $level = $label
        $why = "OSV rates it $label"
    } elseif ($label) {
        $review = $true
    }
    $scopes = New-Object System.Collections.Generic.List[object]
    $scopes.Add($Advisory)
    $hasAffected = Test-AdvisoryField $Advisory 'affected'
    if ($hasAffected -and $Advisory.affected -isnot [array]) { $review = $true }
    foreach ($affected in $Advisory.affected) {
        if (-not (Test-AdvisoryObject $affected)) { $review = $true; continue }
        $hasSeverity = Test-AdvisoryField $affected 'severity'
        if ($null -eq $Library -or -not (Test-AdvisoryObject $affected.package) -or
                $affected.package.ecosystem -isnot [string] -or $affected.package.name -isnot [string] -or
                [string]::IsNullOrWhiteSpace($affected.package.ecosystem) -or
                [string]::IsNullOrWhiteSpace($affected.package.name)) { $review = $true; continue }
        # OSV identifies Maven packages by their case-sensitive ecosystem and group:name.
        if ($affected.package.name -cne "$($Library.Group):$($Library.Name)" -and $affected.package.name -cne '*') { continue }
        if ($affected.package.ecosystem -cne 'Maven') {
            # The SBOM has no repository identity to prove a Maven:<repository> scope unrelated.
            if ($affected.package.ecosystem.StartsWith('Maven:', [StringComparison]::Ordinal)) { $review = $true }
            continue
        }
        $rangeApplies = $false
        $rangeReview = $false
        $hasVersions = Test-AdvisoryField $affected 'versions'
        $hasRanges = Test-AdvisoryField $affected 'ranges'
        if (-not $hasVersions -and -not $hasRanges) { $rangeReview = $true }
        if ($hasVersions) {
            if ($affected.versions -isnot [array]) { $rangeReview = $true }
            else {
                foreach ($listed in $affected.versions) {
                    if ($listed -isnot [string] -or [string]::IsNullOrWhiteSpace($listed) -or $listed -match '\s|\p{Cc}') {
                        $rangeReview = $true
                    } elseif ($listed -ceq $Library.Version) { $rangeApplies = $true }
                }
            }
        }
        $protocol = New-Object System.Collections.Generic.List[string]
        $protocol.Add([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($Library.Version)))
        $ranges = @()
        if ($hasRanges -and $affected.ranges -isnot [array]) { $rangeReview = $true }
        elseif ($affected.ranges -is [array]) { $ranges = $affected.ranges }
        foreach ($range in $ranges) {
            if (-not (Test-AdvisoryObject $range) -or
                    $range.type -isnot [string] -or $range.type -cne 'ECOSYSTEM' -or
                    $range.events -isnot [array] -or $range.events.Count -eq 0) { $rangeReview = $true; continue }
            $events = New-Object System.Collections.Generic.List[string]
            $kinds = @()
            $invalid = $false
            foreach ($event in $range.events) {
                if ($event -is [System.Collections.IDictionary]) { $names = @($event.Keys) }
                elseif ($event -is [System.Management.Automation.PSCustomObject]) { $names = @($event.PSObject.Properties.Name) }
                else { $invalid = $true; continue }
                if ($names.Count -ne 1 -or $names[0] -cnotin @('introduced', 'fixed', 'last_affected', 'limit')) {
                    $invalid = $true; continue
                }
                $kind = [string]$names[0]
                $value = $event.$kind
                if ($value -isnot [string] -or [string]::IsNullOrWhiteSpace($value) -or $value -match '\s|\p{Cc}' -or
                        ($kind -cne 'limit' -and $value.Contains('*'))) { $invalid = $true; continue }
                $kinds += $kind
                $events.Add($kind + ' ' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($value)))
            }
            if ($invalid -or $kinds -cnotcontains 'introduced' -or
                    ($kinds -ccontains 'fixed' -and $kinds -ccontains 'last_affected')) { $rangeReview = $true; continue }
            $protocol.AddRange($events)
            $protocol.Add('.')
        }
        if ($protocol.Count -gt 1) {
            $jar = Join-Path $PSScriptRoot '../build/advisory-tool/maven-artifact.jar'
            if (-not (Test-Path -LiteralPath $jar -PathType Leaf)) {
                throw 'The Maven advisory comparator is missing. Run ./gradlew prepareAdvisoryTool before the release checks.'
            }
            . (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
            $java = Resolve-Java
            $answer = @($protocol | & $java '--class-path' $jar (Join-Path $PSScriptRoot 'MavenAdvisoryRanges.java'))
            if ($LASTEXITCODE -ne 0 -or $answer.Count -ne 1 -or $answer[0] -cnotin @('true', 'false')) {
                throw 'The Maven advisory comparator did not return a readable range result.'
            }
            if ($answer[0] -ceq 'true') { $rangeApplies = $true }
        }
        if ($rangeReview) { $review = $true }
        if (-not $rangeApplies) { continue }
        if ($hasSeverity) { $scopes.Add($affected) }
    }
    foreach ($scope in $scopes) {
        if (-not (Test-AdvisoryObject $scope)) { $review = $true; continue }
        $hasSeverity = Test-AdvisoryField $scope 'severity'
        if ($hasSeverity -and $scope.severity -isnot [array]) { $review = $true }
        foreach ($entry in $scope.severity) {
            if (-not (Test-AdvisoryObject $entry) -or
                    $entry.type -isnot [string] -or $entry.score -isnot [string]) { $review = $true; continue }
            $vector = $entry.score
            if ("$($entry.type)" -cne 'CVSS_V3' -or $vector -cnotmatch '^CVSS:3\.[01]/') {
                $review = $true
                continue
            }
            $score = Get-Cvss3BaseScore -Vector $vector
            if ($null -eq $score) { $review = $true; continue }
            $scored = if ($score -ge 9.0) { 'CRITICAL' } elseif ($score -ge 7.0) { 'HIGH' } elseif ($score -ge 4.0) {
                'MODERATE' } elseif ($score -gt 0) { 'LOW' } else { 'NONE' }
            if ($null -eq $level -or $rank[$scored] -gt $rank[$level]) {
                $level = $scored
                $why = "its CVSS 3 vector scores $score"
            }
        }
    }
    if ($review) {
        $held = if ($null -ne $level -and $rank[$level] -ge 3) { $level } else { 'UNRATED' }
        return [pscustomobject]@{ Level = $held; Serious = $true
            Why = 'OSV gives it no severity this check can fully read. An unsupported or malformed label/vector or version range requires review' }
    }
    if ($null -eq $level) {
        return [pscustomobject]@{ Level = 'UNRATED'; Serious = $true
            Why = 'OSV gives it no severity this check can read, so it counts as serious until somebody reads it' }
    }
    return [pscustomobject]@{ Level = $level; Serious = $rank[$level] -ge 3; Why = $why }
}

function Invoke-OsvQuery {
    <#
    .SYNOPSIS
        Every advisory OSV has for one package URL, following its pages.
    .DESCRIPTION
        OSV answers {} for a package it knows nothing about, and for a package URL it can't read
        at all, which is why Read-ReleaseSbom refuses a malformed one before it gets here. Anything
        that isn't a query result throws, and so does a failed request: the gate fails closed.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$Purl,
        [string]$Endpoint = 'https://api.osv.dev/v1/query'
    )

    $found = New-Object System.Collections.Generic.List[object]
    # Preserve JSON strings before validating their types. Invoke-RestMethod converts date-like
    # strings on PowerShell 7, including summaries and IDs as well as withdrawal timestamps.
    $jsonArguments = @{ ErrorAction = 'Stop' }
    if ((Get-Command ConvertFrom-Json).Parameters.ContainsKey('DateKind')) {
        $jsonArguments['DateKind'] = 'String'
    } elseif ($PSVersionTable.PSVersion.Major -ge 6) {
        throw 'The advisory check needs PowerShell 7.5 or newer, or Windows PowerShell 5.1, to preserve JSON string types.'
    }
    $token = $null
    for ($page = 0; $page -lt 20; $page++) {
        $query = [ordered]@{ package = [ordered]@{ purl = $Purl } }
        if ($token) { $query['page_token'] = $token }
        try {
            $body = [Text.Encoding]::UTF8.GetBytes(($query | ConvertTo-Json -Compress -Depth 4))
            $response = Invoke-WebRequest -UseBasicParsing -Uri $Endpoint -Method Post -ContentType 'application/json; charset=utf-8' `
                -Body $body -TimeoutSec 60
        } catch {
            throw ("OSV could not be asked about ${Purl}: $($_.Exception.Message). The advisory check fails " +
                'closed, so nothing goes out on a check that did not run. Check the connection to api.osv.dev ' +
                'and run it again, or pass -SkipAdvisoryCheck to work offline: the index push asks OSV again.')
        }
        try {
            # Windows PowerShell otherwise assumes Latin-1 when application/json has no charset.
            if ($response.RawContentStream -is [IO.Stream]) {
                $bytes = [IO.MemoryStream]::new()
                try {
                    if ($response.RawContentStream.CanSeek) { [void]$response.RawContentStream.Seek(0, [IO.SeekOrigin]::Begin) }
                    $response.RawContentStream.CopyTo($bytes)
                    $content = [Text.UTF8Encoding]::new($false, $true).GetString($bytes.ToArray())
                } finally {
                    $bytes.Dispose()
                    $response.RawContentStream.Dispose()
                }
            } elseif ($response.Content -is [byte[]]) {
                $content = [Text.UTF8Encoding]::new($false, $true).GetString($response.Content)
            } else { $content = $response.Content }
            # ConvertFrom-Json may enumerate a root array into a single object on the pipeline.
            if ($content -isnot [string] -or -not $content.TrimStart().StartsWith('{')) { throw 'Expected a JSON object.' }
            $answer = $content | ConvertFrom-Json @jsonArguments
        } catch {
            throw "OSV answered the query about $Purl with something that isn't a query result: $($_.Exception.Message)"
        }
        if ($answer -isnot [System.Management.Automation.PSCustomObject]) {
            throw "OSV answered the query about $Purl with something that isn't a query result: $answer"
        }
        if ((Test-AdvisoryField $answer 'vulns') -and $answer.vulns -isnot [array]) {
            throw "OSV answered the query about $Purl with a malformed vulnerability list."
        }
        foreach ($advisory in $answer.vulns) {
            if (-not (Test-AdvisoryObject $advisory)) {
                throw "OSV answered the query about $Purl with a malformed advisory object."
            }
            if ($advisory.id -isnot [string] -or [string]::IsNullOrWhiteSpace($advisory.id)) {
                throw "OSV answered the query about $Purl with an advisory that has no id."
            }
            if (Test-AdvisoryField $advisory 'aliases') {
                if ($advisory.aliases -isnot [array]) {
                    throw "OSV answered the query about $Purl with malformed advisory aliases."
                }
                foreach ($alias in $advisory.aliases) {
                    if ($alias -isnot [string] -or [string]::IsNullOrWhiteSpace($alias)) {
                        throw "OSV answered the query about $Purl with a malformed advisory alias."
                    }
                }
            }
            if ((Test-AdvisoryField $advisory 'summary') -and $advisory.summary -isnot [string]) {
                throw "OSV answered the query about $Purl with a malformed advisory summary."
            }
            # A withdrawn advisory is one its publisher took back.
            if (Test-AdvisoryField $advisory 'withdrawn') {
                $withdrawn = $advisory.withdrawn
                if ($withdrawn -isnot [string] -or $withdrawn -cnotmatch
                        '\A[0-9]{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])[Tt](?:[01][0-9]|2[0-3]):[0-5][0-9]:(?:[0-5][0-9]|60)(?:\.[0-9]+)?[Zz]\z') {
                    throw "OSV answered the query about $Purl with a malformed withdrawn timestamp."
                }
                $year = [int]$withdrawn.Substring(0, 4)
                $month = [int]$withdrawn.Substring(5, 2)
                $day = [int]$withdrawn.Substring(8, 2)
                # The proleptic Gregorian year 0000 is a leap year, while DateTime starts at 1.
                $calendarYear = if ($year -eq 0) { 400 } else { $year }
                if ($day -gt [datetime]::DaysInMonth($calendarYear, $month) -or
                        ($withdrawn.Substring(17, 2) -eq '60' -and
                        ($withdrawn.Substring(11, 5) -ne '23:59' -or
                        -not (($month -eq 6 -and $day -eq 30) -or ($month -eq 12 -and $day -eq 31))))) {
                    throw "OSV answered the query about $Purl with a malformed withdrawn timestamp."
                }
                continue
            }
            $found.Add($advisory)
        }
        if ((Test-AdvisoryField $answer 'next_page_token') -and $answer.next_page_token -isnot [string]) {
            throw "OSV answered the query about $Purl with a malformed page token."
        }
        $token = $answer.next_page_token
        if (-not $token) { return $found.ToArray() }
    }
    throw "OSV was still paging its answer about $Purl after 20 pages."
}

function Get-SbomAdvisories {
    <#
    .SYNOPSIS
        One finding per advisory OSV has for a library the SBOM lists.
    .DESCRIPTION
        Each: @{ Package; Version; Purl; Advisory; Aliases; Summary; Severity }. First-party
        components carry no package URL and have nothing to ask about.
    #>
    param([Parameter(Mandatory = $true)]$Sbom)

    $findings = New-Object System.Collections.Generic.List[object]
    foreach ($library in @($Sbom.Libraries)) {
        foreach ($advisory in @(Invoke-OsvQuery -Purl $library.Purl)) {
            $findings.Add([pscustomobject]@{
                Package  = "$($library.Group):$($library.Name)"
                Version  = $library.Version
                Purl     = $library.Purl
                Advisory = [string]$advisory.id
                Aliases  = @($advisory.aliases | Where-Object { $_ } | ForEach-Object { [string]$_ })
                Summary  = "$($advisory.summary)".Trim()
                Severity = Get-AdvisorySeverity -Advisory $advisory -Library $library
            })
        }
    }
    return $findings.ToArray()
}

function Test-AdvisoryFindings {
    <#
    .SYNOPSIS
        Whether a release may go out with these findings and these exceptions.
    .DESCRIPTION
        Answers @{ Valid; Reason; Refused; Excused; Minor; Stale }, the last four as the lines to
        print. A serious finding needs an exception naming its advisory, or one of the advisory's
        aliases, and its package, dated today or later. An exception that matches no finding at
        all, of any severity, is stale and refused too.
    #>
    param(
        [object[]]$Findings = @(),
        [object[]]$Exceptions = @()
    )

    $findingsIn = @(@($Findings) | Where-Object { $null -ne $_ })
    $exceptionsIn = @(@($Exceptions) | Where-Object { $null -ne $_ })
    $refused = New-Object System.Collections.Generic.List[string]
    $excused = New-Object System.Collections.Generic.List[string]
    $minor = New-Object System.Collections.Generic.List[string]
    # By advisory and package, which the reader holds to one line each.
    $used = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

    foreach ($finding in $findingsIn) {
        $names = @(@($finding.Advisory) + @($finding.Aliases))
        $matching = @($exceptionsIn | Where-Object {
            $exception = $_
            [string]::Equals($exception.Package, $finding.Package, [System.StringComparison]::OrdinalIgnoreCase) -and
                @($names | Where-Object { [string]::Equals($_, $exception.Advisory, [System.StringComparison]::OrdinalIgnoreCase) }).Count -gt 0
        })
        foreach ($exception in $matching) { [void]$used.Add("$($exception.Advisory) $($exception.Package)") }
        $aliases = if (@($finding.Aliases).Count -gt 0) { ", $(@($finding.Aliases) -join ', ')" } else { '' }
        $described = ("$($finding.Advisory) ($($finding.Severity.Level)$aliases) in $($finding.Package) " +
            "$($finding.Version): $($finding.Summary)")
        if (-not $finding.Severity.Serious) {
            $minor.Add("$described; $($finding.Severity.Why)")
            continue
        }
        $current = @($matching | Where-Object { -not $_.Expired })
        if ($current.Count -gt 0) {
            $excused.Add("$described; accepted until $($current[0].Until.ToString('yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture)): $($current[0].Reason)")
            continue
        }
        $lapsed = @($matching | Where-Object { $_.Expired })
        if ($lapsed.Count -gt 0) {
            $refused.Add("$described; $($finding.Severity.Why), and its exception ran out on $($lapsed[0].Until.ToString('yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture))")
        } else {
            $refused.Add("$described; $($finding.Severity.Why)")
        }
    }
    $stale = New-Object System.Collections.Generic.List[string]
    foreach ($exception in $exceptionsIn) {
        if (-not $used.Contains("$($exception.Advisory) $($exception.Package)")) {
            $stale.Add("$($exception.Advisory) for $($exception.Package) (line $($exception.Line))")
        }
    }

    $reasons = @()
    if ($refused.Count -gt 0) {
        $reasons += ('OSV reports high or critical advisories for what the bundle carries: ' + ($refused -join '; ') +
            '. Move to a version without them, or accept one in scripts/advisory-exceptions.txt with the reason ' +
            'it does not apply and a date within 90 days.')
    }
    if ($stale.Count -gt 0) {
        $reasons += ('scripts/advisory-exceptions.txt accepts advisories OSV no longer reports for what the bundle ' +
            'carries: ' + ($stale -join '; ') + '. Take them out.')
    }
    return [pscustomobject]@{
        Valid   = $reasons.Count -eq 0
        Reason  = if ($reasons.Count -gt 0) { $reasons -join ' ' } else { $null }
        Refused = $refused.ToArray()
        Excused = $excused.ToArray()
        Minor   = $minor.ToArray()
        Stale   = $stale.ToArray()
    }
}

function Invoke-ReleaseAdvisoryGate {
    <#
    .SYNOPSIS
        Asks OSV about an SBOM's libraries, prints what it said, and throws when the release may
        not go out.
    #>
    param(
        [Parameter(Mandatory = $true)]$Sbom,
        [Parameter(Mandatory = $true)][string]$ExceptionsPath,
        [switch]$SkipAdvisoryCheck,
        [datetime]$Today = [datetime]::Today
    )

    $libraries = @($Sbom.Libraries)
    $sbomName = Split-Path -Leaf $Sbom.Path
    # Read even when OSV isn't asked: a malformed or overlong exception is wrong offline too.
    $exceptions = @(Read-AdvisoryExceptions -Path $ExceptionsPath -Today $Today)
    if ($SkipAdvisoryCheck) {
        Write-Warning ("-SkipAdvisoryCheck: OSV was not asked about the libraries $sbomName lists, so nothing " +
            'here says they have no serious advisory. The index push asks OSV again.')
        return
    }
    if ($libraries.Count -eq 0) {
        Write-Host "[advisories] $sbomName lists no library to ask OSV about"
        return
    }
    $findings = @(Get-SbomAdvisories -Sbom $Sbom)
    $verdict = Test-AdvisoryFindings -Findings $findings -Exceptions $exceptions
    foreach ($line in @($verdict.Minor)) { Write-Host "[advisories] below high, let through: $line" }
    foreach ($line in @($verdict.Excused)) { Write-Host "[advisories] accepted: $line" }
    if (-not $verdict.Valid) { throw $verdict.Reason }
    $packages = @($libraries | ForEach-Object { "$($_.Name) $($_.Version)" }) -join ', '
    $said = if ($findings.Count -eq 0) { 'no advisory' } else { "$($findings.Count) advisories, none refused" }
    Write-Host "[advisories] OSV has $said for the libraries $sbomName lists: $packages"
}
