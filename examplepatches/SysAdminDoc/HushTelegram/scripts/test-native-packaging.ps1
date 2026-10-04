<#
.SYNOPSIS
    Reject missing, inconsistent or altered packaging evidence before accepting a receipt.
#>
[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $Root 'scripts/native-packaging.ps1')
. (Join-Path $Root 'scripts/checks/native-packaging-fixture.ps1')
$cases = 0
function Check-Packaging($Evidence) {
    return Test-NativePackagingEvidence -NativeLibraries $Evidence.NativeLibraries -ZipAlignment $Evidence.ZipAlignment -ExpectedSourceSha256 ('b' * 64)
}
$valid = Check-Packaging (New-NativePackagingFixture)
if (-not $valid.Valid) { throw "Valid compressed native evidence was refused: $($valid.Reason)" }
$cases++
foreach ($mutate in @(
    { param($e) $e.NativeLibraries = $null },
    { param($e) $e.NativeLibraries.schemaVersion = 2 },
    { param($e) $e.NativeLibraries.passed = $false },
    { param($e) $e.NativeLibraries.passed = 'true' },
    { param($e) $e.NativeLibraries.failures = @('native check failed') },
    { param($e) $e.NativeLibraries.failures = $null },
    { param($e) $e.NativeLibraries.required64BitLoadAlignmentBytes = 4096 },
    { param($e) $e.NativeLibraries.sourceApkSha256 = ('c' * 64) },
    { param($e) $e.NativeLibraries.stockApkSha256 = 'invalid' },
    { param($e) $e.NativeLibraries.checkerSha256 = '' },
    { param($e) $e.NativeLibraries.patched.entries = @(); $e.NativeLibraries.patched.nativeEntryCount = 0 },
    { param($e) $e.NativeLibraries.patched.nativeEntryCount = 2 },
    { param($e) $e.NativeLibraries.patched.entries += @($e.NativeLibraries.patched.entries[0]); $e.NativeLibraries.patched.nativeEntryCount = 2 },
    { param($e) $e.NativeLibraries.patched.entries[0].name = 'lib/arm64-v8a/changed.so' },
    { param($e) $e.NativeLibraries.patched.entries[0].abi = 'x86_64' },
    { param($e) $e.NativeLibraries.patched.entries[0].sha256 = ('c' * 64) },
    { param($e) $e.NativeLibraries.patched.entries[0].size = 65 },
    { param($e) $e.NativeLibraries.patched.entries[0].compressionMethod = 0; $e.NativeLibraries.patched.entries[0].compression = 'STORE' },
    { param($e) $e.NativeLibraries.patched.entries[0].compression = 'STORE' },
    { param($e) $e.NativeLibraries.patched.entries[0].elf = $null },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.classBits = 32 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.machine = 62 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.byteOrder = 'unknown' },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments = @() },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].alignmentBytes = 4096 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].alignmentBytes = 24576 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].offset = 1 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].fileSize = 65 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].memorySize = 31 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].virtualAddress = -1 },
    { param($e) $e.NativeLibraries.patched.entries[0].elf.loadSegments[0].alignmentBytes = '16384' },
    { param($e) $e.ZipAlignment = $null },
    { param($e) $e.ZipAlignment.passed = $false },
    { param($e) $e.ZipAlignment.passed = 'true' },
    { param($e) $e.ZipAlignment.pageSizeKb = 4 },
    { param($e) $e.ZipAlignment.alignmentBytes = 8 },
    { param($e) $e.ZipAlignment.apkSha256 = ('a' * 64) },
    { param($e) $e.ZipAlignment.toolSha256 = '' },
    { param($e) $e.ZipAlignment.buildToolsVersion = '' }
)) {
    $evidence = New-NativePackagingFixture
    & $mutate $evidence
    if ((Check-Packaging $evidence).Valid) { throw "Altered native packaging evidence was accepted (case $cases)." }
    $cases++
}
# 32-bit libraries retain their own legal alignment. The 16 KB rule belongs to relevant 64-bit LOADs.
$evidence = New-NativePackagingFixture
foreach ($side in @('stock', 'patched')) {
    $entry = $evidence.NativeLibraries.$side.entries[0]
    $entry.name = 'lib/armeabi-v7a/libfixture.so'; $entry.abi = 'armeabi-v7a'
    $entry.elf.classBits = 32; $entry.elf.machine = 40; $entry.elf.requiredLoadAlignmentBytes = 0
    $entry.elf.loadSegments[0].alignmentBytes = 4096
}
if (-not (Check-Packaging $evidence).Valid) { throw 'Valid 32-bit LOAD alignment was refused.' }
$cases++

