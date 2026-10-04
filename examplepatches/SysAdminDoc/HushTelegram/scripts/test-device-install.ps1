<#
.SYNOPSIS
    Check lease, device identity, signing and downgrade refusal without a real device.
#>
[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'scripts/common.ps1')
. (Join-Path $Root 'scripts/device-install.ps1')

$caseRoot = Join-Path $env:TEMP ('hushtelegram-install-test-' + [guid]::NewGuid().ToString('N'))
$cases = 0
New-Item -ItemType Directory -Path $caseRoot | Out-Null
try {
    $leaseDir = Join-Path $caseRoot 'device-leases'
    New-Item -ItemType Directory -Path $leaseDir -Force | Out-Null
    $candidate = Join-Path $caseRoot 'candidate.apk'
    [IO.File]::WriteAllText($candidate, 'synthetic APK')
    $fakeAdb = Join-Path $caseRoot 'adb.cmd'
    $log = Join-Path $caseRoot 'adb.log'
    $script:fixtureEventLog = Join-Path $caseRoot 'events.log'
    $modePath = Join-Path $caseRoot 'mode.txt'
    $leasePath = Join-Path $leaseDir 'emulator-7778.json'
    $script:fixtureLeasePath = $leasePath
    $token = [guid]::NewGuid().ToString()
    $chat = 'install-contract-test'
    $fakeBody = @'
@echo off
set /p FAKE_ADB_MODE=<"%~dp0mode.txt"
echo %*>>"%~dp0adb.log"
echo adb %*>>"%~dp0events.log"
if "%3"=="get-state" goto state
if "%3"=="get-serialno" echo %2
if "%3|%4|%5"=="shell|getprop|ro.product.model" echo FakeModel
if "%3|%4|%5"=="emu|avd|name" echo FakeAVD
if "%3|%4|%5"=="shell|pm|path" goto package_path
if "%3|%4|%5|%6"=="shell|pm|list|packages" goto inventory
if "%3"=="pull" goto pull
if "%3"=="install" goto install
exit /b 0
:state
if "%FAKE_ADB_MODE%"=="disconnected" exit /b 17
echo device
exit /b 0
:package_path
if "%FAKE_ADB_MODE%"=="check-fail" exit /b 18
if "%FAKE_ADB_MODE%"=="check-text" echo Error: package manager unavailable
if "%FAKE_ADB_MODE%"=="absent" exit /b 0
if "%FAKE_ADB_MODE%"=="absent-exit1" exit /b 1
if "%FAKE_ADB_MODE%"=="absent-lease-before-inventory" goto path_lease_loss
if "%FAKE_ADB_MODE%"=="absent-lease-before-install" exit /b 1
if "%FAKE_ADB_MODE:~0,10%"=="inventory-" exit /b 1
if "%FAKE_ADB_MODE%"=="path-exit1-package" goto path_failed_package
if "%FAKE_ADB_MODE%"=="path-exit1-error" goto path_error
if "%FAKE_ADB_MODE%"=="path-offline" goto path_offline
if "%FAKE_ADB_MODE%"=="path-permission" goto path_permission
if "%FAKE_ADB_MODE%"=="path-exit1-blank" goto path_failed_blank
if "%FAKE_ADB_MODE%"=="path-exit2-empty" exit /b 2
if "%FAKE_ADB_MODE%"=="path-exit0-blank" goto path_blank
if not "%FAKE_ADB_MODE%"=="check-text" echo package:/data/app/example/base.apk
exit /b 0
:path_lease_loss
del /q "%~dp0device-leases\emulator-7778.json"
exit /b 1
:path_failed_package
echo package:/data/app/example/base.apk
exit /b 1
:path_error
echo Error: package manager unavailable
exit /b 1
:path_offline
echo error: device offline 1>&2
exit /b 1
:path_permission
echo SecurityException: Permission Denial 1>&2
exit /b 1
:path_failed_blank
echo.
exit /b 1
:path_blank
echo.
exit /b 0
:inventory
if "%FAKE_ADB_MODE%"=="inventory-fail" exit /b 21
if "%FAKE_ADB_MODE%"=="inventory-exit1-empty" exit /b 1
if "%FAKE_ADB_MODE%"=="inventory-exit1-data" goto inventory_failed_data
if "%FAKE_ADB_MODE%"=="inventory-offline" goto inventory_offline
if "%FAKE_ADB_MODE%"=="inventory-permission" goto inventory_permission
if "%FAKE_ADB_MODE%"=="inventory-empty" exit /b 0
if "%FAKE_ADB_MODE%"=="inventory-malformed" echo package:com..example
if "%FAKE_ADB_MODE%"=="inventory-error" echo Error: package manager unavailable
if "%FAKE_ADB_MODE%"=="inventory-path" echo package:/data/app/example/base.apk
if "%FAKE_ADB_MODE%"=="inventory-unprefixed" echo com.example.other
if "%FAKE_ADB_MODE%"=="inventory-prefix-case" echo Package:com.example.other
if "%FAKE_ADB_MODE%"=="inventory-blank" echo.
if "%FAKE_ADB_MODE%"=="inventory-spaced" echo package: android
if "%FAKE_ADB_MODE%"=="inventory-duplicate" echo package:android
if "%FAKE_ADB_MODE%"=="inventory-candidate" echo package:com.example.app
if "%FAKE_ADB_MODE%"=="inventory-android-case" echo package:Android
if "%FAKE_ADB_MODE%"=="inventory-android-prefix" echo package:android.other
if not "%FAKE_ADB_MODE%"=="inventory-no-android" if not "%FAKE_ADB_MODE%"=="inventory-android-case" if not "%FAKE_ADB_MODE%"=="inventory-android-prefix" echo package:android
echo package:com.example.other
echo package:com.example.app.debug
echo package:com.example.application
if "%FAKE_ADB_MODE%"=="absent-lease-before-install" del /q "%~dp0device-leases\emulator-7778.json"
exit /b 0
:inventory_failed_data
echo package:android
exit /b 1
:inventory_offline
echo error: device offline 1>&2
exit /b 1
:inventory_permission
echo SecurityException: Permission Denial 1>&2
exit /b 1
:pull
if "%FAKE_ADB_MODE%"=="pull-fail" exit /b 19
copy /y "%~dp0candidate.apk" "%~5" >nul
exit /b 0
:install
if "%FAKE_ADB_MODE%"=="install-fail" exit /b 20
if "%FAKE_ADB_MODE%"=="false-success" echo Failure [INSTALL_FAILED_TEST]
if not "%FAKE_ADB_MODE%"=="false-success" echo Success
exit /b 0
'@
    [IO.File]::WriteAllText($fakeAdb, $fakeBody, [Text.Encoding]::ASCII)
    # Native tooling is replaced only in this isolated child script. Certificate/version facts
    # vary independently of ADB's answers, so the ordering assertions don't reuse production logic.
    function Get-ApkManifestFacts {
        param([string]$Apk, [string]$Aapt2)
        $installed = (Split-Path -Leaf $Apk) -ceq 'installed.apk'
        $kind = if ($installed) { 'installed' } else { 'candidate' }
        [IO.File]::AppendAllText($script:fixtureEventLog, "manifest:$kind`r`n", [Text.Encoding]::ASCII)
        $package = if ($script:mode -ceq 'wrong-package' -and -not $installed) { 'com.example.other' } else { 'com.example.app' }
        $version = if ($script:mode -ceq 'downgrade' -and $installed) { '21' } else { '20' }
        if ($script:mode -ceq 'invalid-version' -and -not $installed) { $version = 'invalid' }
        return [pscustomobject]@{ package = $package; versionCode = $version; versionName = '1.0' }
    }
    function Get-VendorSignerDigests {
        param([string]$Apk, [string]$Aapt2)
        $installed = (Split-Path -Leaf $Apk) -ceq 'installed.apk'
        $kind = if ($installed) { 'installed' } else { 'candidate' }
        [IO.File]::AppendAllText($script:fixtureEventLog, "signer:$kind`r`n", [Text.Encoding]::ASCII)
        if ($script:mode -ceq 'no-signer' -and -not $installed) { return @() }
        if ($script:mode -ceq 'lose-lease-before-path' -and -not $installed) {
            Remove-Item -LiteralPath $script:fixtureLeasePath -Force
        }
        if ($script:mode -ceq 'lose-lease' -and (Split-Path -Leaf $Apk) -ceq 'installed.apk') {
            Remove-Item -LiteralPath $script:fixtureLeasePath -Force
        }
        if ($script:mode -ceq 'signer-mismatch' -and (Split-Path -Leaf $Apk) -ceq 'installed.apk') { return ('b' * 64) }
        return ('a' * 64)
    }
    function Reset-Case {
        param([string]$Mode)
        $script:mode = $Mode
        [IO.File]::WriteAllText($modePath, $Mode, [Text.Encoding]::ASCII)
        if (Test-Path -LiteralPath $log) { Remove-Item -LiteralPath $log -Force }
        if (Test-Path -LiteralPath $script:fixtureEventLog) { Remove-Item -LiteralPath $script:fixtureEventLog -Force }
        $now = [DateTimeOffset]::UtcNow
        $script:lease = [ordered]@{
            schemaVersion = 1; serial = 'emulator-7778'; project = 'HushTelegram'; chatIdentity = $chat;
            ownershipToken = $token; acquiredUtc = $now.AddMinutes(-1).ToString('o'); expiresUtc = $now.AddMinutes(5).ToString('o'); purpose = 'synthetic install checks'
        }
        Write-Lease
    }
    function Write-Lease { [IO.File]::WriteAllText($leasePath, ($script:lease | ConvertTo-Json)) }
    function Run-Install {
        param([string]$Model = 'FakeModel', [string]$Avd = 'FakeAVD')
        Install-AndroidPackage -Adb $fakeAdb -Serial 'emulator-7778' -PackageName 'com.example.app' `
            -Apk $candidate -Aapt2 'unused' -LeaseDirectory $leaseDir -LeaseToken $token -ChatIdentity $chat `
            -ExpectedModel $Model -ExpectedAvd $Avd -WorkDirectory $caseRoot
    }
    function Assert-Cleanup {
        if (@(Get-ChildItem -LiteralPath $caseRoot -Directory -Filter 'install-*').Count) { throw 'Owned install scratch was not removed.' }
    }
    function Assert-SafeCalls {
        param([string[]]$Calls)
        if ($null -eq $Calls -or $Calls.Length -eq 0) { return }
        if (@($Calls | Where-Object { $_ -notmatch '^-s emulator-7778 ' }).Count) { throw 'ADB did not select the exact leased serial.' }
        if (@($Calls | Where-Object { $_ -match '\s(-g|-d|uninstall)\b| shell pm (grant|revoke|clear)\b' }).Count) {
            throw 'Install changed grants, cleared data, downgraded or uninstalled.'
        }
    }
    function Assert-Refusal {
        param([scriptblock]$Action, [bool]$NoAdb = $false)
        $caught = $false
        try { & $Action } catch { $caught = $true }
        if (-not $caught) { throw 'Unsafe install was accepted.' }
        $calls = if (Test-Path -LiteralPath $log) { @(Get-Content -LiteralPath $log) } else { @() }
        if ($NoAdb -and $calls.Count) { throw 'ADB ran before lease ownership was proved.' }
        if (@($calls | Where-Object { $_ -match '\s(install|uninstall)\s' }).Count) { throw 'A refused preflight reached mutation.' }
        Assert-SafeCalls -Calls $calls
        Assert-Cleanup
        $script:cases++
    }
    foreach ($modeValue in @('present', 'absent', 'absent-exit1', 'inventory-lookalikes')) {
        Reset-Case $modeValue
        Run-Install
        $calls = @(Get-Content -LiteralPath $log)
        $installs = @($calls | Where-Object { $_ -match '\sinstall\s' })
        if ($installs.Count -ne 1 -or $installs[0] -notmatch '^-s emulator-7778 install -r ' -or
            @($calls | Where-Object { $_ -match '\s(-g|-d|uninstall)\b' }).Count) { throw 'Install granted permissions, downgraded or uninstalled.' }
        $pathIndex = [Array]::FindIndex([string[]]$calls, [Predicate[string]]{ param($line) $line -match ' shell pm path ' })
        $installIndex = [Array]::FindIndex([string[]]$calls, [Predicate[string]]{ param($line) $line -match ' install -r ' })
        if ($pathIndex -lt 0 -or $installIndex -le $pathIndex) { throw 'Install preceded package preflight.' }
        if (@(Get-ChildItem -LiteralPath $caseRoot -Directory -Filter 'install-*').Count) { throw 'Owned install scratch was not removed.' }
        Assert-SafeCalls -Calls $calls
        $events = [string[]]@(Get-Content -LiteralPath $script:fixtureEventLog)
        $manifestIndex = [Array]::IndexOf($events, 'manifest:candidate')
        $signerIndex = [Array]::IndexOf($events, 'signer:candidate')
        $queryIndex = [Array]::FindIndex($events, [Predicate[string]]{ param($line) $line -match '^adb -s emulator-7778 shell pm (path|list packages) ' })
        if ($manifestIndex -lt 0 -or $signerIndex -le $manifestIndex -or $queryIndex -le $signerIndex) {
            throw 'A package query preceded candidate identity, version or signer preflight.'
        }
        $inventoryIndex = [Array]::FindIndex([string[]]$calls, [Predicate[string]]{ param($line) $line -match ' shell pm list packages$' })
        $pulls = @($calls | Where-Object { $_ -match ' pull ' })
        if ($modeValue -ceq 'present') {
            if ($inventoryIndex -ge 0 -or $pulls.Count -ne 1 -or
                [Array]::IndexOf($events, 'signer:installed') -le $queryIndex) { throw 'Update preflight changed.' }
        } elseif ($inventoryIndex -le $pathIndex -or $inventoryIndex -ge $installIndex -or $pulls.Count) {
            throw 'First install lacked independent package-absence proof.'
        }
        $cases++
    }
    foreach ($field in @('ownershipToken', 'project', 'chatIdentity', 'serial', 'schemaVersion')) {
        Reset-Case 'present'
        $script:lease[$field] = 'wrong'
        Write-Lease
        Assert-Refusal { Run-Install } -NoAdb $true
    }
    Reset-Case 'present'
    $script:lease.expiresUtc = [DateTimeOffset]::UtcNow.AddSeconds(-1).ToString('o')
    Write-Lease
    Assert-Refusal { Run-Install } -NoAdb $true
    Reset-Case 'present'
    $script:lease.acquiredUtc = [DateTimeOffset]::UtcNow.AddMinutes(1).ToString('o')
    Write-Lease
    Assert-Refusal { Run-Install } -NoAdb $true
    Reset-Case 'present'
    Remove-Item -LiteralPath $leasePath -Force
    Assert-Refusal { Run-Install } -NoAdb $true
    Reset-Case 'present'
    [IO.File]::WriteAllText($leasePath, '{broken')
    Assert-Refusal { Run-Install } -NoAdb $true
    foreach ($modeValue in @('disconnected', 'check-fail', 'check-text', 'pull-fail', 'signer-mismatch', 'downgrade', 'wrong-package', 'lose-lease')) {
        Reset-Case $modeValue
        Assert-Refusal { Run-Install }
    }
    foreach ($modeValue in @('wrong-package', 'invalid-version', 'no-signer', 'lose-lease-before-path')) {
        Reset-Case $modeValue
        Assert-Refusal { Run-Install }
        if (@(Get-Content -LiteralPath $log | Where-Object { $_ -match ' shell pm (path|list packages)' }).Count) {
            throw 'An invalid candidate or lost lease reached package queries.'
        }
    }
    foreach ($modeValue in @('path-exit1-package', 'path-exit1-error', 'path-offline', 'path-permission', 'path-exit1-blank', 'path-exit2-empty', 'path-exit0-blank')) {
        Reset-Case $modeValue
        Assert-Refusal { Run-Install }
        if (@(Get-Content -LiteralPath $log | Where-Object { $_ -match ' shell pm list packages$' }).Count) {
            throw 'An ambiguous or failed package path reached absence corroboration.'
        }
    }
    foreach ($modeValue in @('inventory-fail', 'inventory-exit1-empty', 'inventory-exit1-data', 'inventory-offline', 'inventory-permission',
            'inventory-empty', 'inventory-malformed', 'inventory-error', 'inventory-path', 'inventory-unprefixed', 'inventory-prefix-case',
            'inventory-blank', 'inventory-spaced', 'inventory-duplicate', 'inventory-candidate', 'inventory-no-android',
            'inventory-android-case', 'inventory-android-prefix')) {
        Reset-Case $modeValue
        Assert-Refusal { Run-Install }
        if (@(Get-Content -LiteralPath $log | Where-Object { $_ -match ' shell pm list packages$' }).Count -ne 1) {
            throw 'The inventory refusal did not exercise absence corroboration.'
        }
    }
    foreach ($modeValue in @('absent-lease-before-inventory', 'absent-lease-before-install')) {
        Reset-Case $modeValue
        Assert-Refusal { Run-Install }
        $inventoryCalls = @(Get-Content -LiteralPath $log | Where-Object { $_ -match ' shell pm list packages$' })
        $expectedCalls = if ($modeValue -ceq 'absent-lease-before-inventory') { 0 } else { 1 }
        if ($inventoryCalls.Count -ne $expectedCalls) { throw 'Lease loss was not fenced before the next ADB command.' }
    }
    Reset-Case 'present'
    Assert-Refusal { Run-Install -Model 'WrongModel' }
    Reset-Case 'present'
    Assert-Refusal { Run-Install -Avd 'WrongAVD' }
    foreach ($modeValue in @('install-fail', 'false-success')) {
        Reset-Case $modeValue
        $caught = $false
        try { Run-Install } catch { $caught = $true }
        if (-not $caught) { throw 'An unconfirmed install was reported as successful.' }
        Assert-SafeCalls -Calls @(Get-Content -LiteralPath $log)
        Assert-Cleanup
        $cases++
    }
    Reset-Case 'present'
    Assert-Refusal { & (Join-Path $Root 'scripts/patch-for-device.ps1') -Replace } -NoAdb $true
    Write-Host "[scripts] data-preserving device install contracts passed ($cases cases)"
} finally {
    Remove-GeneratedPath -Root $env:TEMP -Path $caseRoot
}
