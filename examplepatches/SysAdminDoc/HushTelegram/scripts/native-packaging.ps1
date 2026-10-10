<#
.SYNOPSIS
    Read and validate native-library preservation and APK alignment evidence.
#>

function Test-NativePackagingEvidence {
    param([object]$NativeLibraries, [object]$ZipAlignment, [string]$ExpectedSourceSha256)

    function Fail-Native([string]$Reason) { return [pscustomobject]@{ Valid = $false; Reason = $Reason } }
    function Read-NativeInteger([object]$Value, [System.Numerics.BigInteger]$Maximum = [long]::MaxValue) {
        if ($Value -isnot [byte] -and $Value -isnot [int] -and $Value -isnot [long] -and
            $Value -isnot [System.Numerics.BigInteger] -and $Value -isnot [decimal]) { throw 'Invalid native integer.' }
        # Windows PowerShell's JSON parser uses Decimal for integers above Int64.MaxValue.
        if ($Value -is [decimal]) {
            if ([decimal]::Truncate($Value) -ne $Value) { throw 'Native integer has a fractional part.' }
            $text = $Value.ToString('0', [Globalization.CultureInfo]::InvariantCulture)
        } else { $text = [string]$Value }
        $number = [System.Numerics.BigInteger]::Parse($text, [Globalization.CultureInfo]::InvariantCulture)
        if ($number -lt 0 -or $number -gt $Maximum) { throw 'Native integer is outside its field width.' }
        return $number
    }
    try {
        if ($NativeLibraries -isnot [pscustomobject] -or $NativeLibraries.schemaVersion -ne 1 -or
            $NativeLibraries.passed -isnot [bool] -or -not $NativeLibraries.passed -or
            $NativeLibraries.required64BitLoadAlignmentBytes -ne 16384 -or
            $NativeLibraries.failures -isnot [System.Collections.IList] -or $NativeLibraries.failures.Count) {
            return Fail-Native 'Native-library checking did not pass.'
        }
        foreach ($field in @('sourceApkSha256', 'stockApkSha256', 'patchedApkSha256', 'checkerSha256')) {
            if ([string]$NativeLibraries.$field -cnotmatch '^[0-9a-f]{64}$') {
                return Fail-Native 'Native-library evidence lacks a binary or checker hash.'
            }
        }
        if ($NativeLibraries.sourceApkSha256 -cne $ExpectedSourceSha256.ToLowerInvariant()) {
            return Fail-Native 'Native-library evidence belongs to another source APK.'
        }
        $sides = @{}
        foreach ($side in @('stock', 'patched')) {
            $table = $NativeLibraries.$side
            if ($table.entries -isnot [System.Collections.IList] -or $table.entries.Count -eq 0 -or
                (Read-NativeInteger $table.nativeEntryCount) -ne $table.entries.Count) {
                return Fail-Native 'Native-library inventory is missing or incomplete.'
            }
            $entries = [System.Collections.Generic.Dictionary[string, object]]::new([StringComparer]::Ordinal)
            foreach ($entry in $table.entries) {
                $identity = [regex]::Match([string]$entry.name, '^lib/([a-z0-9_-]+)/([^/]+\.so)$')
                if ($entry -isnot [pscustomobject] -or $entry.name -isnot [string] -or
                    -not $identity.Success -or $entry.abi -cne $identity.Groups[1].Value -or $entries.ContainsKey($entry.name) -or
                    [string]$entry.sha256 -cnotmatch '^[0-9a-f]{64}$') {
                    return Fail-Native 'Native-library identity is invalid or duplicated.'
                }
                $size = Read-NativeInteger $entry.size
                $method = Read-NativeInteger $entry.compressionMethod
                if (($method -eq 0 -and $entry.compression -cne 'STORE') -or
                    ($method -eq 8 -and $entry.compression -cne 'DEFLATE') -or $method -notin @(0, 8)) {
                    return Fail-Native 'Native-library compression evidence is invalid.'
                }
                $elf = $entry.elf
                $relevant = $entry.abi -cin @('arm64-v8a', 'x86_64')
                $required = if ($relevant) { 16384 } else { 0 }
                $machine = @{ 'arm64-v8a' = 183; 'x86_64' = 62; 'armeabi-v7a' = 40; 'armeabi' = 40; 'x86' = 3 }
                if ($elf -isnot [pscustomobject]) { return Fail-Native 'Native ELF evidence is missing or inconsistent.' }
                $classBits = Read-NativeInteger $elf.classBits -Maximum 64
                $machineCode = Read-NativeInteger $elf.machine -Maximum 65535
                $recordedAlignment = Read-NativeInteger $elf.requiredLoadAlignmentBytes -Maximum 16384
                if ($classBits -notin @(32, 64) -or
                    $elf.byteOrder -cnotin @('little', 'big') -or $recordedAlignment -ne $required -or
                    ($machine.ContainsKey($entry.abi) -and $machineCode -ne $machine[$entry.abi]) -or
                    ($machine.ContainsKey($entry.abi) -and (($classBits -eq 64) -ne $relevant)) -or
                    $elf.loadSegments -isnot [System.Collections.IList] -or $elf.loadSegments.Count -eq 0) {
                    return Fail-Native 'Native ELF evidence is missing or inconsistent.'
                }
                $addressSpace = [System.Numerics.BigInteger]::Pow(2, [int]$classBits)
                $fieldMaximum = [System.Numerics.BigInteger]::Subtract($addressSpace, [System.Numerics.BigInteger]::One)
                # The binary checker reads ELF64 file offsets/sizes as nonnegative Java longs.
                $fileMaximum = if ($classBits -eq 32) { $fieldMaximum } else { [System.Numerics.BigInteger][long]::MaxValue }
                $previousIndex = [System.Numerics.BigInteger]::MinusOne
                $previousAddress = [System.Numerics.BigInteger]::MinusOne
                foreach ($load in $elf.loadSegments) {
                    # An extended program-header count is at most UINT32_MAX; its indices are smaller.
                    $index = Read-NativeInteger $load.index -Maximum 4294967294
                    $offset = Read-NativeInteger $load.offset -Maximum $fileMaximum
                    $address = Read-NativeInteger $load.virtualAddress -Maximum $fieldMaximum
                    $fileSize = Read-NativeInteger $load.fileSize -Maximum $fileMaximum
                    $memorySize = Read-NativeInteger $load.memorySize -Maximum $fieldMaximum
                    $alignment = Read-NativeInteger $load.alignmentBytes -Maximum $fieldMaximum
                    if ($index -le $previousIndex -or $address -lt $previousAddress -or
                        [System.Numerics.BigInteger]::Add($offset, $fileSize) -gt $size -or
                        [System.Numerics.BigInteger]::Add($address, $memorySize) -gt $addressSpace -or
                        $fileSize -gt $memorySize -or ($alignment -gt 1 -and
                            ([System.Numerics.BigInteger]::op_BitwiseAnd($alignment,
                                [System.Numerics.BigInteger]::Subtract($alignment, [System.Numerics.BigInteger]::One)) -ne 0 -or
                                [System.Numerics.BigInteger]::Remainder($offset, $alignment) -ne
                                [System.Numerics.BigInteger]::Remainder($address, $alignment))) -or
                        ($relevant -and $alignment -lt 16384)) {
                        return Fail-Native 'Native ELF LOAD ranges or alignment are invalid.'
                    }
                    $previousIndex = $index
                    $previousAddress = $address
                }
                $entries.Add($entry.name, $entry)
            }
            $sides[$side] = $entries
        }
        if ($sides.stock.Count -ne $sides.patched.Count) { return Fail-Native 'Native-library entry sets changed.' }
        foreach ($name in $sides.stock.Keys) {
            if (-not $sides.patched.ContainsKey($name)) { return Fail-Native 'A stock native library is missing.' }
            $before = $sides.stock[$name]
            $after = $sides.patched[$name]
            if ($before.sha256 -cne $after.sha256 -or $before.size -ne $after.size -or
                $before.compressionMethod -ne $after.compressionMethod -or
                ($before.elf | ConvertTo-Json -Depth 8 -Compress) -cne ($after.elf | ConvertTo-Json -Depth 8 -Compress)) {
                return Fail-Native 'Native-library bytes, compression or ELF facts changed.'
            }
        }
        if ($ZipAlignment -isnot [pscustomobject] -or $ZipAlignment.passed -isnot [bool] -or
            -not $ZipAlignment.passed -or $ZipAlignment.pageSizeKb -ne 16 -or $ZipAlignment.alignmentBytes -ne 4 -or
            $ZipAlignment.apkSha256 -cne $NativeLibraries.patchedApkSha256 -or
            [string]$ZipAlignment.toolSha256 -cnotmatch '^[0-9a-f]{64}$' -or
            [string]::IsNullOrWhiteSpace([string]$ZipAlignment.buildToolsVersion)) {
            return Fail-Native 'APK alignment was not proved by the recorded tool.'
        }
        return [pscustomobject]@{ Valid = $true; Reason = $null }
    } catch { return Fail-Native 'Native packaging evidence is malformed.' }
}

