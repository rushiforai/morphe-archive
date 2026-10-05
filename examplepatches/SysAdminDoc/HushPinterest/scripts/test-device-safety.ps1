<# Exercise account-preserving leases and installs without a real device. #>
[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'device-install.ps1')
. (Join-Path $PSScriptRoot 'injected-register-device.ps1')
function Assert-Safety([bool]$Condition, [string]$Message) {
    if (-not $Condition) { throw $Message }
}
function Assert-Refusal([scriptblock]$Action, [string]$Pattern) {
    try { & $Action; throw 'Expected refusal did not happen.' }
    catch { if ($_.Exception.Message -notlike $Pattern) { throw } }
}
$work = Join-Path ([IO.Path]::GetTempPath()) ('hushpinterest-safety-' + [guid]::NewGuid().ToString('N'))
[void][IO.Directory]::CreateDirectory($work)
$apk = Join-Path $work 'new.apk'
[IO.File]::WriteAllBytes($apk, [byte[]](1, 2, 3))
function New-SafetyAdb([bool]$Installed = $true, [string]$IdentitySerial = 'emulator-5998') {
    $state = [pscustomobject]@{ Calls = [Collections.Generic.List[string]]::new(); Marker = ''; Size = 3;
        Avd = 'Fixture_API36'; Build = 'google/sdk/test'; PathReply = $null; InventoryReply = $null }
    $invoke = {
        param($Executable, [string[]]$Arguments)
        $line = $Arguments -join ' '
        $state.Calls.Add($line)
        if ($line -like '* shell pm path com.pinterest' -and $null -ne $state.PathReply) { return $state.PathReply }
        if ($line -like '* shell pm list packages -u com.pinterest' -and $null -ne $state.InventoryReply) { return $state.InventoryReply }
        $output = switch -Wildcard ($line) {
            '* get-state' { 'device' }
            '* get-serialno' { $IdentitySerial }
            '* emu avd name' { $state.Avd; 'OK' }
            '* shell getprop ro.product.model' { 'sdk_gphone64_x86_64' }
            '* shell getprop ro.build.fingerprint' { $state.Build }
            '* shell getprop ro.build.version.sdk' { '36' }
            '* shell getprop ro.product.cpu.abi' { 'x86_64' }
            '* shell pm path com.pinterest' { if ($Installed) { 'package:/data/app/base.apk' } }
            '* shell pm list packages -u com.pinterest' { if ($Installed) { 'package:com.pinterest' } }
            '* pull *' { [IO.File]::WriteAllBytes($Arguments[4], [byte[]](1, 2, 3)); 'pulled' }
            '* install *' { 'Success' }
            '* push *' { 'pushed' }
            '* shell log -p *' { $state.Marker = ($Arguments[3] -split ' ')[-1] }
            '* shell dex2oat64*' { 'exit=0'; 'size=3' }
            '* logcat -d' { "W HushPinterestVerify: $($state.Marker)" }
            '* shell rm -rf *' { }
            default { throw "Unexpected ADB operation: $line" }
        }
        [pscustomobject]@{ ExitCode = 0; Output = @($output) }
    }.GetNewClosure()
    [pscustomobject]@{ State = $state; Invoker = $invoke }
}
try {
    $fake = New-SafetyAdb
    $lease = Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -AdbInvoker $fake.Invoker
    Assert-Safety $lease.Owned 'A newly created lease is not helper-owned.'
    $saved = Get-Content -LiteralPath $lease.Path -Raw | ConvertFrom-Json
    Assert-Safety ($saved.serial -eq 'emulator-5998' -and $saved.project -eq 'HushPinterest' -and
        $saved.chatIdentity -eq 'safety-test' -and $saved.ownershipToken -and
        [DateTimeOffset]::Parse($saved.expiresUtc) -gt [DateTimeOffset]::UtcNow) 'Incomplete lease identity.'
    $beforeBusy = $fake.State.Calls.Count
    Assert-Refusal { Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project other `
        -ChatIdentity other -LeaseDirectory $work -AdbInvoker $fake.Invoker } '*leased*'
    Assert-Safety ($fake.State.Calls.Count -eq $beforeBusy) 'Busy lease ran ADB.'
    $borrowed = Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -LeaseToken $lease.Token -AdbInvoker $fake.Invoker
    Assert-Safety (-not $borrowed.Owned) 'A caller lease became helper-owned.'
    Exit-HushDeviceLease $borrowed
    Assert-Safety (Test-Path -LiteralPath $lease.Path) 'A borrowed lease was released.'
    Assert-Safety ($saved.deviceIdentity.Avd -ceq 'Fixture_API36' -and
        $saved.deviceIdentity.Build -ceq 'google/sdk/test') 'The original full identity was not persisted.'
    foreach ($field in @('Build', 'Avd')) {
        $previous = $fake.State.$field
        $fake.State.$field = 'changed-at-same-serial'
        try {
            Assert-Refusal { Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
                -ChatIdentity safety-test -LeaseDirectory $work -LeaseToken $lease.Token -AdbInvoker $fake.Invoker } '*identity*'
            Assert-Refusal { Invoke-HushLeasedAdb -Adb fake -Lease $lease -Invoker $fake.Invoker `
                -Arguments @('shell', 'touch unsafe-write') } '*identity*'
            Assert-Safety (-not ($fake.State.Calls -match 'touch unsafe-write')) 'An identity change permitted a device write.'
            $unchanged = Get-Content -LiteralPath $lease.Path -Raw | ConvertFrom-Json
            Assert-Safety ($unchanged.deviceIdentity.$field -ceq $saved.deviceIdentity.$field) 'A new identity replaced the original lease binding.'
        } finally { $fake.State.$field = $previous }
    }
    $saved | Add-Member -NotePropertyName expectedIdentity -NotePropertyValue other-avd -Force
    $saved.expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes(30).ToString('o')
    $saved | ConvertTo-Json | Set-Content -LiteralPath $lease.Path
    Assert-Refusal { Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -LeaseToken $lease.Token -AdbInvoker $fake.Invoker } '*identity*'
    Assert-Safety (Test-Path -LiteralPath $lease.Path) 'Wrong profile released the caller lease.'
    $saved.PSObject.Properties.Remove('expectedIdentity')
    $saved | ConvertTo-Json | Set-Content -LiteralPath $lease.Path
    Renew-HushDeviceLease $lease
    $afterRenew = Get-Content -LiteralPath $lease.Path -Raw | ConvertFrom-Json
    Assert-Safety ($afterRenew.ownershipToken -eq $saved.ownershipToken) 'Renew replaced ownership.'
    Exit-HushDeviceLease $lease
    Assert-Safety (-not (Test-Path -LiteralPath $lease.Path)) 'Owned lease was not released.'

    $saved.expiresUtc = [DateTimeOffset]::UtcNow.AddMinutes(-2).ToString('o')
    $saved | ConvertTo-Json | Set-Content -LiteralPath $lease.Path
    $oldBytes = [IO.File]::ReadAllText($lease.Path)
    Assert-Refusal { Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -AdbInvoker $fake.Invoker } '*expired*'
    Assert-Safety ([IO.File]::ReadAllText($lease.Path) -eq $oldBytes) 'An expired lease was overwritten.'
    Remove-Item -LiteralPath $lease.Path
    $wrongIdentity = New-SafetyAdb -IdentitySerial other
    Assert-Refusal { Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -AdbInvoker $wrongIdentity.Invoker } '*identity*'
    Assert-Safety (-not (Test-Path -LiteralPath $lease.Path)) 'Identity failure leaked an owned lease.'

    foreach ($case in @('same', 'fresh', 'wrong-signer', 'downgrade', 'missing-signer', 'wrong-package',
            'fresh-exit-one', 'fresh-prefix', 'path-error', 'path-error-text', 'inventory-error', 'inventory-malformed', 'inventory-existing')) {
        $fresh = $case -in @('fresh', 'fresh-exit-one', 'fresh-prefix')
        $fake = New-SafetyAdb -Installed (-not $fresh)
        if ($case -in @('fresh-exit-one', 'fresh-prefix', 'path-error', 'path-error-text', 'inventory-error', 'inventory-malformed', 'inventory-existing')) {
            $fake.State.PathReply = [pscustomobject]@{ ExitCode = if($case -eq 'path-error'){2}else{1};
                Output = if($case -eq 'path-error-text'){@('Error: package manager unavailable')}else{@()} }
            $fake.State.InventoryReply = [pscustomobject]@{ ExitCode = if($case -eq 'inventory-error'){1}else{0}; Output = @(switch ($case) {
                'fresh-prefix' { 'package:com.pinterest.tools' }
                'inventory-malformed' { 'Error: package manager unavailable' }
                'inventory-existing' { 'package:com.pinterest' }
            }) }
        }
        $lease = Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
            -ChatIdentity safety-test -LeaseDirectory $work -AdbInvoker $fake.Invoker
        $manifest = {
            param($Path, $Aapt2)
            $installed = $Path -like '*installed*'
            [pscustomobject]@{ package = if ($case -eq 'wrong-package') { 'other.package' } else { 'com.pinterest' };
                versionCode = if ($installed -and $case -eq 'downgrade') { '200' } else { '100' } }
        }.GetNewClosure()
        $signers = {
            param($Path, $Aapt2)
            if ($case -eq 'missing-signer') { return }
            if ($Path -like '*installed*' -and $case -eq 'wrong-signer') { return 'b' * 64 }
            'a' * 64
        }.GetNewClosure()
        $install = { Install-HushAndroidApk -Adb fake -Serial emulator-5998 -Apk $apk `
            -PackageName com.pinterest -Aapt2 fake -Lease $lease -AdbInvoker $fake.Invoker `
            -ManifestReader $manifest -SignerReader $signers }
        try {
            if ($case -eq 'same' -or $fresh) { & $install }
            else { Assert-Refusal $install '*refused*' }
            $installs = @($fake.State.Calls | Where-Object { $_ -like '* install *' })
            Assert-Safety ($installs.Count -eq [int]($case -eq 'same' -or $fresh)) "$case installation count."
            if ($fresh) {
                Assert-Safety (@($fake.State.Calls | Where-Object { $_ -like '* shell pm list packages -u com.pinterest' }).Count -eq 1) `
                    "$case did not independently confirm package absence."
            }
            Assert-Safety (-not ($fake.State.Calls -match 'uninstall|clear|install .* -g|install .* -d')) 'Account or permissions were modified.'
        } finally { Exit-HushDeviceLease $lease }
    }

    $fake = New-SafetyAdb
    $lease = Enter-HushDeviceLease -Adb fake -Serial emulator-5998 -Project HushPinterest `
        -ChatIdentity safety-test -LeaseDirectory $work -AdbInvoker $fake.Invoker
    $beforeBusy = $fake.State.Calls.Count
    Assert-Refusal { Invoke-AndroidVerifierTally -Adb fake -Serial emulator-5998 -Local $apk `
        -Label safety -LeaseDirectory $work -AdbInvoker $fake.Invoker } '*leased*'
    Assert-Safety ($fake.State.Calls.Count -eq $beforeBusy) 'Unleased verifier mutated a busy device.'
    [void](Invoke-AndroidVerifierTally -Adb fake -Serial emulator-5998 -Local $apk -Label safety `
        -LeaseDirectory $work -Project HushPinterest -ChatIdentity safety-test -LeaseToken $lease.Token `
        -AdbInvoker $fake.Invoker)
    Assert-Safety (Test-Path -LiteralPath $lease.Path) 'Verifier released caller-owned lease.'
    Assert-Safety (@($fake.State.Calls | Where-Object { $_ -like '*shell dex2oat64*--instruction-set=x86_64*' }).Count -eq 1) `
        'The emulator verifier selected the wrong instruction set.'
    Exit-HushDeviceLease $lease
    $global:LASTEXITCODE = 0
    Write-Host '[device] lease, signer, downgrade and mutation refusal contracts passed'
} finally {
    $absolute = [IO.Path]::GetFullPath($work)
    if (-not $absolute.StartsWith([IO.Path]::GetTempPath(), [StringComparison]::OrdinalIgnoreCase)) { throw 'Unsafe test cleanup.' }
    Remove-Item -LiteralPath $absolute -Recurse -Force
}
