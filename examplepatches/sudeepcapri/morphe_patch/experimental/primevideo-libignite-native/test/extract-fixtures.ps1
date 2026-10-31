# extract-fixtures.ps1 — turn a device capture into replay fixtures.
#
# Reads a logcat file produced by the PVNativeHook diagnostics and rebuilds the
# payloads it dumped. Chunked records are reassembled in part order.
#
# Recognised records:
#   PVREMOTE_FULL   id=<n> index=<i> part=<p>/<t> data=<bytes>
#   PVRESPONSE_FULL id=<n>           part=<p>/<t> ... data=<bytes>
#
# Every future capture becomes a regression fixture, so a bug seen once on the
# device can be reproduced on the host in about one second.
#
# WARNING: extracted payloads contain signed URLs, ad session identifiers, and
# device or account identifiers. Keep them private. Do not commit them.
#
# Usage:
#   .\extract-fixtures.ps1 -LogFile "C:\repos\J\android\apk\prime-video-private.log"
#   .\extract-fixtures.ps1 -LogFile <path> -OutDir .\fixtures-capture

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$LogFile,

    [string]$OutDir = "$PSScriptRoot\fixtures-capture"
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $LogFile)) {
    throw "Log file not found: $LogFile"
}
if (-not (Test-Path -LiteralPath $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir | Out-Null
}

$records = @{}

foreach ($line in Get-Content -LiteralPath $LogFile) {
    if ($line -notmatch '(PVREMOTE_FULL|PVRESPONSE_FULL|PVSCHEDULE_FULL) ') { continue }
    if ($line -notmatch 'id=(?<id>\d+)') { continue }
    $id = $Matches['id']

    $kind = if ($line -match 'PVRESPONSE_FULL') { 'response' }
            elseif ($line -match 'PVSCHEDULE_FULL') { 'schedule' }
            else { 'remote' }

    $part = 1
    if ($line -match 'part=(?<part>\d+)/(?<total>\d+)') { $part = [int]$Matches['part'] }

    $idx = ''
    if ($line -match 'index=(?<index>\d+)') { $idx = $Matches['index'] }

    $dataIndex = $line.IndexOf('data=')
    if ($dataIndex -lt 0) { continue }
    $data = $line.Substring($dataIndex + 5)

    $key = "$kind-$id"
    if (-not $records.ContainsKey($key)) {
        $records[$key] = [ordered]@{ kind = $kind; id = $id; index = $idx; parts = @{} }
    }
    $records[$key].parts[$part] = $data
}

if ($records.Count -eq 0) {
    Write-Host "No PVREMOTE_FULL, PVRESPONSE_FULL, or PVSCHEDULE_FULL records found in $LogFile"
    Write-Host "Capture with: adb logcat -v time -s PVNativeHook:V SkipAdsPatch:V"
    exit 1
}

$written = 0
$seenHashes = @{}

foreach ($key in ($records.Keys | Sort-Object)) {
    $record = $records[$key]
    $ordered = $record.parts.Keys | Sort-Object
    $payload = -join ($ordered | ForEach-Object { $record.parts[$_] })

    # Skip duplicates: the same object is copied many times per playback.
    $hash = [System.BitConverter]::ToString(
        [System.Security.Cryptography.SHA256]::Create().ComputeHash(
            [System.Text.Encoding]::UTF8.GetBytes($payload))).Replace('-', '').Substring(0, 12)
    if ($seenHashes.ContainsKey($hash)) { continue }
    $seenHashes[$hash] = $true

    $prefix = switch ($record.kind) {
        'response' { 'response-capture' }
        'schedule' { 'schedule-capture' }
        default    { 'remote-capture' }
    }
    $name = "$prefix-$hash.json"
    Set-Content -LiteralPath (Join-Path $OutDir $name) -Value $payload -NoNewline -Encoding UTF8
    $written++
    Write-Host "wrote $name ($($payload.Length) bytes)"
}

Write-Host ""
Write-Host "$written unique payload(s) written to $OutDir"
Write-Host "Replay them with: .\run-replay.ps1 -FixtureDir `"$OutDir`""
Write-Host "NOTE: captured payloads are private. Do not commit them."
