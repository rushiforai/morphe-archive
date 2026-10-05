<#
.SYNOPSIS
    Run the seeded injection corpus on a named leased Android device.

.DESCRIPTION
    :patches:test writes patches/build/injection-corpus: corpus.dex, holding each generated and
    retained method both before and after its hook went in, and expected.txt, what every run
    printed under the JVM tests' interpreter. This pushes the dex to a folder of its own under
    /data/local/tmp, runs it with dalvikvm and compares every line. ART's verifier loads each
    class, so a hook that leaves a method unverifiable comes back as a VerifyError line, and the
    runtime has the last word on what each method does under each guard answer.

    An explicit device serial is required. No app is installed and no UI, app data or
    account is touched. The device folder is removed in finally, including on failures.

.EXAMPLE
    scripts/test-injection-corpus-device.ps1 -Serial <physical-device-serial>
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Root,
    [string]$Adb,
    [string]$LeaseToken = $env:HUSHPINTEREST_DEVICE_LEASE_TOKEN,
    [string]$LeaseDirectory = $env:HUSHPINTEREST_DEVICE_LEASE_DIR,
    [string]$ChatIdentity = $env:HUSHPINTEREST_CHAT_ID
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($Serial) -or $Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._:-]*$') {
    throw 'Pass an explicit device serial with -Serial.'
}
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
$Root = (Resolve-Path -LiteralPath $Root).Path
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')

$corpus = Join-Path $Root 'patches/build/injection-corpus'
$dexFile = Join-Path $corpus 'corpus.dex'
$expectedFile = Join-Path $corpus 'expected.txt'
foreach ($file in @($dexFile, $expectedFile)) {
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        throw "No $file. Run the patch tests first: gradlew :patches:test --tests 'app.morphe.util.injection.*'"
    }
}
$expected = @(Get-Content -LiteralPath $expectedFile -Encoding UTF8 | Where-Object { $_ })
if ($expected.Count -eq 0) { throw "$expectedFile lists no runs." }

if (-not $Adb) { $Adb = $env:HUSHPINTEREST_ADB }
if (-not $Adb) {
    $command = Get-Command adb -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($command) { $Adb = $command.Path }
}
if (-not $Adb) {
    $sdk = @($env:ANDROID_HOME, $env:ANDROID_SDK_ROOT, (Join-Path $env:LOCALAPPDATA 'Android/Sdk')) |
        Where-Object { $_ -and (Test-Path -LiteralPath (Join-Path $_ 'platform-tools/adb.exe') -PathType Leaf) } |
        Select-Object -First 1
    if ($sdk) { $Adb = Join-Path $sdk 'platform-tools/adb.exe' }
}
if (-not $Adb -or -not (Test-Path -LiteralPath $Adb -PathType Leaf)) { throw 'No adb found. Pass -Adb or set HUSHPINTEREST_ADB.' }
$Adb = (Resolve-Path -LiteralPath $Adb).Path

function Invoke-CorpusDevice {
    param([string[]]$Arguments, [string]$Description)
    $result = Invoke-HushLeasedAdb -Adb $Adb -Lease $lease -Arguments $Arguments
    if ($result.ExitCode -ne 0) {
        throw (Format-HushPinterestAdbFailure -Message $Description -Result $result)
    }
    return $result.Output
}

$lease = Enter-HushDeviceLease -Adb $Adb -Serial $Serial -LeaseToken $LeaseToken `
    -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
$model = $lease.Identity.Model
$api = $lease.Identity.Api

$runId = [guid]::NewGuid().ToString('N')
$remote = "/data/local/tmp/hushpinterest-injection-$runId"
if ($remote -notmatch '^/data/local/tmp/hushpinterest-injection-[a-f0-9]{32}$') { throw 'Invalid generated device directory.' }
$remoteCreated = $false
$primaryFailure = $null
try {
    [void](Invoke-CorpusDevice -Arguments @('shell', "mkdir $remote") -Description 'Could not create the unique device directory')
    $remoteCreated = $true
    [void](Invoke-CorpusDevice -Arguments @('push', $dexFile, "$remote/corpus.dex") -Description 'Could not push the injection corpus')
    $output = @(Invoke-CorpusDevice -Arguments @('shell', "dalvikvm -cp $remote/corpus.dex seeded.Main") `
        -Description 'dalvikvm could not run the injection corpus')
    # Every run prints one label=outcome|trace line. Anything else is the runtime talking.
    $actual = @($output | ForEach-Object { $_.TrimEnd() } | Where-Object { $_ -match '^[\w./-]+=(return|throw):' })
    $mismatches = [System.Collections.Generic.List[string]]::new()
    for ($index = 0; $index -lt [Math]::Max($expected.Count, $actual.Count); $index++) {
        $want = if ($index -lt $expected.Count) { $expected[$index] } else { '(nothing)' }
        $got = if ($index -lt $actual.Count) { $actual[$index] } else { '(nothing)' }
        if ($want -cne $got) { $mismatches.Add("run $($index + 1): expected $want`n        ART printed $got") }
    }
    if ($mismatches.Count -gt 0) {
        $other = @($output | Where-Object { $_ -notmatch '^[\w./-]+=(return|throw):' } | Select-Object -First 5)
        throw ("ART disagreed on $($mismatches.Count) of $($expected.Count) runs:`n" +
            (($mismatches | Select-Object -First 5) -join "`n") +
            $(if ($other.Count -gt 0) { "`nOther output: $($other -join ' | ')" } else { '' }))
    }
    Write-Host "[injection] ART matched all $($expected.Count) runs on $model (API $api)."
} catch {
    $primaryFailure = $_
    throw
} finally {
    try {
    if ($remoteCreated) {
        try {
            [void](Invoke-CorpusDevice -Arguments @('shell', "rm -rf $remote") -Description 'Could not remove the injection corpus device directory')
        } catch {
            if ($null -ne $primaryFailure) { Write-Warning -WarningAction Continue $_.Exception.Message }
            else { throw }
        }
    }
    } finally { Exit-HushDeviceLease $lease }
}
