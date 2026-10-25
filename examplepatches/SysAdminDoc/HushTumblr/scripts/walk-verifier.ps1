<# Validate the completed Android verifier comparison carried by one walk. #>
. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')

function ConvertFrom-WalkUtcStamp {
    param($Value)
    if ($Value -is [datetime]) { $Value = $Value.ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ') }
    $parsed = [DateTimeOffset]::MinValue
    if ($Value -isnot [string] -or -not [DateTimeOffset]::TryParseExact($Value, 'yyyy-MM-ddTHH:mm:ssZ',
        [Globalization.CultureInfo]::InvariantCulture, [Globalization.DateTimeStyles]::AssumeUniversal, [ref]$parsed)) {
        throw 'Verifier timestamps are missing or malformed.'
    }
    return $parsed
}

function Assert-WalkVerifierEvidence {
    param($Receipt, [DateTimeOffset]$WalkStarted)
    $proof = $Receipt.verifier
    if ($Receipt.runId -isnot [string] -or $Receipt.runId -cnotmatch '^[0-9a-f]{32}$' -or $null -eq $proof -or
        ($proof.schema -isnot [int] -and $proof.schema -isnot [long]) -or $proof.schema -ne 1 -or
        $proof.runId -cne $Receipt.runId -or $proof.serial -cne $Receipt.serial -or
        $proof.completed -isnot [bool] -or -not $proof.completed -or $proof.staticPassed -isnot [bool] -or -not $proof.staticPassed) {
        throw 'A completed static and device comparison from this walk is required.'
    }
    $identity = $Receipt.deviceIdentity
    foreach ($field in @('Serial', 'Model', 'Build', 'Api', 'Abi')) {
        if ($identity.$field -isnot [string] -or [string]::IsNullOrWhiteSpace($identity.$field)) { throw 'Walk device identity is incomplete.' }
    }
    if ($identity.Serial -cne $Receipt.serial -or $identity.Model -cne $Receipt.device -or
        $identity.Api -cnotmatch '^\d+$' -or [int]$identity.Api -lt 26 -or
        $identity.Abi -cnotin @('arm64-v8a', 'armeabi-v7a', 'x86_64', 'x86') -or
        ($Receipt.emulator -and [string]::IsNullOrWhiteSpace([string]$identity.Avd))) { throw 'Walk device identity is invalid.' }
    foreach ($device in @($proof.device, $proof.clean.device, $proof.patched.device)) {
        foreach ($field in @('Serial', 'Model', 'Build', 'Api', 'Abi', 'Avd')) {
            if ([string]$device.$field -cne [string]$identity.$field) { throw "Verifier device $field differs from the walked device." }
        }
    }
    if ($proof.bundleSha256 -cne $Receipt.bundleSha256 -or $proof.sourceSha256 -cne $Receipt.provenance.sourceSha256 -or
        $proof.inputIdentity -cne $Receipt.provenance.inputIdentity -or $proof.patchedSha256 -cne $Receipt.provenance.output.sha256 -or
        $proof.cleanBaseSha256 -isnot [string] -or $proof.cleanBaseSha256 -cnotmatch '^[0-9a-f]{64}$') {
        throw 'Verifier inputs do not match the walked build.'
    }
    $started = ConvertFrom-WalkUtcStamp $proof.started
    $finished = ConvertFrom-WalkUtcStamp $proof.finished
    if ($finished -lt $started -or $finished -gt $WalkStarted) { throw 'Verifier timing does not precede this walk.' }
    $tallies = @{}
    foreach ($side in @('clean', 'patched')) {
        $run = $proof.$side
        $expectedHash = if ($side -eq 'clean') { $proof.cleanBaseSha256 } else { $proof.patchedSha256 }
        if ($run.completed -isnot [bool] -or -not $run.completed -or $run.markerFound -isnot [bool] -or -not $run.markerFound -or
            ($run.exitCode -isnot [int] -and $run.exitCode -isnot [long]) -or $run.exitCode -ne 0 -or
            ($run.localSize -isnot [int] -and $run.localSize -isnot [long]) -or $run.localSize -lt 1 -or
            ($run.readSize -isnot [int] -and $run.readSize -isnot [long]) -or $run.readSize -ne $run.localSize -or
            $run.localSha256 -cne $expectedHash -or $run.remoteBeforeSha256 -cne $expectedHash -or
            $run.remoteAfterSha256 -cne $expectedHash -or $run.messages -isnot [array]) {
            throw "The $side device verification is incomplete or names other bytes."
        }
        $tally = [Collections.Generic.Dictionary[string, int]]::new([StringComparer]::Ordinal)
        foreach ($entry in @($run.messages)) {
            if ($entry.message -isnot [string] -or [string]::IsNullOrWhiteSpace($entry.message) -or
                ($entry.count -isnot [int] -and $entry.count -isnot [long]) -or $entry.count -lt 1 -or $entry.count -gt [int]::MaxValue -or
                $tally.ContainsKey($entry.message)) { throw 'Verifier message tallies are malformed.' }
            $tally.Add($entry.message, [int]$entry.count)
        }
        $tallies[$side] = $tally
    }
    if (-not (Compare-VerifierTallies -Clean $tallies.clean -Patched $tallies.patched).Valid) {
        throw 'The clean and patched verifier tallies differ.'
    }
}

function Resolve-WalkCleanSource {
    param([string]$Explicit, [string]$Root, [string]$Sha256)
    if ($Explicit) { return $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Explicit) }
    $fixtures = if ($env:HUSHTUMBLR_FIXTURE_DIR) { $env:HUSHTUMBLR_FIXTURE_DIR } else { Join-Path $Root 'fixtures' }
    foreach ($file in @(Get-ChildItem -LiteralPath $fixtures -File | Where-Object { $_.Extension -in @('.apk', '.apkm', '.xapk', '.apks') } | Sort-Object Name)) {
        if ((Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant() -ceq $Sha256) { return $file.FullName }
    }
    throw 'The checked source APK is unavailable. Pass -CleanApk with the exact input named by the signed APK provenance.'
}
