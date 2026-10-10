<#
.SYNOPSIS
    Holds release-text.ps1 to its contracts, and release.ps1 to its stage order.

.DESCRIPTION
    No network, Gradle, Java or gh. The CHANGELOG cut, the release notes, the Manager index, the bug
    form placeholder and the repository description run on scratch files. The index is rebuilt from
    the checkout's own patches-bundle.json and has to come out byte for byte, and the bug form edit
    on a copy of the checkout's own form has to change its placeholder line and nothing else.

    The stage order runs release.ps1 itself, in a child shell, against a scratch repository with
    stage records written by hand: each stage has to refuse to start until the one before it has
    finished, on HEAD where that matters, and nothing may run once the release is published.

    scripts/test-script-contracts.ps1 runs this, and so does release.ps1 -Stage preflight.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
. (Join-Path $PSScriptRoot 'release-text.ps1')

$cases = 0
function Assert-True {
    param([bool]$Condition, [string]$Message)
    $script:cases++
    if (-not $Condition) { throw $Message }
}

function Assert-Throws {
    param([scriptblock]$Action, [string]$Pattern, [string]$Message)
    $script:cases++
    try {
        & $Action | Out-Null
    } catch {
        if ($_.Exception.Message -like $Pattern) { return }
        throw "$Message Threw something else: $($_.Exception.Message)"
    }
    throw "$Message It didn't throw."
}

