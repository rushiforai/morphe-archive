<#
.SYNOPSIS
    Check translation imports and hosted setup before pushing catalog changes.
.NOTES
    Copyright 2026 HushGram contributors. GPL-3.0-only.
    https://github.com/SysAdminDoc/HushGram
#>
[CmdletBinding()]
param([string]$Root = (Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = 'Stop'
foreach ($suite in @('test-l10n.py', 'test-crowdin-l10n.py')) {
    $path = Join-Path $Root "scripts/$suite"
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "Missing translation suite: $suite" }
    & py -3.13 -B $path
    if ($LASTEXITCODE -ne 0) { throw "$suite failed ($LASTEXITCODE)." }
}
