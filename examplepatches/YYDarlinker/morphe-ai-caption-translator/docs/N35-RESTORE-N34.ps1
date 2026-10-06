param([switch]$InspectOnly)
$ErrorActionPreference = 'Stop'
$repoPath = 'E:\Projects\morphe-caption-v2'
$expectedSource = '26edf555c8956e12a4b0448b72aef34597141409'
$stateExternal = 'C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md'
$repoResolved = (Resolve-Path -LiteralPath $repoPath).ProviderPath.TrimEnd('\')
$gitTop = (& git -C $repoResolved rev-parse --show-toplevel).Trim().Replace('/','\').TrimEnd('\')
if ($LASTEXITCODE -ne 0 -or $gitTop -ne $repoResolved) { throw 'Unexpected repository root; no restore performed.' }
$manifestPath = Join-Path $repoResolved 'docs\N35-N34-BASELINE.json'
$baseline = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
if ($baseline.source_commit -ne $expectedSource) { throw 'N34 baseline manifest has changed; no restore performed.' }
$actualAnchor = (& git -C $repoResolved rev-parse 'anchor/n34-26edf55').Trim()
if ($LASTEXITCODE -ne 0 -or $actualAnchor -ne $expectedSource) { throw 'N34 source anchor mismatch; no restore performed.' }
$backupRef = (& git -C $repoResolved rev-parse 'backup/pre-n35-n34-bfe5a0a').Trim()
if ($LASTEXITCODE -ne 0 -or $backupRef -ne $baseline.delivery_commit) { throw 'N34 delivery backup mismatch.' }
foreach ($artifact in $baseline.artifacts) {
    $artifactPath = [IO.Path]::GetFullPath($artifact.path)
    if (!$artifactPath.StartsWith($repoResolved+'\build\',[StringComparison]::OrdinalIgnoreCase)) { throw 'Artifact identity path is outside this project build directory.' }
    $info = Get-Item -LiteralPath $artifactPath
    if ($info.Length -ne $artifact.bytes -or (Get-FileHash -LiteralPath $artifactPath -Algorithm SHA256).Hash -ne $artifact.sha256) { throw 'Original N34 artifact identity mismatch.' }
}
$sourceChanges = @(& git -C $repoResolved diff --name-only $expectedSource -- . ':(exclude)docs')
if ($LASTEXITCODE -ne 0) { throw 'Cannot inspect product source.' }
$currentHead = (& git -C $repoResolved rev-parse HEAD).Trim()
Write-Output ('REPOSITORY: '+$repoResolved)
Write-Output ('CURRENT_HEAD: '+$currentHead)
Write-Output ('RESTORE_SOURCE: '+$expectedSource)
Write-Output ('CHANGED_PRODUCT_PATHS: '+$sourceChanges.Count)
if ($InspectOnly) { Write-Output 'INSPECT_ONLY: No source, state, tag or commit was changed.'; return }
& git -C $repoResolved diff --quiet
if ($LASTEXITCODE -ne 0) { throw 'Tracked working changes exist. Save them in a local WIP commit before rollback; this script does not discard them.' }
& git -C $repoResolved diff --cached --quiet
if ($LASTEXITCODE -ne 0) { throw 'Staged changes exist. Save them before rollback.' }
$unexpected = @(& git -C $repoResolved ls-files --others --exclude-standard | Where-Object { $_ -ne 'patches-1.45.0.mpp' })
if ($unexpected.Count -gt 0) { throw 'Untracked work exists. Preserve it before rollback; no untracked paths will be deleted.' }
if ($sourceChanges.Count -eq 0) { Write-Output 'SOURCE_ALREADY_N34: No restore needed; user data and history retained.'; return }
$stateRepo = Join-Path $repoResolved 'docs\PROJECT-STATE.md'
if ((Get-FileHash -LiteralPath $stateRepo -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $stateExternal -Algorithm SHA256).Hash) { throw 'State copies differ. Review and synchronize before rollback.' }
$failureBackup = 'backup/n35-before-rollback-'+$currentHead.Substring(0,7)
$existing = @(& git -C $repoResolved tag --list $failureBackup)
if ($existing.Count -gt 0) {
    if ((& git -C $repoResolved rev-parse $failureBackup).Trim() -ne $currentHead) { throw 'Failure backup name already belongs to a different commit.' }
} else {
    & git -C $repoResolved tag $failureBackup $currentHead
    if ($LASTEXITCODE -ne 0) { throw 'Cannot preserve the trial commit.' }
}
& git -C $repoResolved restore --source=$expectedSource --staged --worktree -- . ':(exclude)docs'
if ($LASTEXITCODE -ne 0) { throw 'Source restore failed; no reset or deletion attempted.' }
$remaining = @(& git -C $repoResolved diff --name-only $expectedSource -- . ':(exclude)docs')
if ($LASTEXITCODE -ne 0 -or $remaining.Count -ne 0) { throw 'Restored product tree does not match N34.' }
& git -C $repoResolved commit -m 'revert: restore N34 product source after N35 trial'
if ($LASTEXITCODE -ne 0) { throw 'Restored source is staged but commit did not finish; review Git state.' }
$restoreCommit = (& git -C $repoResolved rev-parse HEAD).Trim()
$china = [TimeZoneInfo]::FindSystemTimeZoneById('China Standard Time')
$localTime = [TimeZoneInfo]::ConvertTimeFromUtc([DateTime]::UtcNow,$china)
$stamp = $localTime.ToString('yyyyMMdd-HHmmss')
$receiptRelative = 'docs/N35-ROLLBACK-'+$stamp+'.md'
$receiptAbsolute = [IO.Path]::GetFullPath((Join-Path $repoResolved $receiptRelative))
if (!$receiptAbsolute.StartsWith($repoResolved+'\docs\',[StringComparison]::OrdinalIgnoreCase) -or (Test-Path -LiteralPath $receiptAbsolute)) { throw 'Receipt path invalid or already exists.' }
$receipt = '# N35 rollback receipt'+[Environment]::NewLine+[Environment]::NewLine+
    'User-invoked rollback to the preserved N34 product tree.'+[Environment]::NewLine+
    '- Before: '+$currentHead+[Environment]::NewLine+
    '- Failure preserved: '+$failureBackup+[Environment]::NewLine+
    '- Source baseline: '+$expectedSource+[Environment]::NewLine+
    '- Restore commit: '+$restoreCommit+[Environment]::NewLine+
    '- Original N34 MPP/MPE/APK verified unchanged.'+[Environment]::NewLine+
    '- No reset, amend, untracked deletion, phone operation, data clearing, signing, push or publication.'+[Environment]::NewLine+
    '- Documentation and failed trial artifacts retained; N35 remains stopped pending user direction.'+[Environment]::NewLine
$utf8 = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($receiptAbsolute,$receipt,$utf8)
$stateText = [IO.File]::ReadAllText($stateRepo,[Text.Encoding]::UTF8)
$nl = if ($stateText.Contains([string][char]13+[char]10)) { [string][char]13+[char]10 } else { [string][char]10 }
$headerPattern = New-Object System.Text.RegularExpressions.Regex('(?m)^> (?:\u6700\u540E\u66F4\u65B0|Last update)[^\r\n]*')
$stateText = $headerPattern.Replace($stateText,'> Last update: '+$localTime.ToString('yyyy-MM-dd HH:mm:ss')+' Asia/Shanghai. User-invoked N35 rollback restored N34 source '+$restoreCommit+'; trial preserved, N35 stopped. See appended rollback receipt.',1)
$stateText += $nl+$nl+'## N35 rollback record '+$stamp+$nl+$nl+$receipt.Replace([Environment]::NewLine,$nl)
[IO.File]::WriteAllText($stateRepo,$stateText,$utf8)
[IO.File]::WriteAllText($stateExternal,$stateText,$utf8)
& git -C $repoResolved add -- 'docs/PROJECT-STATE.md' $receiptRelative
if ($LASTEXITCODE -ne 0) { throw 'State receipt could not be staged.' }
& git -C $repoResolved commit -m 'docs: record N35 rollback and preserve trial identity'
if ($LASTEXITCODE -ne 0) { throw 'N34 restored; state receipt remains staged for review.' }
if ((Get-FileHash -LiteralPath $stateRepo -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $stateExternal -Algorithm SHA256).Hash) { throw 'Rollback state copies differ.' }
Write-Output ('RESTORED_N34_COMMIT: '+$restoreCommit)
Write-Output ('FAILED_TRIAL_BACKUP: '+$failureBackup)
Write-Output ('RECEIPT: '+$receiptAbsolute)
Write-Output 'No phone content changed. Reinstalling the original N34 app, if desired, is a separate user operation.'
