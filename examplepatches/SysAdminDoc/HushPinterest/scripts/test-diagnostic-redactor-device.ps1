<#
.SYNOPSIS
    Run the diagnostic redactor's real synthetic corpus on a named leased Android device.

.DESCRIPTION
    Compiles the production redactor and its JVM test corpus with the selected JDK. A host-only
    export writes base64 TSV, so D8 packages only the redactor and this check, without JUnit.
    Every row, their joined report and the exact Pinterest probe run first on the JVM and then
    on Android's ART/ICU regex engine. The device run uses dalvikvm in its own temporary folder.

    An explicit device serial is required. No app is installed and no UI, app data or
    account is accessed. Both temporary folders are removed in finally, including on failures.

.EXAMPLE
    scripts/test-diagnostic-redactor-device.ps1 -Serial <physical-device-serial> -Java <jdk>
#>
[CmdletBinding()]
param(
    [string]$Serial,
    [string]$Root,
    [string]$Java,
    [string]$D8,
    [string]$Adb,
    [string]$AndroidJar,
    [string]$JUnitJar,
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
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'injected-register-contracts.ps1')
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')
$Java = Resolve-Java -Explicit $Java
$javac = Join-Path (Split-Path -Parent $Java) 'javac.exe'
if (-not (Test-Path -LiteralPath $javac -PathType Leaf)) { throw "No javac beside the selected Java: $javac" }
$D8 = Resolve-D8 -Explicit $D8 -Root $Root
$buildTools = Split-Path -Parent $D8
# d8.bat's entry point, invoked with the selected Java instead of its ambient JAVA_HOME.
$d8Jar = @('d8.jar', 'lib/d8.jar', '../framework/d8.jar' | ForEach-Object {
    Join-Path $buildTools $_
} | Where-Object { Test-Path -LiteralPath $_ -PathType Leaf } | Select-Object -First 1)
if ($d8Jar.Count -ne 1) { throw "No d8.jar beside $D8." }
$sdk = Split-Path -Parent (Split-Path -Parent $buildTools)
if (-not $AndroidJar) {
    # Use the shared library's compile SDK, rather than silently selecting a newer platform.
    $libraryBuild = Get-Content -LiteralPath (Join-Path $Root 'extensions/shared/library/build.gradle.kts') -Raw
    if ($libraryBuild -notmatch 'compileSdk\s*=\s*(\d+)') { throw 'No numeric shared-library compileSdk found. Pass -AndroidJar.' }
    $AndroidJar = Join-Path $sdk "platforms/android-$($Matches[1])/android.jar"
}
if (-not (Test-Path -LiteralPath $AndroidJar -PathType Leaf)) { throw "Android platform jar not found: $AndroidJar" }
$AndroidJar = (Resolve-Path -LiteralPath $AndroidJar).Path
if (-not $Adb) { $Adb = $env:HUSHPINTEREST_ADB }
if (-not $Adb) {
    $command = Get-Command adb -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($command) { $Adb = $command.Path }
}
if (-not $Adb) { $Adb = Join-Path $sdk 'platform-tools/adb.exe' }
if (-not (Test-Path -LiteralPath $Adb -PathType Leaf)) {
    $command = Get-Command $Adb -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($command) { $Adb = $command.Path }
}
if (-not (Test-Path -LiteralPath $Adb -PathType Leaf)) { throw 'No adb found. Pass -Adb or set HUSHPINTEREST_ADB.' }
$Adb = (Resolve-Path -LiteralPath $Adb).Path

