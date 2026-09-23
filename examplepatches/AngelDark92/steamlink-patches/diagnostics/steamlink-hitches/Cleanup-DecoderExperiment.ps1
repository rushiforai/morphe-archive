<#
Remove only decoder-staging-v1 temporary outputs after verifying the retained
artifact and audit hashes. Agent-side automatic approval review blocked deletion
on 2026-09-15, including a single verified temporary APK. This script was prepared
for local execution; it has not been run by the agent.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$buildRoot = Join-Path $repo 'build/decoder-buffering'
$run = Join-Path $buildRoot 'archive-final-run2'
$receiptPath = Join-Path $PSScriptRoot 'decoder-staging-v1-validation.json'
$receipt = Get-Content -LiteralPath $receiptPath -Raw | ConvertFrom-Json
if ($receipt.experiment -ne 'decoder-staging-v1' -or $receipt.apk_cases.Count -ne 14) { throw 'Unexpected validation receipt' }
$artifact = Join-Path $repo 'patches/build/libs/patches-1.17.0-dev.2-decoder-staging-v1-local.mpp'
if ((Get-FileHash -LiteralPath $artifact).Hash.ToLowerInvariant() -ne $receipt.artifact.sha256) { throw 'Retained MPP does not match the tested artifact' }
$targets = @('audit-syntax','audit-syntax-v2','kotlin-first','kotlin-second','kotlin-orders','kotlin-expanded','archive-final-run1','native') |
    ForEach-Object { Join-Path $buildRoot $_ }
$targets += @('compiled','catalogs','catalogs-before','previous-published-files') | ForEach-Object { Join-Path $run $_ }
$staged = Join-Path $run ([IO.Path]::GetFileName($artifact))
if (Test-Path -LiteralPath $staged) {
    if ((Get-FileHash -LiteralPath $staged).Hash.ToLowerInvariant() -ne $receipt.artifact.sha256) { throw 'Staged MPP differs; preserve it for inspection' }
    $targets += $staged
}
foreach ($case in $receipt.apk_cases) {
    if ($case.version_code -notin @('5002322','5002363') -or $case.mode -notin @('observe','buffered') -or
        $case.selection -notin @('baseline','standalone','bundle-first','decoder-first')) { throw 'Unexpected audit case' }
    $name = if ($case.selection -eq 'baseline') { "$($case.version_code)-baseline" } else { "$($case.version_code)-$($case.mode)-$($case.selection)" }
    $apk = Join-Path $run "apks/$name/result-unsigned.apk"
    if (Test-Path -LiteralPath $apk) {
        if ((Get-FileHash -LiteralPath $apk).Hash.ToLowerInvariant() -ne $case.output_sha256) { throw "Audit APK changed; preserve it: $apk" }
        $targets += $apk
    }
}
$extraTestFiles = @('build/decoder-staging-pool-test.exe','build/decoder-staging-pool-test.pdb',
    'build/live-hitch-20260915/bridge-test-5002322.exe','build/live-hitch-20260915/bridge-test-5002322.pdb',
    'build/live-hitch-20260915/bridge-test-5002363.exe','build/live-hitch-20260915/bridge-test-5002363.pdb') |
    ForEach-Object { [IO.Path]::GetFullPath((Join-Path $repo $_)) }
$targets += $extraTestFiles
$prefix = [IO.Path]::GetFullPath($buildRoot).TrimEnd('\') + '\'
$plan = @()
foreach ($target in $targets) {
    $absolute = [IO.Path]::GetFullPath($target)
    if (!$absolute.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase) -and $absolute -notin $extraTestFiles) { throw "Cleanup target escaped the explicit experiment paths: $absolute" }
    if (!(Test-Path -LiteralPath $absolute)) { continue }
    $item = Get-Item -LiteralPath $absolute
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Refusing reparse-point cleanup: $absolute" }
    $children = if ($item.PSIsContainer) { @(Get-ChildItem -LiteralPath $absolute -Recurse -Force) } else { @($item) }
    if (@($children | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }).Count) { throw "Reparse point below cleanup target: $absolute" }
    $bytes = [long](($children | Where-Object { !$_.PSIsContainer } | Measure-Object -Property Length -Sum).Sum)
    $plan += [pscustomobject]@{ Path = $absolute; Bytes = $bytes }
}
# Every target has now been resolved, confined and checked before any deletion.
$plan | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath (Join-Path $buildRoot 'cleanup-plan.json') -Encoding utf8
foreach ($item in $plan) { Remove-Item -LiteralPath $item.Path -Recurse -Force }
if ((Get-FileHash -LiteralPath $artifact).Hash.ToLowerInvariant() -ne $receipt.artifact.sha256) { throw 'Final artifact changed during cleanup' }
$cleanup = [ordered]@{ status = 'complete'; removed_bytes = [long](($plan | Measure-Object -Property Bytes -Sum).Sum);
    removed = @($plan | ForEach-Object { [IO.Path]::GetRelativePath($repo, $_.Path) });
    retained = @('final MPP','native payloads','source/tests','validation receipts/logs','original APKs/decoded bases','prior live hitch captures') }
$receipt.cleanup = $cleanup
$receipt | ConvertTo-Json -Depth 30 | Set-Content -LiteralPath $receiptPath -Encoding utf8
$cleanup | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $buildRoot 'cleanup.json') -Encoding utf8
$cleanup | ConvertTo-Json -Depth 5
