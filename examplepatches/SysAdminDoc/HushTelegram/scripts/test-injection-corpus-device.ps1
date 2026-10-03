<#
.SYNOPSIS
    Run the seeded injection corpus on a named physical Android device.

.DESCRIPTION
    :patches:test writes patches/build/injection-corpus: corpus.dex, holding each generated and
    retained method both before and after its hook went in, and expected.txt, what every run
    printed under the JVM tests' interpreter. This pushes the dex to a folder of its own under
    /data/local/tmp, runs it with dalvikvm and compares every line. ART's verifier loads each
    class, so a hook that leaves a method unverifiable comes back as a VerifyError line, and the
    runtime has the last word on what each method does under each guard answer.

    An explicit physical-device serial is required. No app is installed and no UI, app data or
    account is touched. The device folder is removed in finally, including on failures.

.EXAMPLE
    scripts/test-injection-corpus-device.ps1 -Serial <physical-device-serial>
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Root,
    [string]$Adb
)

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($Serial) -or $Serial -notmatch '^[A-Za-z0-9][A-Za-z0-9._:-]*$') {
    throw 'Pass an explicit physical-device serial with -Serial.'
}
if ($Serial -like 'emulator-*') { throw 'Emulators cannot run this check. Pass a physical-device serial.' }
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

if (-not $Adb) { $Adb = $env:HUSHTELEGRAM_ADB }
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
if (-not $Adb -or -not (Test-Path -LiteralPath $Adb -PathType Leaf)) { throw 'No adb found. Pass -Adb or set HUSHTELEGRAM_ADB.' }
$Adb = (Resolve-Path -LiteralPath $Adb).Path

function Invoke-CorpusDevice {
    param([string[]]$Arguments, [string]$Description)
    $result = Invoke-HushTelegramAdbCommand -Adb $Adb -Arguments (@('-s', $Serial) + $Arguments)
    if ($result.ExitCode -ne 0) {
        throw (Format-HushTelegramAdbFailure -Message $Description -Result $result)
    }
    return $result.Output
}

$state = @(Invoke-CorpusDevice -Arguments @('get-state') -Description 'Could not read the selected device state')
if (@($state | Where-Object { $_.Trim() -eq 'device' }).Count -ne 1) {
    throw "The selected device is not ready: $($state -join ' ')"
}
foreach ($property in @('ro.kernel.qemu', 'ro.boot.qemu')) {
    $value = (@(Invoke-CorpusDevice -Arguments @('shell', 'getprop', $property) `
        -Description "Could not read $property") -join '').Trim()
    if ($value -notin @('', '0')) { throw "The selected device reports $property=$value. Emulators cannot run this check." }
}
$hardware = (@(Invoke-CorpusDevice -Arguments @('shell', 'getprop', 'ro.hardware') `
    -Description 'Could not read device hardware') -join '').Trim()
$model = (@(Invoke-CorpusDevice -Arguments @('shell', 'getprop', 'ro.product.model') `
    -Description 'Could not read device model') -join '').Trim()
if (-not $hardware -or -not $model -or $hardware -match 'goldfish|ranchu|cuttlefish|vbox' `
        -or $model -match 'emulator|android sdk|^sdk[_ -]|genymotion') {
    throw "The selected device has no physical hardware identity ($hardware, $model)."
}
$api = (@(Invoke-CorpusDevice -Arguments @('shell', 'getprop', 'ro.build.version.sdk') `
    -Description 'Could not read device API level') -join '').Trim()
if ($api -notmatch '^\d+$' -or [int]$api -lt 28) { throw "This check needs a physical Android API 28+ device, found $api." }

$runId = [guid]::NewGuid().ToString('N')
$remote = "/data/local/tmp/hushtelegram-injection-$runId"
if ($remote -notmatch '^/data/local/tmp/hushtelegram-injection-[a-f0-9]{32}$') { throw 'Invalid generated device directory.' }
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
    if ($remoteCreated) {
        try {
            [void](Invoke-CorpusDevice -Arguments @('shell', "rm -rf $remote") -Description 'Could not remove the injection corpus device directory')
        } catch {
            if ($null -ne $primaryFailure) { Write-Warning -WarningAction Continue $_.Exception.Message }
            else { throw }
        }
    }
}