function Invoke-RedactorHost {
    param([string]$Program, [string[]]$Arguments, [string]$Description)
    $ErrorActionPreference = 'Continue'
    $PSNativeCommandUseErrorActionPreference = $false
    $global:LASTEXITCODE = -1
    $output = @(& $Program @Arguments 2>&1 | ForEach-Object { "$_" })
    if ($LASTEXITCODE -ne 0) { throw "$Description exited $LASTEXITCODE.`n$($output -join "`n")" }
    return $output
}

function Invoke-RedactorDevice {
    param([string[]]$Arguments, [string]$Description)
    $result = Invoke-HushLeasedAdb -Adb $Adb -Lease $lease -Arguments $Arguments
    if ($result.ExitCode -ne 0) {
        throw (Format-HushPinterestAdbFailure -Message $Description -Result $result)
    }
    return $result.Output
}

$identity = Get-HushDeviceIdentity -Adb $Adb -Serial $Serial
$model = $identity.Model
$api = $identity.Api

# Use the test dependency already pinned and hash-verified by this repository, with no download.
$verification = [xml](Get-Content -LiteralPath (Join-Path $Root 'gradle/verification-metadata.xml') -Raw)
$junitComponents = @($verification.DocumentElement.components.component |
    Where-Object { $_.group -eq 'junit' -and $_.name -eq 'junit' })
if ($junitComponents.Count -ne 1) { throw 'Expected exactly one verified JUnit component.' }
$junitComponent = $junitComponents[0]
$junitName = "junit-$($junitComponent.version).jar"
$junitHashes = @($junitComponent.artifact | Where-Object { $_.name -eq $junitName } |
    ForEach-Object { $_.sha256 } | ForEach-Object { $_.value })
if ($junitHashes.Count -eq 0) { throw "No verified hash for $junitName." }
if (-not $JUnitJar) {
    $gradleCache = if ($env:GRADLE_USER_HOME) { $env:GRADLE_USER_HOME } else { Join-Path $env:USERPROFILE '.gradle' }
    $componentCache = Join-Path $gradleCache "caches/modules-2/files-2.1/junit/junit/$($junitComponent.version)"
    $cached = @(Get-ChildItem -LiteralPath $componentCache -Recurse -File -Filter $junitName `
        -ErrorAction SilentlyContinue | Select-Object -First 1)
    if ($cached.Count -ne 1) { throw "No cached $junitName. Run the extension tests first or pass -JUnitJar." }
    $JUnitJar = $cached[0].FullName
}
if (-not (Test-Path -LiteralPath $JUnitJar -PathType Leaf)) { throw "JUnit jar not found: $JUnitJar" }
$JUnitJar = (Resolve-Path -LiteralPath $JUnitJar).Path
if ((Get-FileHash -LiteralPath $JUnitJar -Algorithm SHA256).Hash -notin $junitHashes) {
    throw "JUnit jar does not match the repository's verified hash: $JUnitJar"
}

