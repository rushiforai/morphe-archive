<#
.SYNOPSIS
    Runs the release text tests in tools/ for the pre-push gate.
.DESCRIPTION
    tools/release_text.py writes the CHANGELOG cut, the version bump, the GitHub notes and the
    index for scripts/release/release.ps1, and tools/test_release_text.py holds it to that. The
    gate runs this when either moves, or when the release stages do.
#>
[CmdletBinding()]
param([string]$Root)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$tools = Join-Path $Root 'tools'

# A shell opened before the Python launcher was installed doesn't have it on PATH. Its default
# per-user place is tried next, and with neither there the run fails rather than passing unrun.
$py = (Get-Command py -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1).Source
if (-not $py -and $env:LOCALAPPDATA) {
    $launcher = Join-Path $env:LOCALAPPDATA 'Programs/Python/Launcher/py.exe'
    if (Test-Path -LiteralPath $launcher -PathType Leaf) { $py = $launcher }
}
if (-not $py) { throw 'The Python launcher (py) is not on PATH, so the release text tests cannot run.' }

# unittest reports on stderr even when every test passes, which Windows PowerShell turns into a
# terminating error under Stop when a caller redirects it. The exit code is the verdict.
$ErrorActionPreference = 'Continue'
$global:LASTEXITCODE = 0
& $py -3.13 -I -m unittest discover -s $tools -p 'test_*.py'
$code = $LASTEXITCODE
$ErrorActionPreference = 'Stop'
if ($code -ne 0) { throw "The release text tests in $tools did not pass (exit $code)." }
Write-Host '[release-text] release text tests passed'
