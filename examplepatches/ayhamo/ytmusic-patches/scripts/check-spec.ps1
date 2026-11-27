# Checks that spec/ here is an exact copy of the extension's spec/ (the master).
#
#   .\scripts\check-spec.ps1                      compare; exit 1 on any difference
#   .\scripts\check-spec.ps1 -Master <path>       the extension's spec/ somewhere else
#
# Line endings don't count (git may check files out with CRLF). To take the extension's
# changes, copy its spec/ over this one and review the diff: a changed golden plan is a
# change in the planner's behaviour, and SpecFixturesTest must then pass against it.
param(
    [string]$Master = (Join-Path $PSScriptRoot "..\..\YT Music Extension\spec")
)
$ErrorActionPreference = "Stop"
$copy = Join-Path $PSScriptRoot "..\spec"
if (-not (Test-Path $Master)) { Write-Error "The extension's spec/ not found at $Master (pass -Master)" }
# no trailing separator, or Get-Files would cut the first letter off every name
$Master = (Resolve-Path $Master).Path.TrimEnd('\', '/')
$copy = (Resolve-Path $copy).Path.TrimEnd('\', '/')

function Get-Files($root) {
    Get-ChildItem -Path $root -Recurse -File | ForEach-Object { $_.FullName.Substring($root.Length + 1).Replace('\', '/') } | Sort-Object
}
function Get-Text($path) {
    [System.IO.File]::ReadAllText($path).Replace("`r`n", "`n")
}

$want = @(Get-Files $Master)
$have = @(Get-Files $copy)
$bad = 0
foreach ($f in $want) {
    if ($have -notcontains $f) { "missing here:  $f"; $bad++ }
    elseif ((Get-Text (Join-Path $Master $f)) -cne (Get-Text (Join-Path $copy $f))) { "differs:       $f"; $bad++ }
}
foreach ($f in $have) {
    if ($want -notcontains $f) { "not in master: $f"; $bad++ }
}
if ($bad) { "spec/ differs from the extension's in $bad file(s)"; exit 1 }
"spec/ matches the extension's ($($want.Count) files)"
