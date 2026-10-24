[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'evidence.ps1')
. (Join-Path (Split-Path -Parent $PSScriptRoot) 'scripts/device-lease.ps1')
$script:passed = 0
function Assert-Audit([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
    $script:passed++
}
function Copy-Json($Value) { return ($Value | ConvertTo-Json -Depth 30 | ConvertFrom-Json) }
$temporaryRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture = Join-Path $temporaryRoot ('hushfeed-audit-test-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $fixture | Out-Null
try {
$entry = [pscustomobject]@{ name = 'Example'; kind = 'runtime'; category = 'Test'; settings = @(); checks = @(
    [pscustomobject]@{ id = 'screen'; what = 'A screen'; auto = $false; steps = @([pscustomobject]@{ shot = 'screen'; review = 'Readable' }) }
) }
$catalog = @($entry)
$check = $entry.checks[0]
$hash = Get-AuditDefinitionHash $entry $check
Assert-Audit ($hash -match '^[a-f0-9]{64}$') 'Definition hash must be SHA-256.'
$escaping = "quotes `" \ apostrophe ' <&> newline`n" + [char]0 + [char]::ConvertFromUtf32(0x1F642)
Assert-Audit ((Get-AuditCanonicalJson $escaping | ConvertFrom-Json) -ceq $escaping) 'Canonical string encoding changed content.'
$cultureBefore = [Threading.Thread]::CurrentThread.CurrentCulture
try {
    $keys = [ordered]@{ z = 1; a = 2; I = 3; J = 4 }
    $keys[[string][char]0x131] = 5
    $englishHash = Get-AuditHash $keys
    [Threading.Thread]::CurrentThread.CurrentCulture = [Globalization.CultureInfo]::GetCultureInfo('tr-TR')
    Assert-Audit ((Get-AuditHash $keys) -ceq $englishHash) 'Culture changed canonical key order.'
} finally { [Threading.Thread]::CurrentThread.CurrentCulture = $cultureBefore }
# Pipeline output arrives wrapped in PSObject; it must hash as the plain value, by content.
$wrapped = @('one.png', 'two.png' | Write-Output)
Assert-Audit ((Get-AuditCanonicalJson $wrapped) -ceq '["one.png","two.png"]') 'A wrapped string serialized as an object.'
Assert-Audit ((Get-AuditHash @('aaa.png' | Write-Output)) -cne (Get-AuditHash @('bbb.png' | Write-Output))) 'Evidence names of equal length shared a hash.'
# Windows PowerShell reads 1.5 from JSON as decimal, PS7 as double. 0.1 + 0.7 needs 16 digits,
# where Windows PowerShell's 'R' and PS7's shortest round trip print different text.
foreach ($number in @('0.1', '0.7999999999999999', '1E+21')) {
    Assert-Audit ((Get-AuditCanonicalJson ([decimal]::Parse($number, [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture))) -ceq
        (Get-AuditCanonicalJson ([double]::Parse($number, [Globalization.CultureInfo]::InvariantCulture)))) "Decimal and double printed $number differently."
}
Assert-Audit ((Get-AuditCanonicalJson (0.1 + 0.7)) -ceq '0.79999999999999993') 'A double lost its fixed 17-digit canonical form.'
$reordered = [pscustomobject]@{ checks = $entry.checks; settings = @(); category = 'Test'; kind = 'runtime'; name = 'Example' }
Assert-Audit ($hash -eq (Get-AuditDefinitionHash $reordered $check)) 'Object key order changed definition identity.'
$changed = Copy-Json $check
$changed.steps[0].review = 'Different criterion'
Assert-Audit ($hash -ne (Get-AuditDefinitionHash $entry $changed)) 'Changed review criterion retained identity.'
Assert-Audit (@(Get-AuditCatalogProblems $catalog).Count -eq 0) 'Valid catalog rejected.'
$duplicate = Copy-Json $entry
$duplicate.checks += Copy-Json $check
Assert-Audit (@(Get-AuditCatalogProblems @($duplicate)).Count -gt 0) 'Duplicate check ID accepted.'
$blank = Copy-Json $entry
$blank.checks[0].id = ''
Assert-Audit (@(Get-AuditCatalogProblems @($blank)).Count -gt 0) 'Blank check ID accepted.'
$apkHash = 'a' * 64
$source = [pscustomobject]@{ commit = 'b' * 40; clean = $true; startFingerprint = 'c' * 64; endFingerprint = 'c' * 64 }
$build = [pscustomobject]@{ status = 'verified'; receiptSha256 = 'd' * 64; source = $source }
[IO.File]::WriteAllText((Join-Path $fixture 'screen.png'), 'original evidence')
$result = [ordered]@{ id = 'screen'; auto = $false; status = 'review'; definitionHash = $hash; evidence = @('screen.png'); review = @(@{ shot = 'screen.png'; criteria = 'Readable' }); build = $build; apkSha256 = $apkHash; installedApkSha256 = $apkHash }
Set-AuditCheckReceipt $result $fixture
$result = Copy-Json $result
$run = [pscustomobject]@{ apk = @{ sha256 = $apkHash }; patches = @([pscustomobject]@{ name = 'Example'; checks = @($result) }) }
$report = Get-AuditResultValidation $catalog $run $fixture
Assert-Audit ($report.problems.Count -eq 0 -and $report.currentChecks -eq 1) 'Current bound result rejected.'
$missing = Copy-Json $run
$missing.patches[0].checks = @()
Assert-Audit ((Get-AuditResultValidation $catalog $missing $fixture).missing.Count -eq 1) 'Missing check not detected.'
$twice = Copy-Json $run
$twice.patches[0].checks += Copy-Json $result
Assert-Audit ((Get-AuditResultValidation $catalog $twice $fixture).duplicates.Count -eq 1) 'Duplicate result not detected.'
$mixed = Copy-Json $run
$mixed.patches += [pscustomobject]@{ name = 'Other'; checks = @([pscustomobject]@{ id = 'other'; status = 'pass'; apkSha256 = 'e' * 64 }) }
$mixedReport = Get-AuditResultValidation $catalog $mixed $fixture
Assert-Audit ($mixedReport.mixedBuild -and @($mixedReport.problems | Where-Object { $_ -like 'mixed-build:*' }).Count -eq 1) 'Results from two APKs were not reported as a problem.'
$stale = Copy-Json $run
$stale.patches[0].checks[0].definitionHash = 'f' * 64
Assert-Audit ((Get-AuditResultValidation $catalog $stale $fixture).changed.Count -eq 1) 'Changed definition counted current.'
$old = Copy-Json $run
$old.patches[0].checks[0].apkSha256 = '0' * 64
Assert-Audit ((Get-AuditResultValidation $catalog $old $fixture).currentChecks -eq 0) 'Mixed APK counted current.'
$unbound = Copy-Json $run
$unbound.patches[0].checks[0].installedApkSha256 = ''
Assert-Audit ((Get-AuditResultValidation $catalog $unbound $fixture).currentChecks -eq 0) 'Unbound installed APK counted current.'
$removed = Copy-Json $run
$removed.patches[0].checks[0].id = 'removed'
Assert-Audit ((Get-AuditResultValidation $catalog $removed $fixture).removed.Count -eq 1) 'Removed check not detected.'
$unknown = Copy-Json $run
$unknown.patches[0].checks[0].status = 'made-up'
Assert-Audit ((Get-AuditResultValidation $catalog $unknown $fixture).unknown.Count -eq 1) 'Unknown status accepted.'
$verdict = [pscustomobject]@{ 'Example/screen' = [pscustomobject]@{ status = 'pass'; note = 'Readable'; receiptId = $result.receiptId } }
$verdict = ConvertFrom-AuditVerdictJson ($verdict | ConvertTo-Json -Depth 8)
Assert-Audit ($verdict.'Example/screen'.status -ceq 'pass') 'Unique verdict JSON was rejected.'
foreach ($invalidJson in @(
    '{"Example/screen":{"status":"inconclusive"},"Example/screen":{"status":"pass"}}',
    '{"Example/screen":{},"Example\u002fscreen":{}}',
    '{"Example/screen":{"status":"inconclusive","status":"pass"}}',
    '{"Example/screen":{"status":"fail","\u0073tatus":"pass"}}',
    '{"Example/screen":{"status":"fail","Status":"pass"}}',
    '{"Example/screen":{status:"fail",status:"pass"}}',
    '{"Example/screen":{status:"pass"}}',
    "{`"Example/screen`":{'status':'fail','status':'pass'}}",
    '{"Example/screen":{"note":"ok"},/* hidden duplicate */"Example/screen":{}}',
    '[{"Example/screen":{}}]'
)) {
    $rejected = $false
    try { [void](ConvertFrom-AuditVerdictJson $invalidJson) } catch { $rejected = $true }
    Assert-Audit $rejected 'Ambiguous verdict JSON was accepted.'
}
$tokenCases = ConvertFrom-AuditVerdictJson '{"one":{"note":"{\"status\":1}, /* text */","extra":[{"key":1},{"key":2}]},"two":{"note":"two"}}'
Assert-Audit ($tokenCases.one.extra.Count -eq 2 -and $tokenCases.two.note -ceq 'two') 'Independent objects or quoted punctuation were treated as duplicates.'
$dateKeys = ConvertFrom-AuditVerdictJson '{"Example/screen":{"extra":{"2026-10-16T00:00:00Z":1,"2026-10-16T00:00:00.000Z":2}}}'
Assert-Audit (@($dateKeys.'Example/screen'.extra.PSObject.Properties).Count -eq 2) 'Timestamp-shaped property names were converted to DateTime values.'
Set-AuditVerdicts $catalog $run $verdict $fixture
Assert-Audit ($result.status -eq 'pass') 'Matching review verdict did not apply.'
Assert-Audit ((Get-AuditResultValidation $catalog $run $fixture).currentPass -eq 1) 'Imported verdict lost its execution binding.'
$forged = Copy-Json $run
$forged.patches[0].checks[0].verdict.receiptId = '0' * 64
Assert-Audit ((Get-AuditResultValidation $catalog $forged $fixture).currentPass -eq 0) 'A verdict for another execution remained current.'
$failed = [ordered]@{ status = 'fail'; failures = @('Failed expectation'); auto = $true; definitionHash = $hash; evidence = @(); review = @(); build = $build; apkSha256 = $apkHash; installedApkSha256 = $apkHash }
Set-AuditCheckReceipt $failed $fixture
$failed.status = 'pass'
Assert-Audit (-not (Test-AuditCheckBinding $entry $check $failed $apkHash $fixture)) 'Changing a failed status reused its receipt.'
$failed.status = 'fail'; $failed.failures = @()
Assert-Audit (-not (Test-AuditCheckBinding $entry $check $failed $apkHash $fixture)) 'Removing execution failures reused its receipt.'
foreach ($case in 'wrongReceipt', 'automatic', 'staleDefinition', 'invalidStatus', 'missing', 'alreadyDecided', 'changedPayload', 'changedReview', 'changedFile', 'missingFile', 'wrongDirectory') {
    $attempt = Copy-Json $run
    $attempt.patches[0].checks[0].status = 'review'
    $candidate = Copy-Json $verdict
    switch ($case) {
        wrongReceipt { $candidate.'Example/screen'.receiptId = '0' * 64 }
        automatic { $attempt.patches[0].checks[0].auto = $true }
        staleDefinition { $attempt.patches[0].checks[0].definitionHash = '0' * 64 }
        invalidStatus { $candidate.'Example/screen'.status = 'inconclusive' }
        missing { $attempt.patches[0].checks = @() }
        alreadyDecided { $attempt.patches[0].checks[0].status = 'pass' }
        changedPayload { $attempt.patches[0].checks[0].receipt.execution = '0' * 32 }
        changedReview { $attempt.patches[0].checks[0].review[0].criteria = 'Different evidence' }
        changedFile { [IO.File]::WriteAllText((Join-Path $fixture 'screen.png'), 'overwritten by a later run') }
        missingFile { Remove-Item -LiteralPath (Join-Path $fixture 'screen.png') }
    }
    $before = $attempt | ConvertTo-Json -Depth 30 -Compress
    $refused = $false
    $evidenceDirectory = if ($case -eq 'wrongDirectory') { Join-Path $fixture 'absent' } else { $fixture }
    try { Set-AuditVerdicts $catalog $attempt $candidate $evidenceDirectory } catch { $refused = $true }
    Assert-Audit $refused "Unsafe verdict accepted: $case"
    Assert-Audit (($attempt | ConvertTo-Json -Depth 30 -Compress) -eq $before) "Rejected verdict mutated results: $case"
    [IO.File]::WriteAllText((Join-Path $fixture 'screen.png'), 'original evidence')
}
Assert-Audit ((Get-AuditResultValidation $catalog $run).currentChecks -eq 0) 'Missing evidence directory counted current.'
$reorderedStep = Copy-Json $check
$reorderedStep.steps = @([pscustomobject]@{ review = 'Readable'; shot = 'screen' })
Assert-Audit ($hash -ne (Get-AuditDefinitionHash $entry $reorderedStep)) 'Changing the step dispatcher retained definition identity.'
# Exercise the actual tap dispatcher without a device. Descriptive tap text must be saved before hashing.
$runner = Join-Path $PSScriptRoot 'run-audit.ps1'
$parseErrors = $null
$syntax = [Management.Automation.Language.Parser]::ParseFile($runner, [ref]$null, [ref]$parseErrors)
Assert-Audit (@($parseErrors).Count -eq 0) 'Runner failed to parse.'
foreach ($name in 'Invoke-Check', 'Save-Evidence', 'Save-Shot', 'Start-ScreenRecord', 'Stop-ScreenRecord', 'Clear-ScreenRecord', 'Grant-AuditLease', 'Revoke-AuditLease', 'Test-AuditLeaseOwnership', 'Invoke-AuditAdb') {
    $definition = $syntax.Find({ param($node) $node -is [Management.Automation.Language.FunctionDefinitionAst] -and $node.Name -eq $name }, $true)
    . ([scriptblock]::Create($definition.Extent.Text))
}
function Write-Marker { [pscustomobject]@{ id = 'fixture'; since = 'fixture' } }
function Invoke-DumpTap { 'tapped fixture at 10,20' }
function Start-Sleep { param($Milliseconds) }
$deviceUp = $true
$OutDir = $fixture
foreach ($kind in 'tap', 'longpress') {
    $step = [ordered]@{}; $step[$kind] = @{ text = 'Test control' }
    $tapCheck = [pscustomobject]@{ id = $kind; auto = $true; steps = @([pscustomobject]$step) }
    $restarted = $false
    $tapResult = Invoke-Check $entry $tapCheck @{} ([ref]$restarted)
    Assert-Audit ($tapResult.status -eq 'pass') "$kind step failed."
    Assert-Audit ((Get-Content -LiteralPath (Join-Path $fixture $tapResult.evidence[0]) -Raw).Trim() -eq 'tapped fixture at 10,20') "$kind did not save its textual evidence."
    Set-AuditCheckReceipt $tapResult $fixture
    Assert-Audit ($tapResult.receipt.files.Count -eq 1) "$kind could not bind file evidence."
}
$Serial = 'fixture-device'; $LeaseDir = $fixture; $ChatIdentity = 'audit-fixture'; $LeaseMinutes = 30
$script:auditLease = $null
Grant-AuditLease
$leaseFile = $script:auditLease.Path
$leaseToken = $script:auditLease.OwnershipToken
Grant-AuditLease
Assert-Audit ((Read-DeviceLeaseRecord $script:auditLease).ownershipToken -eq $leaseToken) 'Lease renewal lost ownership.'
$script:deviceCommands = 0
function Invoke-FixtureAdb { $script:deviceCommands++ }
$adbExe = 'Invoke-FixtureAdb'
Invoke-AuditAdb shell 'fixture'
Assert-Audit ($script:deviceCommands -eq 1) 'Owned device command was refused.'
$Serial = 'different-device'
$rejected = $false
try { Invoke-AuditAdb shell 'fixture' } catch { $rejected = $true }
Assert-Audit ($rejected -and $script:deviceCommands -eq 1) 'Audit command accepted a lease for a different serial.'
$rejected = $false
try { Start-ScreenRecord 1 } catch { $rejected = $_.Exception.Message -like '*ownership or serial*' }
Assert-Audit $rejected 'Recorder started without the exact serial lease.'
$Serial = 'fixture-device'
Revoke-AuditLease
Assert-Audit (-not (Test-Path -LiteralPath $leaseFile)) 'Owned lease was not released.'
Grant-AuditLease
# A held Windows handle prevents path deletion. Close that handle to simulate lost ownership,
# then remove the fixture file; renewal must still reject the previously acquired context.
$script:auditLease.Stream.Dispose()
Remove-Item -LiteralPath $leaseFile -Force
$rejected = $false
try { Grant-AuditLease } catch { $rejected = $true }
Assert-Audit ($rejected -and -not (Test-Path -LiteralPath $leaseFile)) 'A missing acquired lease was silently recreated.'
Revoke-AuditLease
$script:auditLease = $null # The stopped fixture is explicitly recovered for the next case.
foreach ($expiry in [DateTime]::UtcNow.AddMinutes(10), [DateTime]::UtcNow.AddMinutes(-10)) {
    $otherLease = @{ ownershipToken = 'someone-else'; expiresUtc = $expiry.ToString('o') } | ConvertTo-Json
    [IO.File]::WriteAllText($leaseFile, $otherLease)
    $rejected = $false
    try { Grant-AuditLease } catch { $rejected = $true }
    Assert-Audit $rejected 'Another test lease was reclaimed without confirming it stopped.'
    Revoke-AuditLease
    Assert-Audit ((Get-Content -LiteralPath $leaseFile -Raw) -eq $otherLease) 'Another test lease was changed or released.'
    $rejected = $false
    try { Invoke-AuditAdb shell 'am force-stop fixture' } catch { $rejected = $true }
    Assert-Audit ($rejected -and $script:deviceCommands -eq 1) 'Device command was sent after losing the lease.'
}
Remove-Item -LiteralPath $leaseFile -Force
foreach ($expiry in [DateTime]::UtcNow.AddMinutes(-5).ToString('o'), [DateTimeOffset]::UtcNow.AddMinutes(-5).ToOffset([TimeSpan]::FromHours(-4)).ToString('o')) {
    Grant-AuditLease
    # Mutate only the owned stream; external writes are now blocked while the context is held.
    $held = Read-DeviceLeaseRecord $script:auditLease
    $held.expiresUtc = $expiry
    Write-DeviceLeaseRecord $script:auditLease $held
    Assert-Audit (-not (Test-AuditLeaseOwnership)) 'Expired same-token lease became current after timezone conversion.'
    $rejected = $false
    try { Invoke-AuditAdb shell 'fixture' } catch { $rejected = $true }
    Assert-Audit ($rejected -and $script:deviceCommands -eq 1) 'Expired same-token lease sent a device command.'
    $script:auditLease.Stream.Position = 0
    $leaseReader = [IO.StreamReader]::new($script:auditLease.Stream, [Text.Encoding]::UTF8, $true, 1024, $true)
    try { $expiredLease = $leaseReader.ReadToEnd() } finally { $leaseReader.Dispose() }
    $rejected = $false
    try { Grant-AuditLease } catch { $rejected = $true }
    Assert-Audit ($rejected -and -not (Test-AuditLeaseOwnership)) 'Renewal resurrected an expired same-token lease.'
    Revoke-AuditLease
    Assert-Audit ((Get-Content -LiteralPath $leaseFile -Raw) -ceq $expiredLease) 'Expired same-token lease was renewed or removed.'
    Remove-Item -LiteralPath $leaseFile -Force
    $script:auditLease = $null # Explicit recovery after the expired fake test stopped.
}
# Exercise the real finalizer: a restoration failure must still close/release the owned handle.
Grant-AuditLease
$apkZip = [pscustomobject]@{}
$apkZip | Add-Member ScriptMethod Dispose { }
$script:recorder = $null
$deviceStarted = $true
function Restore-NightMode { throw 'Fixture restoration failure.' }
$mainCleanup = $syntax.Find({ param($node)
    $node -is [Management.Automation.Language.TryStatementAst] -and $null -ne $node.Finally -and
        $node.Finally.Extent.Text -match '\$apkZip\.Dispose\('
}, $true)
$rejected = $false
try { & ([scriptblock]::Create(($mainCleanup.Finally.Statements.Extent.Text -join "`n"))) }
catch { $rejected = $_.Exception.Message -eq 'Fixture restoration failure.' }
Assert-Audit $rejected 'The fixture did not exercise a restoration failure.'
Assert-Audit ($null -eq $script:auditLease -and -not (Test-Path -LiteralPath $leaseFile)) 'Restoration failure retained the device lease.'
# Failed capture or transfer must never certify an older local screenshot or recording.
$script:captureFailure = ''
$script:ownsCaptureLease = $true
$script:captureCommands = @()
function Test-AuditLeaseOwnership { return $script:ownsCaptureLease }
function Invoke-DeviceShell([string]$Command) {
    $script:captureCommands += $Command
    $global:LASTEXITCODE = if ($Command -like 'screencap*' -and $script:captureFailure -eq 'capture') { 1 } else { 0 }
}
function Invoke-AuditAdb {
    if ($args[0] -eq 'pull') {
        [IO.File]::WriteAllText($args[2], $(if ($script:captureFailure -eq 'empty') { '' } else { 'new capture' }))
        $global:LASTEXITCODE = if ($script:captureFailure -eq 'pull') { 1 } else { 0 }
    }
}
$firstShot = Save-Shot 'same-name'
$secondShot = Save-Shot 'same-name'
Assert-Audit ($firstShot -ne $secondShot) 'Repeated screenshots overwrite prior evidence.'
foreach ($failure in 'capture', 'pull', 'empty') {
    $script:captureFailure = $failure
    $rejected = $false
    try { [void](Save-Shot 'same-name') } catch { $rejected = $true }
    Assert-Audit $rejected "Screenshot $failure failure was certified."
    Assert-Audit ((Get-Content -LiteralPath (Join-Path $fixture $firstShot) -Raw) -eq 'new capture') 'A failed capture replaced older evidence.'
}
foreach ($failure in 'recorder', 'pull', 'empty', 'timeout', 'existing', 'success') {
    $script:captureFailure = $failure
    $script:recordingRemote = '/fixture/unique-recording.mp4'
    $script:recorder = [pscustomobject]@{ ExitCode = $(if ($failure -eq 'recorder') { 1 } else { 0 }) }
    $script:recorder | Add-Member ScriptMethod WaitForExit { param($Timeout) return $script:captureFailure -ne 'timeout' }
    $script:recorder | Add-Member ScriptMethod Kill { }
    $script:recorder | Add-Member ScriptMethod Dispose { }
    $recording = Join-Path $fixture "$failure.mp4"
    if ($failure -eq 'existing') { [IO.File]::WriteAllText($recording, 'old recording') }
    $rejected = $false
    try { Stop-ScreenRecord $recording } catch { $rejected = $true }
    Assert-Audit ($rejected -eq ($failure -ne 'success')) "Recording outcome was wrong for $failure."
    Assert-Audit ($null -eq $script:recorder) 'Recorder handle survived completion.'
    if ($failure -eq 'existing') { Assert-Audit ((Get-Content $recording -Raw) -eq 'old recording') 'Prior recording evidence was overwritten.' }
}
$script:captureFailure = ''
foreach ($owned in $true, $false) {
    $script:ownsCaptureLease = $owned
    $script:disposedRecorder = $false
    $script:killedRecorder = $false
    $script:captureCommands = @()
    $script:recordingRemote = '/fixture/interrupted.mp4'
    $script:recorder = [pscustomobject]@{ HasExited = $false }
    $script:recorder | Add-Member ScriptMethod Kill { $script:killedRecorder = $true }
    $script:recorder | Add-Member ScriptMethod Dispose { $script:disposedRecorder = $true }
    function Invoke-DumpTap { throw 'Tap failed during recording' }
    function Restart-TikTok { }
    $restarted = $false
    $interrupted = Invoke-Check $entry $tapCheck @{} ([ref]$restarted)
    Assert-Audit ($interrupted.status -eq 'fail' -and $script:killedRecorder -and $script:disposedRecorder -and $null -eq $script:recorder) 'Failed intermediate step leaked its recorder.'
    Assert-Audit (($script:captureCommands -contains 'rm -f /fixture/interrupted.mp4') -eq $owned) 'Recording cleanup ignored lease ownership.'
}
function Write-FixtureJson([string]$Path, $Value) { $Value | ConvertTo-Json -Depth 30 | Set-Content -LiteralPath $Path -Encoding UTF8 }
function New-FixtureZip([string]$Path, [string]$EntryName, [string]$Content) {
    $zip = [IO.Compression.ZipFile]::Open($Path, 'Create')
    try {
        $writer = [IO.StreamWriter]::new($zip.CreateEntry($EntryName).Open())
        try { $writer.Write($Content) } finally { $writer.Dispose() }
    } finally { $zip.Dispose() }
}
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $fixtureApk = Join-Path $fixture 'fixture.apk'
    $fixtureBundle = Join-Path $fixture 'fixture.mpp'
    $receiptPath = Join-Path $fixture 'receipt.json'
    New-FixtureZip $fixtureApk 'marker.txt' 'present'
    $manifest = "Manifest-Version: 1.0`nVersion: 1.0.0`nTimestamp: 1000`nPatcher-Version: 1.15.1`n" +
        "Hushfeed-Source-Commit: $($source.commit)`nHushfeed-Source-Clean: true`n" +
        "Hushfeed-Source-Start: $($source.startFingerprint)`nHushfeed-Source-End: $($source.endFingerprint)`n"
    New-FixtureZip $fixtureBundle 'META-INF/MANIFEST.MF' $manifest
    $receipt = [ordered]@{
        schemaVersion = 1; kind = 'hushfeed-device-build'; source = $source
        apk = @{ sha256 = (Get-FileHash $fixtureApk -Algorithm SHA256).Hash.ToLowerInvariant() }
        bundle = @{ sha256 = (Get-FileHash $fixtureBundle -Algorithm SHA256).Hash.ToLowerInvariant() }
    }
    Write-FixtureJson $receiptPath $receipt
    Assert-Audit ((Read-AuditBuildIdentity $fixtureApk $receiptPath $fixtureBundle).status -eq 'verified') 'Valid build receipt rejected.'
    Assert-Audit ((Read-AuditBuildIdentity $fixtureApk '' '').status -eq 'unbound') 'Absent receipt invented source identity.'
    foreach ($mutation in 'apk', 'bundle', 'source') {
        $invalid = Copy-Json $receipt
        if ($mutation -eq 'source') { $invalid.source.clean = $false } else { $invalid.$mutation.sha256 = '0' * 64 }
        Write-FixtureJson $receiptPath $invalid
        $rejected = $false
        try { [void](Read-AuditBuildIdentity $fixtureApk $receiptPath $fixtureBundle) } catch { $rejected = $true }
        Assert-Audit $rejected "Mismatched $mutation accepted."
    }
    Write-FixtureJson $receiptPath $receipt
    $staticEntry = [pscustomobject]@{ name = 'Static'; kind = 'static'; category = 'Test'; settings = @(); checks = @(
        [pscustomobject]@{ id = 'present'; what = "App's marker <here> & there"; auto = $true; steps = @([pscustomobject]@{ apk = 'entry-present'; path = 'marker.txt' }) }
    ) }
    $fixtureCatalog = Join-Path $fixture 'catalog.json'
    $staticEntry.checks[0].what += [char]0xB7 + [char]::ConvertFromUtf32(0x1F525)
    $fixtureResults = Join-Path $fixture 'results.json'
    $fakeAapt = Join-Path $fixture 'aapt.ps1'
    Write-FixtureJson $fixtureCatalog @($staticEntry)
    [IO.File]::WriteAllText($fakeAapt, 'Write-Output "package: name=''com.zhiliaoapp.musically'' versionCode=''1'' versionName=''47.1.4''"')
    $shell = (Get-Process -Id $PID).Path
    $runner = Join-Path $PSScriptRoot 'run-audit.ps1'
    & $shell -NoProfile -File $runner -NoDevice -Catalog $fixtureCatalog -Apk $fixtureApk -Aapt2 $fakeAapt -Results $fixtureResults -OutDir (Join-Path $fixture 'evidence') -BuildReceipt $receiptPath -Bundle $fixtureBundle
    Assert-Audit ($LASTEXITCODE -eq 0) 'Static CLI run failed.'
    $recorded = Get-Content $fixtureResults -Raw | ConvertFrom-Json
    Assert-Audit ($recorded.qualification.currentPass -eq 1) 'Static run did not bind evidence.'
    Assert-Audit ($recorded.patches[0].checks[0].definitionHash -eq (Get-AuditDefinitionHash $staticEntry $staticEntry.checks[0])) 'Runner omitted exact definition.'
    # Without the evidence folder every receipt reads as stale, so both read-only modes refuse to guess.
    $resultsBefore = [IO.File]::ReadAllText($fixtureResults)
    $emptyVerdicts = Join-Path $fixture 'empty-verdicts.json'
    [IO.File]::WriteAllText($emptyVerdicts, '{}')
    $ErrorActionPreference = 'Continue'
    try {
        & $shell -NoProfile -File $runner -ValidateResults -Catalog $fixtureCatalog -Results $fixtureResults 2>&1 | Out-Null
        $validateStatus = $LASTEXITCODE
        & $shell -NoProfile -File $runner -ApplyVerdicts $emptyVerdicts -Catalog $fixtureCatalog -Results $fixtureResults 2>&1 | Out-Null
        $applyStatus = $LASTEXITCODE
        # A review of one APK's screenshots can't land on results recorded for another.
        $otherApk = Join-Path $fixture 'other.apk'
        New-FixtureZip $otherApk 'marker.txt' 'another build'
        & $shell -NoProfile -File $runner -ApplyVerdicts $emptyVerdicts -Catalog $fixtureCatalog -Results $fixtureResults -OutDir (Join-Path $fixture 'evidence') -Apk $otherApk 2>&1 | Out-Null
        $otherApkStatus = $LASTEXITCODE
    } finally { $ErrorActionPreference = 'Stop' }
    Assert-Audit ($validateStatus -ne 0) 'Validation without -OutDir reported a result.'
    Assert-Audit ($applyStatus -ne 0 -and [IO.File]::ReadAllText($fixtureResults) -ceq $resultsBefore) 'Verdicts were applied without -OutDir.'
    Assert-Audit ($otherApkStatus -ne 0 -and [IO.File]::ReadAllText($fixtureResults) -ceq $resultsBefore) 'Verdicts were applied to results recorded for another APK.'
    # Validate a persisted receipt in the other supported shell, not just twice in one host.
    $otherShell = if ($PSVersionTable.PSVersion.Major -ge 6 -and $env:WINDIR) {
        Join-Path $env:WINDIR 'System32/WindowsPowerShell/v1.0/powershell.exe'
    } elseif (Get-Command pwsh -ErrorAction SilentlyContinue) { (Get-Command pwsh).Source }
    if ($otherShell -and (Test-Path -LiteralPath $otherShell)) {
        $modulePathBefore = $env:PSModulePath
        try {
            if ($PSVersionTable.PSVersion.Major -ge 6) {
                $env:PSModulePath = "$env:WINDIR\System32\WindowsPowerShell\v1.0\Modules;$env:ProgramFiles\WindowsPowerShell\Modules"
            }
            $crossResult = & $otherShell -NoProfile -ExecutionPolicy Bypass -File $runner -ValidateResults -Catalog $fixtureCatalog -Results $fixtureResults -OutDir (Join-Path $fixture 'evidence')
            Assert-Audit ($LASTEXITCODE -eq 0) 'The other PowerShell host rejected an unchanged persisted receipt.'
            Assert-Audit (($crossResult | ConvertFrom-Json).currentPass -eq 1) 'Cross-shell validation lost its current pass.'
        } finally { $env:PSModulePath = $modulePathBefore }
    }
    # -Validate holds every TikTok version a pattern spells out to the declared target, so a check
    # still asking for the old version after a retarget fails here instead of on every device run.
    & $shell -NoProfile -File $runner -Validate 2>&1 | Out-Null
    Assert-Audit ($LASTEXITCODE -eq 0) 'The shipped catalog failed -Validate.'
    $stale = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'catalog.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $stale[0].checks[0].steps += [pscustomobject]@{ probe = 'report'; expect = 'tiktok_version: 12\.3\.4' }
    $staleCatalog = Join-Path $fixture 'stale-catalog.json'
    Write-FixtureJson $staleCatalog $stale
    $staleOutput = & $shell -NoProfile -File $runner -Validate -Catalog $staleCatalog 2>&1 | Out-String
    Assert-Audit ($LASTEXITCODE -eq 1 -and $staleOutput -match 'names TikTok 12\.3\.4, not the declared') 'A pattern naming an undeclared TikTok version passed -Validate.'
    # Carry an unchanged historical result while running a different patch, then change its definition.
    $second = Copy-Json $staticEntry
    $second.name = 'Second'
    $staticEntry.checks[0].what = 'Changed marker criterion'
    Write-FixtureJson $fixtureCatalog @($staticEntry, $second)
    & $shell -NoProfile -File $runner -NoDevice -Only Second -Catalog $fixtureCatalog -Apk $fixtureApk -Aapt2 $fakeAapt -Results $fixtureResults -OutDir (Join-Path $fixture 'second-evidence') -BuildReceipt $receiptPath -Bundle $fixtureBundle
    Assert-Audit ($LASTEXITCODE -eq 0) 'Partial CLI run failed.'
    $merged = Get-Content $fixtureResults -Raw | ConvertFrom-Json
    Assert-Audit ($merged.qualification.changed -contains 'Static/present') 'Partial rerun promoted an old definition.'
    Assert-Audit ($merged.qualification.currentChecks -eq 1) 'Partial rerun counted stale evidence current.'
    Assert-Audit ($merged.patches[0].checks[0].status -eq 'pass') 'Historical verdict was rewritten.'
} finally {
    if ($null -ne $script:auditLease -and $null -ne $script:auditLease.Stream) { $script:auditLease.Stream.Dispose() }
    $resolved = [IO.Path]::GetFullPath($fixture)
    if (-not $resolved.StartsWith($temporaryRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path -Leaf $resolved) -notlike 'hushfeed-audit-test-*') { throw 'Unsafe fixture cleanup path.' }
    Remove-Item -LiteralPath $resolved -Recurse -Force
}
Write-Host "Audit evidence contracts passed: $script:passed"