# Keep both inventories identical and use parsed JSON, so preservation comparisons cannot
# hide malformed ELF facts. The placeholder keeps the out-of-uint64 integer exact on older hosts.
function Check-IdenticalElfMutation {
    param([string]$Name, [scriptblock]$Change, [switch]$Elf32, [switch]$Valid)
    $evidence = New-NativePackagingFixture
    foreach ($side in @('stock', 'patched')) {
        $entry = $evidence.NativeLibraries.$side.entries[0]
        if ($Elf32) {
            $entry.name = 'lib/armeabi-v7a/libfixture.so'; $entry.abi = 'armeabi-v7a'
            $entry.elf.classBits = 32; $entry.elf.machine = 40; $entry.elf.requiredLoadAlignmentBytes = 0
            $entry.elf.loadSegments[0].alignmentBytes = 4096
        }
        & $Change $entry
    }
    $json = ($evidence | ConvertTo-Json -Depth 12).Replace('"UINT64_OVERFLOW"', '18446744073709551616')
    $evidence = $json | ConvertFrom-Json
    $stockEntry = $evidence.NativeLibraries.stock.entries[0] | ConvertTo-Json -Depth 8 -Compress
    $patchedEntry = $evidence.NativeLibraries.patched.entries[0] | ConvertTo-Json -Depth 8 -Compress
    if ($stockEntry -cne $patchedEntry) { throw "The $Name mutation differs between stock and patched evidence." }
    $result = Check-Packaging $evidence
    if ($result.Valid -ne $Valid.IsPresent) { throw "Unexpected native verdict for ${Name}: $($result.Reason)" }
    $script:cases++
}

foreach ($bits in @(32, 64)) {
    $elf32 = $bits -eq 32
    foreach ($field in @('virtualAddress', 'memorySize', 'alignmentBytes')) {
        Check-IdenticalElfMutation "$bits-bit $field exceeds its field width" -Elf32:$elf32 -Change {
            param($entry)
            $entry.elf.loadSegments[0].$field = if ($elf32) { [long]4294967296 } else { 'UINT64_OVERFLOW' }
        }
    }
    Check-IdenticalElfMutation "$bits-bit memory range exceeds its address space" -Elf32:$elf32 -Change {
        param($entry)
        $entry.elf.loadSegments[0].virtualAddress = if ($elf32) { [long]4294963200 }
            else { [uint64]::Parse('18446744073709535232') }
        $entry.elf.loadSegments[0].memorySize = if ($elf32) { 8192 } else { 32768 }
    }
    Check-IdenticalElfMutation "$bits-bit memory range ends at its address-space boundary" -Elf32:$elf32 -Valid -Change {
        param($entry)
        $entry.elf.loadSegments[0].virtualAddress = if ($elf32) { [long]4294963200 }
            else { [uint64]::Parse('18446744073709535232') }
        $entry.elf.loadSegments[0].memorySize = if ($elf32) { 4096 } else { 16384 }
    }
    Check-IdenticalElfMutation "$bits-bit non-power-of-two alignment" -Elf32:$elf32 -Change {
        param($entry) $entry.elf.loadSegments[0].alignmentBytes = 24576
    }
    Check-IdenticalElfMutation "$bits-bit out-of-order LOAD addresses" -Elf32:$elf32 -Change {
        param($entry)
        $entry.elf.loadSegments[0].virtualAddress = 16384
        $second = $entry.elf.loadSegments[0] | ConvertTo-Json | ConvertFrom-Json
        $second.index = 1; $second.virtualAddress = 0
        $entry.elf.loadSegments += $second
    }
    foreach ($field in @('offset', 'fileSize')) {
        Check-IdenticalElfMutation "$bits-bit $field exceeds its binary checker width" -Elf32:$elf32 -Change {
            param($entry)
            $value = if ($elf32) { [long]4294967296 } else { [uint64]::Parse('9223372036854775808') }
            $entry.size = if ($elf32) { [long]4294967360 } else { [uint64]::Parse('9223372036854775872') }
            $entry.elf.loadSegments[0].$field = $value
            if ($field -eq 'fileSize') { $entry.elf.loadSegments[0].memorySize = $value }
            if ($elf32) { $entry.elf.loadSegments[0].alignmentBytes = 1 }
        }
    }
}
Check-IdenticalElfMutation 'native ZIP size exceeds Java long' -Change {
    param($entry) $entry.size = [uint64]::Parse('9223372036854775808')
}
Check-IdenticalElfMutation 'coerced ELF class' -Change { param($entry) $entry.elf.classBits = '64' }
Check-IdenticalElfMutation 'program-header index exceeds its possible count' -Change {
    param($entry) $entry.elf.loadSegments[0].index = [long]4294967295
}
Check-IdenticalElfMutation 'out-of-order program-header indices' -Change {
    param($entry)
    $entry.elf.loadSegments[0].index = 1
    $second = $entry.elf.loadSegments[0] | ConvertTo-Json | ConvertFrom-Json
    $second.index = 0
    $entry.elf.loadSegments += $second
}
foreach ($machine in @(65535, 65536)) {
    Check-IdenticalElfMutation "ELF machine width $machine" -Valid:($machine -eq 65535) -Change {
        param($entry)
        $entry.name = 'lib/other64/libfixture.so'; $entry.abi = 'other64'
        $entry.elf.machine = $machine; $entry.elf.requiredLoadAlignmentBytes = 0
    }
}
Check-IdenticalElfMutation 'largest ELF64 power-of-two alignment' -Valid -Change {
    param($entry) $entry.elf.loadSegments[0].alignmentBytes = [uint64]::Parse('9223372036854775808')
}
foreach ($alignment in @(0, 1)) {
    Check-IdenticalElfMutation "legal ELF32 alignment $alignment" -Elf32 -Valid -Change {
        param($entry) $entry.elf.loadSegments[0].alignmentBytes = $alignment
    }
}
Write-Host "[scripts] native packaging evidence contracts passed ($cases cases)"
