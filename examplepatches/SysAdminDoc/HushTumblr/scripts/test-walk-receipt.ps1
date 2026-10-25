<# Offline contracts for walk-receipt.ps1: publish takes only a full, passing walk of the bundle it ships. #>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'walk-receipt.ps1')
. (Join-Path $PSScriptRoot 'test-walk-data.ps1')

function Assert-WalkContract([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}

$work = Join-Path ([IO.Path]::GetTempPath()) ('hushtumblr-walk-contract-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
try {
    $bundle = Join-Path $work 'patches-0.0.9.mpp'
    [IO.File]::WriteAllText($bundle, 'the signed bundle')
    $walkPath = Join-Path $work 'walk-receipt.json'
    $fixture = New-WalkTestData -Directory $work -BundlePath $bundle
    $proofArguments = $fixture.Arguments
    # The receipt a walk of that bundle writes. -Change bends one field.
    function Write-Walk([hashtable]$Change = @{}) {
        $serialValue = if ($Change.ContainsKey('serial')) { $Change.serial } else { 'TESTPHONE01' }
        $modelValue = if ($Change.ContainsKey('device') -and $null -ne $Change.device) { $Change.device } else { 'SM-S908U1' }
        $runId = 'b' * 32
        $deviceProof = New-WalkTestVerifier -Fixture $fixture -Serial $serialValue -Model $modelValue -RunId $runId
        $walk = New-WalkReceipt -Result PASS -Full $true -Serial 'TESTPHONE01' -Device 'SM-S908U1' -AppVersion $fixture.Output.versionName `
            -BundleSha256 (Get-FileHash -LiteralPath $bundle -Algorithm SHA256).Hash -InstalledApkSha256 ('4' * 64) `
            -Provenance $fixture.Provenance -InstalledBefore $fixture.Output -InstalledAfter $fixture.Output `
            -Routes $fixture.Routes `
            -RunId $runId -DeviceIdentity $deviceProof.Identity -Verifier $deviceProof.Verifier `
            -Started '2026-10-21T16:00:00Z' -Finished '2026-10-21T16:30:00Z' -Screens $fixture.Routes.Count -Crashes 0
        foreach ($key in $Change.Keys) { $walk[$key] = $Change[$key] }
        [IO.File]::WriteAllText($walkPath, ($walk | ConvertTo-Json -Depth 8))
    }

    # Either release phone or an emulator walks for a release.
    foreach ($walker in @(@{}, @{ device = 'SM-S938B' }, @{ serial = 'emulator-5554'; device = 'sdk_gphone64_x86_64'; emulator = $true })) {
        Write-Walk $walker
        $good = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
        Assert-WalkContract ($good.Valid -and $good.Receipt.screens -eq 17) "A full PASS walk of the bundle was refused: $($good.Reason)"
    }

    foreach ($badWalk in @(
            @(@{ result = 'FAIL' }, '*the walk ended FAIL, not PASS*'),
            @(@{ result = 'PARTIAL'; full = $false }, '*the walk ended PARTIAL, not PASS*'),
            @(@{ result = $null }, '*ended with no result*'),
            @(@{ full = $false }, '*was not the whole app*'),
            @(@{ screens = 0 }, "*doesn't say it opened any screen*"),
            @(@{ crashes = 1 }, '*recorded a Tumblr crash*'),
            @(@{ problems = @('a required page did not open') }, '*recorded problems*'),
            @(@{ problems = $null }, '*recorded problems*'),
            @(@{ started = 'not a time' }, '*timestamps*'),
            @(@{ finished = '2026-10-20T16:00:00Z' }, '*timestamps*'),
            @(@{ finished = '2026-10-21T16:00:00Z' }, '*timestamps*'),
            @(@{ routes = @() }, '*route plan*'),
            @(@{ screens = 1 }, '*route plan*'),
            @(@{ verifier = $null }, '*device verifier*'),
            @(@{ runId = '' }, '*device verifier*'),
            @(@{ deviceIdentity = $null }, '*device verifier*'),
            @(@{ installedApkSha256 = '' }, '*identity*'),
            @(@{ device = $null }, "*doesn't say which device walked it*"),
            @(@{ device = 'Pixel 9' }, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ device = 'Pixel 9'; emulator = $true }, "*Pixel 9 isn't one of the release walk phones*"),
            @(@{ bundleSha256 = ('5' * 64) }, '*patched with bundle*and this one is*'),
            @(@{ schema = 1 }, '*historical receipts*'),
            @(@{ provenance = $null }, '*identity*'),
            @(@{ installedBefore = $null }, '*identity*'),
            @(@{ installedAfter = $null }, '*identity*'),
            @(@{ appVersion = 'wrong-version' }, '*identity*'),
            @(@{ installedApkSha256 = 'f' * 64 }, '*identity*'))) {
        Write-Walk $badWalk[0]
        $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like $badWalk[1]) "Expected the walk refusal [$($badWalk[1])], got [$($bad.Reason)]."
    }
    foreach ($fault in @('omitted', 'duplicate', 'wrong-destination', 'unverified', 'wrong-query', 'blocked', 'unknown')) {
        Write-Walk
        $changed = Get-Content -LiteralPath $walkPath -Raw | ConvertFrom-Json
        switch ($fault) {
            'omitted' { $changed.routes = @($changed.routes | Select-Object -Skip 1); $changed.screens-- }
            'duplicate' { $changed.routes = @($changed.routes) + @($changed.routes[0]); $changed.screens++ }
            'wrong-destination' { $changed.routes[0].observation.activity = 'com.tumblr/.ui.activity.LoginActivity' }
            'unverified' { $changed.routes[0].status = 'UNVERIFIED' }
            'wrong-query' { $changed.routes[2].observation.markerMatches = $false }
            'blocked' { $changed.routes[0].observation.blocked = $true }
            'unknown' { $changed.routes[0].id = 'claimed.extra.screen' }
        }
        [IO.File]::WriteAllText($walkPath, ($changed | ConvertTo-Json -Depth 8))
        $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*route plan*') "Accepted $fault route evidence: $($bad.Reason)"
    }
    foreach ($fault in @('static-only', 'aborted', 'wrong-input', 'wrong-bundle', 'wrong-run', 'wrong-device', 'wrong-build',
            'changed-before', 'changed-after', 'no-marker', 'wrong-size', 'extra-tally', 'missing-tally', 'duplicate-tally', 'bad-time')) {
        Write-Walk
        $changed = Get-Content -LiteralPath $walkPath -Raw | ConvertFrom-Json
        switch ($fault) {
            'static-only' { $changed.verifier.patched = $null }
            'aborted' { $changed.verifier.completed = $false }
            'wrong-input' { $changed.verifier.sourceSha256 = 'f' * 64 }
            'wrong-bundle' { $changed.verifier.bundleSha256 = 'f' * 64 }
            'wrong-run' { $changed.verifier.runId = 'c' * 32 }
            'wrong-device' { $changed.verifier.serial = 'another-device' }
            'wrong-build' { $changed.verifier.device.Build = 'another/build' }
            'changed-before' { $changed.verifier.patched.remoteBeforeSha256 = 'f' * 64 }
            'changed-after' { $changed.verifier.patched.remoteAfterSha256 = 'f' * 64 }
            'no-marker' { $changed.verifier.patched.markerFound = $false }
            'wrong-size' { $changed.verifier.patched.readSize = 0 }
            'extra-tally' { $changed.verifier.patched.messages = @(@{ message = 'VerifyError extra'; count = 1 }) }
            'missing-tally' { $changed.verifier.clean.messages = @(@{ message = 'VerifyError missing'; count = 1 }) }
            'duplicate-tally' { $changed.verifier.patched.messages = @(@{ message = 'VerifyError repeated'; count = 1 }, @{ message = 'VerifyError repeated'; count = 1 }) }
            'bad-time' { $changed.verifier.finished = '2026-10-21T18:00:00Z' }
        }
        [IO.File]::WriteAllText($walkPath, ($changed | ConvertTo-Json -Depth 10))
        $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
        Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*device verifier*') "Accepted $fault verifier evidence: $($bad.Reason)"
    }
    foreach ($field in @('sha256', 'package', 'versionName', 'versionCode', 'signers')) {
        foreach ($boundary in @('provenance.output', 'installedBefore', 'installedAfter')) {
            Write-Walk
            $changed = Get-Content -LiteralPath $walkPath -Raw | ConvertFrom-Json
            $identity = if ($boundary -eq 'provenance.output') { $changed.provenance.output } else { $changed.$boundary }
            $identity.$field = if ($field -eq 'signers') { @('b' * 64) } elseif ($field -eq 'sha256') { 'f' * 64 } else { 'wrong' }
            [IO.File]::WriteAllText($walkPath, ($changed | ConvertTo-Json -Depth 8))
            $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
            Assert-WalkContract (-not $bad.Valid) "Accepted a changed $field at $boundary."
        }
    }
    foreach ($field in @('sourceSha256', 'catalogSha256', 'inputIdentity', 'mergedApkSha256', 'bundleSha256', 'patches', 'options')) {
        Write-Walk
        $changed = Get-Content -LiteralPath $walkPath -Raw | ConvertFrom-Json
        $changed.provenance.$field = switch ($field) {
            'patches' { @('not a patch') }
            'options' { @('Dark background color:backgroundColor=#121212') }
            default { 'f' * 64 }
        }
        if ($field -in @('inputIdentity', 'mergedApkSha256')) { $changed.provenance.$field = '' }
        [IO.File]::WriteAllText($walkPath, ($changed | ConvertTo-Json -Depth 8))
        $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
        Assert-WalkContract (-not $bad.Valid) "Accepted changed provenance $field."
    }
    [IO.File]::WriteAllText($walkPath, 'not json')
    $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*doesn't read as JSON*") "A receipt that isn't JSON read as: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path (Join-Path $work 'none.json') -BundlePath $bundle @proofArguments
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no walk receipt at*") "A missing receipt read as: $($bad.Reason)"

    # A walk of one bundle never backs another, even a rebuild of the same commit.
    Write-Walk
    [IO.File]::WriteAllText($bundle, 'the signed bundle, rebuilt')
    $bad = Test-WalkReceipt -Path $walkPath -BundlePath $bundle @proofArguments
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like '*patched with bundle*and this one is*') "A walk backed another bundle: $($bad.Reason)"
    $bad = Test-WalkReceipt -Path $walkPath -BundlePath (Join-Path $work 'gone.mpp') @proofArguments
    Assert-WalkContract (-not $bad.Valid -and $bad.Reason -like "*there's no bundle at*") "A walk backed a bundle that isn't there: $($bad.Reason)"
} finally {
    Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue
}

# Publish asks for the walk once the signed assets check out, before GitHub or the index.
$publishText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'release/publish-release.ps1'))
$assetsAt = $publishText.IndexOf('$built = Test-ReleaseAssets')
$walkAt = $publishText.IndexOf('$walked = Test-WalkReceipt -Path $Walk')
$refuseAt = $publishText.IndexOf('if (-not $walked.Valid) {')
foreach ($later in @('Get-PublishedRelease', 'gh release create', 'gh repo edit', 'Invoke-ReleasePush')) {
    $laterAt = $publishText.IndexOf($later, $publishText.IndexOf('Assert-ReleaseClean $Root'))
    Assert-WalkContract ($assetsAt -gt 0 -and $walkAt -gt $assetsAt -and $refuseAt -gt $walkAt -and $laterAt -gt $refuseAt) `
        "publish-release.ps1 reaches $later before it holds the bundle to its walk."
}
$releaseText = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'release/release.ps1'))
Assert-WalkContract ($releaseText -match '(?m)^\s*\[string\]\$Walk,' -and $releaseText -match 'Walk = \$Walk') 'release.ps1 -Stage publish drops -Walk.'
Write-Host '[scripts] walk receipt contracts passed'
