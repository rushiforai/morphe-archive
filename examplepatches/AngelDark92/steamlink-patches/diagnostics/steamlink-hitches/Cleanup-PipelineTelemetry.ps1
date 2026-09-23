[CmdletBinding()]
param([switch]$Execute)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$auditRoot = Join-Path $repo 'build/decoder-buffering/telemetry-archive-20260915'
$transitionRoot = Join-Path $repo 'build/decoder-buffering/telemetry-transitions'
$recordRoot = Join-Path $repo 'build/decoder-buffering/telemetry-cleanup'
$null = New-Item -ItemType Directory -Force -Path $recordRoot
$artifact = Join-Path $repo 'patches/build/libs/patches-1.18.0-dev.1-decoder-pipeline-v2-local.mpp'
if ((Get-FileHash -LiteralPath $artifact).Hash.ToLowerInvariant() -ne '5a232e650c4485913c16fc56063b10b05e5c0e4554561d32a6d9b05a8ab3859f') { throw 'Published artifact verification failed' }
if ((Get-Content (Join-Path $transitionRoot 'result.json') -Raw | ConvertFrom-Json).status -ne 'passed') { throw 'Missing transition validation' }
if ((Get-Content (Join-Path $auditRoot 'result.json') -Raw | ConvertFrom-Json).Status -ne 'passed') { throw 'Missing APK validation' }
$targets = [Collections.Generic.List[string]]::new()
foreach ($item in (Get-Content (Join-Path $transitionRoot 'cleanup-allowlist.json') -Raw | ConvertFrom-Json).targets) {
    $targets.Add($item.path)
}
foreach ($code in @('5002322','5002363')) {
    $targets.Add((Join-Path $auditRoot "apks/$code-baseline/result-unsigned.apk"))
    foreach ($mode in @('observe','buffered','observe-telemetry','buffered-telemetry')) {
        foreach ($order in @('standalone','bundle-first','decoder-first')) {
            $targets.Add((Join-Path $auditRoot "apks/$code-$mode-$order/result-unsigned.apk"))
        }
    }
}
foreach ($relative in @('compiled/classes','compiled/resources','compiled/test-classes','catalogs/work',
        'patches-1.18.0-dev.1-decoder-pipeline-v2-local.mpp')) { $targets.Add((Join-Path $auditRoot $relative)) }
$targets.Add((Join-Path $transitionRoot 'classes'))
$targets.Add((Join-Path $repo 'build/decoder-buffering/telemetry-native'))
$allowedRoots = @($auditRoot,$transitionRoot,(Join-Path $repo 'build/decoder-buffering/telemetry-native'))
$inventory = foreach ($target in $targets) {
    $absolute = [IO.Path]::GetFullPath($target)
    if (!($allowedRoots | Where-Object { $absolute -eq $_ -or $absolute.StartsWith($_ + '\', [StringComparison]::OrdinalIgnoreCase) })) { throw "Outside allowlist roots: $absolute" }
    if (!$absolute.StartsWith($repo + '\', [StringComparison]::OrdinalIgnoreCase)) { throw "Outside workspace: $absolute" }
    $ancestor = $absolute
    while ($ancestor.Length -ge $repo.Length) {
        if (Test-Path -LiteralPath $ancestor) {
            if ((Get-Item -LiteralPath $ancestor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Reparse ancestor: $ancestor" }
        }
        if ($ancestor -eq $repo) { break }
        $ancestor = Split-Path -Parent $ancestor
    }
    if (!(Test-Path -LiteralPath $absolute)) { continue }
    $item = Get-Item -LiteralPath $absolute -Force
    $children = if ($item.PSIsContainer) { @(Get-ChildItem -LiteralPath $absolute -Recurse -Force) } else { @($item) }
    if ($children | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint }) { throw "Reparse child: $absolute" }
    $files = @($children | Where-Object { !$_.PSIsContainer })
    [pscustomobject]@{Path=$absolute; Bytes=($files | Measure-Object Length -Sum).Sum; Files=$files.Count; Directory=$item.PSIsContainer}
}
$inventory | ConvertTo-Json -Depth 4 | Set-Content (Join-Path $recordRoot 'allowlist.json') -Encoding utf8
$protected = @($artifact,
    (Join-Path $repo 'patches/src/main/resources/steamlink/decoder/libgxr_dbuf_5002322.so'),
    (Join-Path $repo 'patches/src/main/resources/steamlink/decoder/libgxr_dbuf_5002363.so'),
    (Join-Path $repo 'patches/src/main/resources/steamlink/decoder/libgxr_dbuf_5002322_telemetry.so'),
    (Join-Path $repo 'patches/src/main/resources/steamlink/decoder/libgxr_dbuf_5002363_telemetry.so'),
    (Join-Path $repo 'build/live-hitch-20260915/telemetry-followup/installed.apk'),
    (Join-Path $repo 'build/live-hitch-20260915/telemetry-followup/capture/stream.pftrace'))
$before = @($protected | ForEach-Object { Get-FileHash -LiteralPath $_ })
foreach ($gitRepo in @($repo,(Join-Path $repo '../Tools'),(Join-Path $repo '../CustomHeadsetOpenVrGxR'))) {
    $name = Split-Path -Leaf ([IO.Path]::GetFullPath($gitRepo))
    git -C $gitRepo status --short | Set-Content (Join-Path $recordRoot "$name-status-before.txt")
}
if (!$Execute) {
    [pscustomobject]@{Status='prepared';Targets=@($inventory).Count;Bytes=($inventory | Measure-Object Bytes -Sum).Sum}
    return
}
foreach ($row in $inventory) {
    Remove-Item -LiteralPath $row.Path -Recurse -Force
    if (Test-Path -LiteralPath $row.Path) { throw "Cleanup target remains: $($row.Path)" }
}
foreach ($item in $before) { if ((Get-FileHash -LiteralPath $item.Path).Hash -ne $item.Hash) { throw "Protected file changed: $($item.Path)" } }
$concurrentChanges = @()
foreach ($gitRepo in @((Join-Path $repo '../Tools'),(Join-Path $repo '../CustomHeadsetOpenVrGxR'))) {
    $name = Split-Path -Leaf ([IO.Path]::GetFullPath($gitRepo))
    $after = @(git -C $gitRepo status --short)
    $after | Set-Content (Join-Path $recordRoot "$name-status-after.txt")
    $delta = @(Compare-Object @(Get-Content (Join-Path $recordRoot "$name-status-before.txt")) $after)
    if ($delta.Count) { $concurrentChanges += @{Repository=$name;Delta=$delta} }
}
$result = [ordered]@{Status='passed';Utc=(Get-Date).ToUniversalTime().ToString('o');Targets=@($inventory).Count;
    BytesReclaimed=($inventory | Measure-Object Bytes -Sum).Sum; ProtectedFilesVerified=$before.Count;
    Retained='Published MPP, source payloads, exact inputs, live evidence, compact audit results/tests/reproduction sources';
    ConcurrentGitChanges=$concurrentChanges;
    Deferred='pipeline-review-test.exe and possible PDB: automatic approval review previously rejected removal; not retried'}
$result | ConvertTo-Json | Set-Content (Join-Path $recordRoot 'result.json') -Encoding utf8
$result | ConvertTo-Json