function Get-NativePackagingEvidence {
    param(
        [Parameter(Mandatory = $true)][string]$StockApk,
        [Parameter(Mandatory = $true)][string]$PatchedApk,
        [Parameter(Mandatory = $true)][string]$Java,
        [Parameter(Mandatory = $true)][string]$Aapt2,
        [Parameter(Mandatory = $true)][string]$ReportPath,
        [string]$SourceApk,
        # A caller that runs case after case on one APK hashes it once and checks it's unchanged
        # itself, instead of every call reading the whole APK again for the same two digests.
        [string]$StockSha256,
        [string]$SourceSha256
    )
    if (-not $SourceApk) { $SourceApk = $StockApk }
    $checker = Join-Path $PSScriptRoot 'NativeLibraryCheck.java'
    $zipalign = Join-Path (Split-Path -Parent $Aapt2) 'zipalign.exe'
    if (-not (Test-Path -LiteralPath $zipalign -PathType Leaf)) { throw 'The selected build-tools lack zipalign.' }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $null = @(& $Java $checker $StockApk $PatchedApk $ReportPath 2>&1)
        $nativeExit = $LASTEXITCODE
        $global:LASTEXITCODE = -1
        $alignmentOutput = @(& $zipalign -c -P 16 -v 4 $PatchedApk 2>&1)
        $alignmentExit = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    if ($nativeExit -ne 0) { throw 'Native-library preservation or ELF alignment failed.' }
    if ($alignmentExit -ne 0 -or -not ($alignmentOutput | Where-Object { ([string]$_).Trim() -ceq 'Verification successful' })) {
        throw 'APK zip alignment failed.'
    }
    $native = Get-Content -LiteralPath $ReportPath -Raw | ConvertFrom-Json
    if (-not $SourceSha256) { $SourceSha256 = Get-Sha256Hex -Path $SourceApk }
    if (-not $StockSha256) { $StockSha256 = Get-Sha256Hex -Path $StockApk }
    $native | Add-Member -NotePropertyName sourceApkSha256 -NotePropertyValue $SourceSha256.ToLowerInvariant()
    $native | Add-Member -NotePropertyName stockApkSha256 -NotePropertyValue $StockSha256.ToLowerInvariant()
    $native | Add-Member -NotePropertyName patchedApkSha256 -NotePropertyValue (Get-Sha256Hex -Path $PatchedApk).ToLowerInvariant()
    $native | Add-Member -NotePropertyName checkerSha256 -NotePropertyValue (Get-Sha256Hex -Path $checker).ToLowerInvariant()
    $alignment = [pscustomobject]@{
        passed = $true; pageSizeKb = 16; alignmentBytes = 4
        apkSha256 = $native.patchedApkSha256
        toolSha256 = (Get-Sha256Hex -Path $zipalign).ToLowerInvariant()
        buildToolsVersion = Split-Path -Leaf (Split-Path -Parent $zipalign)
    }
    $valid = Test-NativePackagingEvidence -NativeLibraries $native -ZipAlignment $alignment -ExpectedSourceSha256 $native.sourceApkSha256
    if (-not $valid.Valid) { throw $valid.Reason }
    [IO.File]::WriteAllText($ReportPath, ($native | ConvertTo-Json -Depth 12) + "`n", [Text.UTF8Encoding]::new($false))
    return [pscustomobject]@{ NativeLibraries = $native; ZipAlignment = $alignment }
}