$scratch = Join-Path ([IO.Path]::GetTempPath()) ('hushtelegram-release-text-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $scratch | Out-Null
try {
    # --- The CHANGELOG cut --------------------------------------------------------------------
    $changelogPath = Join-Path $scratch 'CHANGELOG.md'
    $before = "# Changelog`n`nEvery HushTelegram release, newest first.`n`n## Unreleased`n`nWorking version 0.0.12.`n`n" +
        "* **Telegram:** A new switch.`n`n* **Tooling:** A faster gate.`n`n* **Telegram:** Another fix.`n`n" +
        "## 0.0.11 (2026-10-08)`n`n* **Telegram:** The old release.`n"
    Write-ReleaseText -Path $changelogPath -Text $before
    $said = Invoke-ChangelogCut -Path $changelogPath -Version '0.0.12' -Date '2026-10-20'
    $expected = "# Changelog`n`nEvery HushTelegram release, newest first.`n`n## 0.0.12 (2026-10-20)`n`n" +
        "* **Telegram:** A new switch.`n`n* **Tooling:** A faster gate.`n`n* **Telegram:** Another fix.`n`n" +
        "## 0.0.11 (2026-10-08)`n`n* **Telegram:** The old release.`n"
    $cut = [IO.File]::ReadAllText($changelogPath)
    Assert-True ($cut -ceq $expected) "The cut did not date the Unreleased section and drop the working version line:`n$cut"
    Assert-True ($said -ceq '3 bullets under ## 0.0.12 (2026-10-20)') "The cut did not say what it did: $said"
    $said = Invoke-ChangelogCut -Path $changelogPath -Version '0.0.12' -Date '2026-10-21'
    Assert-True ([IO.File]::ReadAllText($changelogPath) -ceq $expected -and $said -like '*already has ## 0.0.12 (2026-10-20)*') `
        "A second cut changed the file or said something else: $said"
    # CRLF in, LF out, and a section that's the last in the file ends the file once.
    Write-ReleaseText -Path $changelogPath -Text "# Changelog`r`n`r`n## Unreleased`r`n`r`n* **Telegram:** Only one.`r`n"
    Invoke-ChangelogCut -Path $changelogPath -Version '0.0.1' -Date '2026-10-01' | Out-Null
    Assert-True ([IO.File]::ReadAllText($changelogPath) -ceq "# Changelog`n`n## 0.0.1 (2026-10-01)`n`n* **Telegram:** Only one.`n") `
        "The cut of a last section left CR or extra newlines: $([IO.File]::ReadAllText($changelogPath))"
    foreach ($refused in @(
            @{ Text = "# Changelog`n`n## 0.0.11 (2026-10-08)`n`n* **Telegram:** Old.`n"; Pattern = '*no "## Unreleased"*' },
            @{ Text = "## Unreleased`n`nWorking version 0.0.12.`n`n## 0.0.11 (2026-10-08)`n"; Pattern = '*no bullets*' },
            @{ Text = "## Unreleased`n`n* **Telegram:** One bullet`nwrapped onto a second line.`n"; Pattern = '*runs onto a second line*' },
            @{ Text = "## 0.0.12`n`n* **Telegram:** Undated.`n"; Pattern = '*0.0.12 heading with no date*' })) {
        Write-ReleaseText -Path $changelogPath -Text $refused.Text
        Assert-Throws { Invoke-ChangelogCut -Path $changelogPath -Version '0.0.12' -Date '2026-10-20' } $refused.Pattern `
            "The cut went ahead on a CHANGELOG it should refuse ($($refused.Pattern))."
        Assert-True ([IO.File]::ReadAllText($changelogPath) -ceq $refused.Text) 'A refused cut still wrote the file.'
    }

    # --- The release notes --------------------------------------------------------------------
    $intro = "HushTelegram v0.0.12 has 57 patches.`r`n"
    $install = "1. Install Morphe Manager.`n2. Patch Telegram."
    $validation = 'Every test passed.'
    $notes = New-ReleaseNotes -Changelog $expected -Version '0.0.12' -Intro $intro -Install $install -Validation $validation
    $expectedNotes = "HushTelegram v0.0.12 has 57 patches.`n`n## What's new`n`n* **Telegram:** A new switch.`n" +
        "* **Telegram:** Another fix.`n`n### Tooling`n`n* **Tooling:** A faster gate.`n`n## Install`n`n" +
        "1. Install Morphe Manager.`n2. Patch Telegram.`n`n## Validation`n`nEvery test passed.`n"
    Assert-True ($notes -ceq $expectedNotes) "The notes are not the intro, every bullet, the install steps and the validation:`n$notes"
    Assert-True (@(Get-MissingChangelogBullets -Changelog $expected -Version '0.0.12' -Notes $notes).Count -eq 0) `
        'Notes that carry every bullet were found to leave one out.'
    $short = $notes -replace "\* \*\*Telegram:\*\* Another fix\.`n", ''
    $missing = @(Get-MissingChangelogBullets -Changelog $expected -Version '0.0.12' -Notes $short)
    Assert-True ($missing.Count -eq 1 -and $missing[0] -ceq '* **Telegram:** Another fix.') `
        "A body missing one bullet was not caught: $($missing -join '; ')"
    $reworded = $notes -replace 'A new switch\.', 'A new switch!'
    Assert-True (@(Get-MissingChangelogBullets -Changelog $expected -Version '0.0.12' -Notes $reworded).Count -eq 1) `
        'A reworded bullet passed for the CHANGELOG one.'
    Assert-Throws { New-ReleaseNotes -Changelog $expected -Version '0.0.12' -Intro "Fast $([char]0x2014) and safe." `
            -Install $install -Validation $validation } '*em or en dash*' 'Notes with an em dash went out.'
    Assert-Throws { New-ReleaseNotes -Changelog $expected -Version '0.0.13' -Intro $intro -Install $install -Validation $validation } `
        '*no dated 0.0.13 section*' 'Notes were built for a version the CHANGELOG has no section for.'
    Assert-Throws { New-ReleaseNotes -Changelog "## 0.0.12`n`n* **Telegram:** Undated.`n" -Version '0.0.12' -Intro $intro `
            -Install $install -Validation $validation } '*no dated 0.0.12 section*' 'Notes were built from an undated section.'

    # --- The Manager index, rebuilt byte for byte from the checkout's own ---------------------
    $indexPath = Join-Path $Root 'patches-bundle.json'
    $indexText = [IO.File]::ReadAllText($indexPath)
    $index = $indexText | ConvertFrom-Json
    # Read as text: pwsh turns an ISO date in JSON into a DateTime.
    $createdAt = [regex]::Match($indexText, '"created_at": "([^"]+)"').Groups[1].Value
    $repository = [regex]::Match([string]$index.download_url, '^https://github\.com/([^/]+/[^/]+)/releases/').Groups[1].Value
    $rebuilt = Join-Path $scratch 'patches-bundle.json'
    Set-ManagerIndex -Path $rebuilt -Version ([string]$index.version) -CreatedAt $createdAt -Description ([string]$index.description) `
        -Repository $repository
    Assert-True ([IO.File]::ReadAllText($rebuilt) -ceq $indexText) `
        "Set-ManagerIndex did not write the checkout's patches-bundle.json back byte for byte:`n$([IO.File]::ReadAllText($rebuilt))"
    $awkward = "Quotes `"here`", a back\slash, a tab`there.`r`n`r`nSecond paragraph, it's fine."
    Set-ManagerIndex -Path $rebuilt -Version '0.0.12' -CreatedAt '2026-10-20T01:02:03' -Description $awkward -Repository 'Owner/Repo'
    $written = [IO.File]::ReadAllText($rebuilt)
    $read = $written | ConvertFrom-Json
    Assert-True ([string]$read.description -ceq ($awkward -replace "`r`n", "`n") -and
        [string]$read.download_url -ceq 'https://github.com/Owner/Repo/releases/download/v0.0.12/patches-0.0.12.mpp' -and
        $written -like '*"created_at": "2026-10-20T01:02:03",*' -and $written -like '*"signature_download_url": "",*' -and
        $written.EndsWith("}`n")) "The index did not escape or lay out its fields: $written"
    Assert-Throws { Set-ManagerIndex -Path $rebuilt -Version '0.0.12' -CreatedAt '2026-10-20T01:02:03Z' -Description 'x' `
            -Repository 'Owner/Repo' } '*with no Z*' 'The index took a created_at with a Z, which Manager reads wrong.'

    # --- The bug form placeholder, on a copy of the checkout's own form -----------------------
    $formPath = Join-Path $scratch 'bug_report.yml'
    $formText = Read-ReleaseText -Path (Join-Path $Root '.github/ISSUE_TEMPLATE/bug_report.yml')
    Write-ReleaseText -Path $formPath -Text $formText
    Set-BugFormVersion -Path $formPath -Version '9.9.9' -TelegramVersion '13.0.1'
    $beforeLines = @($formText -split "`n")
    $afterLines = @(([IO.File]::ReadAllText($formPath)) -split "`n")
    $changed = @(for ($i = 0; $i -lt [Math]::Max($beforeLines.Count, $afterLines.Count); $i++) {
        if ($beforeLines[$i] -cne $afterLines[$i]) { $afterLines[$i] }
    })
    Assert-True ($beforeLines.Count -eq $afterLines.Count -and $changed.Count -eq 1 -and
        $changed[0] -match '^\s*placeholder: HushTelegram 9\.9\.9 on Telegram 13\.0\.1$') `
        "The bug form edit changed more than its version placeholder: $($changed -join ' | ')"
    Write-ReleaseText -Path $formPath -Text "body:`n  - type: input`n    attributes:`n      placeholder: Something else`n"
    Assert-Throws { Set-BugFormVersion -Path $formPath -Version '9.9.9' -TelegramVersion '13.0.1' } '*0 "HushTelegram X on Telegram Y" placeholders*' `
        'A form with no version placeholder was edited anyway.'

    # --- The repository description -----------------------------------------------------------
    $description = 'HushTelegram v0.0.11: Morphe patches for Telegram. 55 patches for Telegram 12.10.6.'
    $updated = Get-UpdatedRepoDescription -Description $description -Version '0.0.12' -Count 57 -TelegramVersion '12.10.7'
    Assert-True ($updated -ceq 'HushTelegram v0.0.12: Morphe patches for Telegram. 57 patches for Telegram 12.10.7.') `
        "The description did not take the version, count and Telegram version: $updated"
    Assert-Throws { Get-UpdatedRepoDescription -Description 'Patches for Telegram.' -Version '0.0.12' -Count 57 -TelegramVersion '12.10.7' } `
        '*doesn''t name*' 'A description of another shape was rewritten anyway.'

    # --- release.ps1's stage order --------------------------------------------------------------
    # A scratch repository with one commit, so HEAD is real, and records written by hand. git and
    # the child shell run with no GIT_* variables: a pre-push hook sets GIT_DIR, which would point
    # every git call here at the repository being pushed.
    $repo = Join-Path $scratch 'repo'
    New-Item -ItemType Directory -Path $repo | Out-Null
    $savedGit = @{}
    foreach ($variable in @(Get-ChildItem Env: | Where-Object { $_.Name -like 'GIT_*' })) {
        $savedGit[$variable.Name] = $variable.Value
        Remove-Item -LiteralPath ('Env:\' + $variable.Name)
    }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        Set-Content -LiteralPath (Join-Path $repo 'README.md') -Value 'scratch' -Encoding ASCII
        git -C $repo init -q 2>&1 | Out-Null
        git -C $repo -c user.name=release-test -c user.email=release-test@example.invalid -c commit.gpgsign=false `
            add README.md 2>&1 | Out-Null
        git -C $repo -c user.name=release-test -c user.email=release-test@example.invalid -c commit.gpgsign=false `
            commit -q -m scratch 2>&1 | Out-Null
        $head = "$(git -C $repo rev-parse HEAD)".Trim()
    } finally {
        $ErrorActionPreference = $preference
    }
    Assert-True ($head -match '^[0-9a-f]{40}$') "The scratch repository has no commit: $head"
    $records = Join-Path $repo 'build/release-assets/9.9.9/stages'
    function Set-StageRecord([string]$Name, [string]$Commit) {
        New-Item -ItemType Directory -Force -Path $records | Out-Null
        Write-ReleaseText -Path (Join-Path $records "$Name.json") -Text (([ordered]@{ stage = $Name; version = '9.9.9'
            commit = $Commit } | ConvertTo-Json) + "`n")
    }
    # The child shell's own error view wraps a long message across lines, so a small runner catches
    # the refusal and prints its message whole.
    $shell = (Get-Process -Id $PID).Path
    $runner = Join-Path $scratch 'run-stage.ps1'
    Write-ReleaseText -Path $runner -Text (@(
        'param([string]$Release, [string]$Stage, [string]$Root)',
        'try {',
        '    & $Release -Stage $Stage -Version 9.9.9 -Root $Root *>&1 | ForEach-Object { "$_" }',
        '} catch {',
        '    "REFUSED: $($_.Exception.Message)"',
        '    exit 1',
        '}',
        'exit 0') -join "`n")
    function Invoke-Stage([string]$Name) {
        $preference = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $global:LASTEXITCODE = 0
            $output = @(& $shell -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $runner `
                -Release (Join-Path $PSScriptRoot 'release.ps1') -Stage $Name -Root $repo 2>&1 | ForEach-Object { "$_" }) -join "`n"
            return [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = $output }
        } finally {
            $ErrorActionPreference = $preference
        }
    }
    try {
        $other = '0' * 40
        foreach ($step in @(
                @{ Stage = 'preflight'; Pattern = '*-Stage prepare hasn''t finished for 9.9.9*' },
                @{ Stage = 'build'; Pattern = '*-Stage preflight hasn''t finished for 9.9.9*' },
                @{ Stage = 'publish'; Pattern = '*-Stage build hasn''t finished for 9.9.9*' },
                @{ Stage = 'index'; Pattern = '*-Stage publish hasn''t finished for 9.9.9*' },
                @{ Stage = 'build'; Record = 'preflight'; Pattern = "*-Stage preflight finished on 00000000, and HEAD is $($head.Substring(0, 8))*" },
                @{ Stage = 'publish'; Record = 'build'; Pattern = "*-Stage build finished on 00000000, and HEAD is $($head.Substring(0, 8))*" },
                @{ Stage = 'prepare'; Record = 'publish'; Pattern = '*v9.9.9 is published, so its assets are final*' })) {
            if ($step.Record) { Set-StageRecord -Name $step.Record -Commit $other }
            $ran = Invoke-Stage $step.Stage
            Assert-True ($ran.ExitCode -ne 0 -and $ran.Output -like "*REFUSED: $($step.Pattern.TrimStart('*'))") `
                "release.ps1 -Stage $($step.Stage) did not refuse to run out of order (exit $($ran.ExitCode)): $($ran.Output)"
        }
        $left = (@(Get-ChildItem -LiteralPath $records -File | ForEach-Object { $_.Name } | Sort-Object) -join ',')
        Assert-True ($left -ceq 'build.json,preflight.json,publish.json') "A refused stage wrote a record of its own: $left"
    } finally {
        foreach ($name in $savedGit.Keys) { Set-Item -LiteralPath ('Env:\' + $name) -Value $savedGit[$name] }
    }
} finally {
    Remove-Item -LiteralPath $scratch -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Host "[release] release text and stage order contracts passed ($cases cases)"
# The stage order cases end on release.ps1 runs that refuse, and a caller reads their exit code
# as this script's own unless it says otherwise.
exit 0