$tempRoot = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$runId = [guid]::NewGuid().ToString('N')
$work = Resolve-WithinRoot -Path (Join-Path $tempRoot "hushpinterest-redactor-$runId") -Root $tempRoot
$remote = "/data/local/tmp/hushpinterest-redactor-$runId"
if ($remote -notmatch '^/data/local/tmp/hushpinterest-redactor-[a-f0-9]{32}$') { throw 'Invalid generated device directory.' }
$remoteCreated = $false
$workCreated = $false
$primaryFailure = $null
$lease = Enter-HushDeviceLease -Adb $Adb -Serial $Serial -LeaseToken $LeaseToken `
    -LeaseDirectory $LeaseDirectory -ChatIdentity $ChatIdentity
try {
    New-Item -ItemType Directory -Path $work | Out-Null
    $workCreated = $true
    $hostClasses = Join-Path $work 'host'
    $deviceClasses = Join-Path $work 'device'
    $dex = Join-Path $work 'dex'
    New-Item -ItemType Directory -Path $hostClasses, $deviceClasses, $dex | Out-Null
    $redactor = Join-Path $Root 'extensions/shared/library/src/main/java/app/hushpinterest/extension/shared/diagnostics/DiagnosticRedactor.java'
    $test = Join-Path $Root 'extensions/pinterest/src/test/java/app/hushpinterest/extension/shared/diagnostics/DiagnosticRedactorTest.java'
    $check = Join-Path $PSScriptRoot 'checks/DiagnosticRedactorDevice.java'
    [void](Invoke-RedactorHost -Program $javac -Description 'Compile host redactor corpus' `
        -Arguments @('--release', '17', '-encoding', 'UTF-8', '-cp', $JUnitJar, '-d', $hostClasses, $redactor, $test, $check))
    $corpus = Join-Path $work 'corpus.tsv'
    $hostClasspath = $hostClasses + [System.IO.Path]::PathSeparator + $JUnitJar
    $export = @(Invoke-RedactorHost -Program $Java -Description 'Export real diagnostic corpus' `
        -Arguments @('-cp', $hostClasspath, 'DiagnosticRedactorDevice', '--export', $corpus))
    $exportMarker = @($export | Where-Object { $_ -match '^HUSHPINTEREST_REDACTOR_EXPORT rows=(\d+) exact=1$' })
    if ($exportMarker.Count -ne 1 -or $exportMarker[0] -notmatch 'rows=(\d+)') { throw 'The host exported no corpus tally.' }
    $rows = [int]$Matches[1]
    if ($rows -le 0) { throw 'The exported diagnostic corpus is empty.' }
    $expectedMarker = "HUSHPINTEREST_REDACTOR_OK rows=$rows joined=1 exact=1"
    $hostRun = @(Invoke-RedactorHost -Program $Java -Description 'Check diagnostic corpus on the JVM' `
        -Arguments @('-cp', $hostClasses, 'DiagnosticRedactorDevice', '--check', $corpus))
    if (@($hostRun | Where-Object { $_ -eq $expectedMarker }).Count -ne 1) { throw 'The JVM reported no complete diagnostic check.' }
    Write-Host "[redactor] JVM passed $rows rows, joined report and exact Pinterest controls."

    [void](Invoke-RedactorHost -Program $javac -Description 'Compile device redactor payload' `
        -Arguments @('--release', '17', '-encoding', 'UTF-8', '-d', $deviceClasses, $redactor, $check))
    $classFiles = @(Get-ChildItem -LiteralPath $deviceClasses -Recurse -Filter '*.class' -File |
        Select-Object -ExpandProperty FullName)
    [void](Invoke-RedactorHost -Program $Java -Description 'D8 diagnostic redactor payload' `
        -Arguments (@('-cp', $d8Jar[0], 'com.android.tools.r8.D8', '--min-api', '28', '--lib', $AndroidJar, '--output', $dex) + $classFiles))
    $dexFile = Join-Path $dex 'classes.dex'
    if (-not (Test-Path -LiteralPath $dexFile -PathType Leaf)) { throw 'D8 wrote no classes.dex.' }
    [void](Invoke-RedactorDevice -Arguments @('shell', "mkdir $remote") -Description 'Could not create the unique device directory')
    $remoteCreated = $true
    [void](Invoke-RedactorDevice -Arguments @('push', $dexFile, "$remote/classes.dex") -Description 'Could not push diagnostic dex')
    [void](Invoke-RedactorDevice -Arguments @('push', $corpus, "$remote/corpus.tsv") -Description 'Could not push diagnostic corpus')
    $deviceRun = @(Invoke-RedactorDevice -Arguments @('shell', "dalvikvm -cp $remote/classes.dex DiagnosticRedactorDevice --check $remote/corpus.tsv") `
        -Description 'Android diagnostic redactor check failed')
    if (@($deviceRun | Where-Object { $_ -eq $expectedMarker }).Count -ne 1) {
        throw "Android reported no complete diagnostic check: $($deviceRun -join ' ')"
    }
    Write-Host "[redactor] ART/ICU passed $rows rows, joined report and exact Pinterest controls on $model (API $api)."
} catch {
    $primaryFailure = $_
    throw
} finally {
    try {
    $cleanupFailures = [System.Collections.Generic.List[string]]::new()
    if ($remoteCreated) {
        try {
            [void](Invoke-RedactorDevice -Arguments @('shell', "rm -rf $remote") -Description 'Could not remove the diagnostic device directory')
        } catch { $cleanupFailures.Add($_.Exception.Message) }
    }
    if ($workCreated) {
        try {
            $safeWork = Resolve-WithinRoot -Path $work -Root $tempRoot
            if (Test-Path -LiteralPath $safeWork) { Remove-Item -LiteralPath $safeWork -Recurse -Force }
        } catch { $cleanupFailures.Add($_.Exception.Message) }
    }
    if ($cleanupFailures.Count -gt 0) {
        $message = 'Diagnostic cleanup failed. ' + ($cleanupFailures -join ' ')
        if ($null -ne $primaryFailure) { Write-Warning -WarningAction Continue $message }
        else { throw $message }
    }
    } finally { Exit-HushDeviceLease $lease }
}
