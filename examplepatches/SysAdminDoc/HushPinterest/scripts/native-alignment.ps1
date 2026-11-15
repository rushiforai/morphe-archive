# Native library alignment of an APK, for devices with 16 KB memory pages.
#
# Android loads a 64-bit library on a 16 KB page device only when every ELF PT_LOAD segment is
# aligned to at least 16384 bytes, and maps a stored (uncompressed) library straight out of the
# APK only when its data starts on a 16 KB boundary. Compressed libraries are extracted at install
# time, which needs extractNativeLibs to stay true. 32-bit libraries never run on such a device.
# https://developer.android.com/guide/practices/page-sizes
#
# Patching shouldn't touch any of this: the libraries are the host app's own. So the stock and the
# signed APK are compared entry by entry, and the result separates what the host ships (a library
# Pinterest built for 4 KB pages, which this project must not rebuild) from what repackaging broke
# (a library changed or lost, a stored library moved off its boundary, the manifest flag flipped,
# or zipalign failing on the signed APK where it passed on the stock one).
#
# Needs release-receipt.ps1 dot-sourced first, for Get-ManifestExtractNativeLibs. "Stock" is the
# APK the desktop CLI patches: the fixture itself, or its merge for a split bundle, the same
# baseline the manifest delta is read against.

function Get-NativePageSize { return 16384 }

function Read-ApkZipEntries {
    <#
    .SYNOPSIS
        Every entry in an APK's central directory, with the offset its data starts at.
    .DESCRIPTION
        Read from the zip structures directly, because ZipArchive gives neither the local header
        offset nor the data offset. ZIP64 archives are refused rather than misread: an APK this
        size never needs one.
    #>
    param([Parameter(Mandatory = $true)][string]$Path)

    $stream = [IO.File]::OpenRead($Path)
    try {
        $reader = New-Object IO.BinaryReader($stream)
        $tail = [int][Math]::Min($stream.Length, 65557)
        [void]$stream.Seek(-$tail, [IO.SeekOrigin]::End)
        $buffer = $reader.ReadBytes($tail)
        $end = -1
        for ($i = $buffer.Length - 22; $i -ge 0; $i--) {
            if ($buffer[$i] -eq 0x50 -and $buffer[$i + 1] -eq 0x4b -and $buffer[$i + 2] -eq 0x05 -and $buffer[$i + 3] -eq 0x06) { $end = $i; break }
        }
        if ($end -lt 0) { throw "$Path has no zip end of central directory record." }
        $count = [BitConverter]::ToUInt16($buffer, $end + 10)
        $directorySize = [BitConverter]::ToUInt32($buffer, $end + 12)
        $directoryOffset = [BitConverter]::ToUInt32($buffer, $end + 16)
        if ($count -eq 0xFFFF -or $directoryOffset -eq 0xFFFFFFFF -or $directorySize -eq 0xFFFFFFFF) {
            throw "$Path is a ZIP64 archive, which this reader doesn't parse."
        }
        [void]$stream.Seek($directoryOffset, [IO.SeekOrigin]::Begin)
        $directory = $reader.ReadBytes([int]$directorySize)
        $entries = [Collections.Generic.List[object]]::new()
        $at = 0
        for ($n = 0; $n -lt $count; $n++) {
            if ($at + 46 -gt $directory.Length -or [BitConverter]::ToUInt32($directory, $at) -ne 0x02014b50) {
                throw "$Path has a damaged central directory at entry $n."
            }
            $nameLength = [BitConverter]::ToUInt16($directory, $at + 28)
            $extraLength = [BitConverter]::ToUInt16($directory, $at + 30)
            $commentLength = [BitConverter]::ToUInt16($directory, $at + 32)
            $entries.Add([pscustomobject]@{
                Name = [Text.Encoding]::UTF8.GetString($directory, $at + 46, $nameLength)
                Method = [int][BitConverter]::ToUInt16($directory, $at + 10)
                Crc = [BitConverter]::ToUInt32($directory, $at + 16)
                CompressedSize = [long][BitConverter]::ToUInt32($directory, $at + 20)
                Size = [long][BitConverter]::ToUInt32($directory, $at + 24)
                HeaderOffset = [long][BitConverter]::ToUInt32($directory, $at + 42)
                DataOffset = [long]-1
            })
            $at += 46 + $nameLength + $extraLength + $commentLength
        }
        foreach ($entry in $entries) {
            [void]$stream.Seek($entry.HeaderOffset, [IO.SeekOrigin]::Begin)
            $header = $reader.ReadBytes(30)
            if ($header.Length -ne 30 -or [BitConverter]::ToUInt32($header, 0) -ne 0x04034b50) {
                throw "$Path has no local header for $($entry.Name) at $($entry.HeaderOffset)."
            }
            $entry.DataOffset = $entry.HeaderOffset + 30 + [BitConverter]::ToUInt16($header, 26) + [BitConverter]::ToUInt16($header, 28)
        }
        return $entries.ToArray()
    } finally { $stream.Dispose() }
}

function Read-ApkEntryBytes {
    <# The uncompressed bytes of one entry Read-ApkZipEntries returned, stored or deflated. #>
    param([Parameter(Mandatory = $true)][IO.Stream]$Stream, [Parameter(Mandatory = $true)]$Entry)

    if ($Entry.Method -ne 0 -and $Entry.Method -ne 8) { throw "$($Entry.Name) uses zip method $($Entry.Method), which this reader doesn't inflate." }
    [void]$Stream.Seek($Entry.DataOffset, [IO.SeekOrigin]::Begin)
    $raw = New-Object byte[] $Entry.CompressedSize
    $read = 0
    while ($read -lt $raw.Length) {
        $got = $Stream.Read($raw, $read, $raw.Length - $read)
        if ($got -le 0) { throw "$($Entry.Name) ends before its compressed size." }
        $read += $got
    }
    if ($Entry.Method -eq 0) { $bytes = $raw }
    else {
        $source = New-Object IO.MemoryStream(, $raw)
        $inflate = New-Object IO.Compression.DeflateStream($source, [IO.Compression.CompressionMode]::Decompress)
        $sink = New-Object IO.MemoryStream
        try { $inflate.CopyTo($sink); $bytes = $sink.ToArray() } finally { $inflate.Dispose(); $sink.Dispose() }
    }
    if ($bytes.Length -ne $Entry.Size) { throw "$($Entry.Name) inflates to $($bytes.Length) bytes, not the $($Entry.Size) its header says." }
    return , $bytes
}

function Get-ElfLoadAlignment {
    <#
    .SYNOPSIS
        The ELF class and the smallest PT_LOAD p_align of a shared library's bytes.
    .DESCRIPTION
        The same reading as the page-size guide's check_elf_alignment.sh, which takes
        `objdump -p` LOAD lines and wants align 2**14 or more. Answers $null for bytes that
        aren't a little-endian ELF file.
    #>
    param([Parameter(Mandatory = $true)][byte[]]$Bytes)

    if ($Bytes.Length -lt 52 -or $Bytes[0] -ne 0x7F -or $Bytes[1] -ne 0x45 -or $Bytes[2] -ne 0x4C -or $Bytes[3] -ne 0x46 -or $Bytes[5] -ne 1) { return $null }
    $class = [int]$Bytes[4]
    if ($class -eq 2) {
        if ($Bytes.Length -lt 64) { return $null }
        $tableAt = [long][BitConverter]::ToUInt64($Bytes, 0x20)
        $entrySize = [int][BitConverter]::ToUInt16($Bytes, 0x36)
        $entryCount = [int][BitConverter]::ToUInt16($Bytes, 0x38)
        $alignAt = 48
        $minimum = 56
    } elseif ($class -eq 1) {
        $tableAt = [long][BitConverter]::ToUInt32($Bytes, 0x1C)
        $entrySize = [int][BitConverter]::ToUInt16($Bytes, 0x2A)
        $entryCount = [int][BitConverter]::ToUInt16($Bytes, 0x2C)
        $alignAt = 28
        $minimum = 32
    } else { return $null }
    if ($entrySize -lt $minimum -or $tableAt + [long]$entrySize * $entryCount -gt $Bytes.Length) { return $null }
    $loads = 0
    $smallest = [long]-1
    for ($i = 0; $i -lt $entryCount; $i++) {
        $at = [int]($tableAt + [long]$entrySize * $i)
        if ([BitConverter]::ToUInt32($Bytes, $at) -ne 1) { continue }
        $align = if ($class -eq 2) { [long][BitConverter]::ToUInt64($Bytes, $at + $alignAt) } else { [long][BitConverter]::ToUInt32($Bytes, $at + $alignAt) }
        $loads++
        if ($smallest -lt 0 -or $align -lt $smallest) { $smallest = $align }
    }
    [pscustomobject]@{ Class = $(if ($class -eq 2) { 64 } else { 32 }); LoadSegments = $loads; LoadAlign = $smallest }
}

function Get-ApkNativeLibraries {
    <#
    .SYNOPSIS
        Each lib/<abi>/*.so entry of an APK: how it's stored, its uncompressed SHA-256, its ELF
        load alignment and, when stored, whether its data starts on a 16 KB boundary.
    #>
    param([Parameter(Mandatory = $true)][string]$Apk)

    $page = Get-NativePageSize
    $entries = @(Read-ApkZipEntries -Path $Apk | Where-Object { $_.Name -cmatch '^lib/[^/]+/[^/]+\.so$' })
    $stream = [IO.File]::OpenRead($Apk)
    $sha = [Security.Cryptography.SHA256]::Create()
    try {
        foreach ($entry in $entries) {
            $bytes = Read-ApkEntryBytes -Stream $stream -Entry $entry
            $elf = Get-ElfLoadAlignment -Bytes $bytes
            [pscustomobject][ordered]@{
                name = $entry.Name
                abi = $entry.Name.Split('/')[1]
                method = $(if ($entry.Method -eq 0) { 'stored' } else { 'deflated' })
                size = $entry.Size
                sha256 = ([BitConverter]::ToString($sha.ComputeHash($bytes)) -replace '-', '').ToLowerInvariant()
                elfClass = $(if ($elf) { $elf.Class } else { $null })
                loadAlign = $(if ($elf) { $elf.LoadAlign } else { $null })
                dataOffset = $entry.DataOffset
                pageAlignedData = $(if ($entry.Method -eq 0) { $entry.DataOffset % $page -eq 0 } else { $null })
            }
        }
    } finally { $sha.Dispose(); $stream.Dispose() }
}

function Invoke-Zipalign16 {
    <#
    .SYNOPSIS
        `zipalign -c -P 16 4` on an APK: 'pass', 'fail' or 'not run', with its last lines.
    .DESCRIPTION
        -P 16 holds stored .so entries to 16 KB and the rest to 4 bytes. Compressed libraries
        aren't checked by it, which is why the per-library facts are recorded beside it. Exit 1 is
        a failed check. Any other non-zero exit means it couldn't check at all: a zipalign from
        build-tools 34 or older has no -P and exits 2 with its usage text on every APK, which read
        as a fail would blame the stock APK and hide damage to the patched one.
    #>
    param([Parameter(Mandatory = $true)][string]$Apk, [string]$Zipalign)

    if (-not $Zipalign -or -not (Test-Path -LiteralPath $Zipalign -PathType Leaf)) {
        return [pscustomobject]@{ Result = 'not run'; Detail = 'no zipalign found beside aapt2' }
    }
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $output = @(& $Zipalign -c -P 16 4 $Apk 2>&1 | ForEach-Object { "$_" })
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    $last = @($output | Where-Object { $_.Trim() } | Select-Object -Last 2) -join ' '
    if ($code -eq 0) { return [pscustomobject]@{ Result = 'pass'; Detail = "exit 0 $last".Trim() } }
    if ($code -eq 1) { return [pscustomobject]@{ Result = 'fail'; Detail = "exit 1 $last".Trim() } }
    [pscustomobject]@{ Result = 'not run'; Detail = "$Zipalign couldn't check (exit $code $last), -P needs build-tools 35 or newer".Trim() }
}

function Compare-ApkNativeAlignment {
    <#
    .SYNOPSIS
        The stock and patched native library facts side by side, sorted into host findings
        and repackaging damage.
    .DESCRIPTION
        Takes what Get-ApkNativeLibraries, Get-ManifestExtractNativeLibs and Invoke-Zipalign16
        answered for each APK, so it can be checked without an APK. Damage lists what patching
        changed and the caller refuses the build on it. HostFindings lists 64-bit libraries the
        host itself ships without 16 KB alignment: a warning, since this project doesn't rebuild
        Pinterest's libraries.
    #>
    param(
        [object[]]$StockLibraries = @(), [object[]]$PatchedLibraries = @(),
        [string]$StockExtract = 'unset', [string]$PatchedExtract = 'unset',
        [string]$StockZipalign = 'not run', [string]$PatchedZipalign = 'not run'
    )

    $page = Get-NativePageSize
    $sixtyFour = @('arm64-v8a', 'x86_64')
    $damage = [Collections.Generic.List[string]]::new()
    $host16 = [Collections.Generic.List[string]]::new()
    $stockByName = @{}
    foreach ($library in $StockLibraries) { $stockByName[[string]$library.name] = $library }
    $patchedByName = @{}
    foreach ($library in $PatchedLibraries) { $patchedByName[[string]$library.name] = $library }

    foreach ($name in @($stockByName.Keys | Sort-Object -CaseSensitive)) {
        $stock = $stockByName[$name]
        $patched = $patchedByName[$name]
        if ($null -eq $patched) { $damage.Add("$name is missing from the patched APK"); continue }
        if ($patched.sha256 -cne $stock.sha256) { $damage.Add("$name changed its uncompressed bytes") }
        # Recompression is refused with extractNativeLibs true as well: Android extracts the library
        # then and doesn't care, but patching has no reason to touch it, and a library stored where
        # Pinterest deflated it sits off the 16 KB boundary unless something aligned it.
        if ($patched.method -cne $stock.method) {
            $damage.Add("$name went from $($stock.method) to $($patched.method) with extractNativeLibs $PatchedExtract")
        }
        if ($patched.method -ceq 'stored' -and $stock.pageAlignedData -eq $true -and $patched.pageAlignedData -ne $true) {
            $damage.Add("$name is stored at offset $($patched.dataOffset), off the 16 KB boundary it had in the stock APK")
        }
        if ($sixtyFour -ccontains [string]$stock.abi) {
            if ($null -eq $stock.loadAlign -or $stock.loadAlign -lt $page) {
                $host16.Add("$name has LOAD segments aligned to $($stock.loadAlign) in the stock APK")
            }
            if ($stock.method -ceq 'stored' -and $stock.pageAlignedData -ne $true) {
                $host16.Add("$name is stored off a 16 KB boundary in the stock APK")
            }
        }
    }
    foreach ($name in @($patchedByName.Keys | Sort-Object -CaseSensitive)) {
        if (-not $stockByName.ContainsKey($name)) { $damage.Add("$name was added by patching") }
    }
    if ($PatchedExtract -cne $StockExtract) { $damage.Add("extractNativeLibs went from $StockExtract to $PatchedExtract") }
    if ($PatchedZipalign -ceq 'fail' -and $StockZipalign -ceq 'pass') { $damage.Add('zipalign -c -P 16 4 fails on the patched APK and passes on the stock one') }
    if ($StockZipalign -ceq 'fail') { $host16.Add('zipalign -c -P 16 4 fails on the stock APK') }

    $abis = @($StockLibraries | ForEach-Object { [string]$_.abi } | Sort-Object -Unique -CaseSensitive)
    $ready = @($StockLibraries | Where-Object { $sixtyFour -ccontains [string]$_.abi -and $null -ne $_.loadAlign -and $_.loadAlign -ge $page }).Count
    $verdict = if ($damage.Count -gt 0) { 'damaged' } elseif ($host16.Count -gt 0) { 'host not 16 KB ready' } else { 'aligned' }
    [ordered]@{
        schema = 1
        pageSize = $page
        verdict = $verdict
        abis = $abis
        libraries = @($StockLibraries).Count
        sixtyFourBitAligned = $ready
        sixtyFourBit = @($StockLibraries | Where-Object { $sixtyFour -ccontains [string]$_.abi }).Count
        identical = @($StockLibraries | Where-Object { $p = $patchedByName[[string]$_.name]; $p -and $p.sha256 -ceq $_.sha256 }).Count
        extractNativeLibs = [ordered]@{ stock = $StockExtract; patched = $PatchedExtract }
        zipalign = [ordered]@{ stock = $StockZipalign; patched = $PatchedZipalign }
        damage = @($damage)
        hostFindings = @($host16)
    }
}

function Measure-ApkNativeAlignment {
    <#
    .SYNOPSIS
        Compare-ApkNativeAlignment over two APKs on disk, with zipalign from beside aapt2.
    #>
    param(
        [Parameter(Mandatory = $true)][string]$StockApk, [Parameter(Mandatory = $true)][string]$PatchedApk,
        [Parameter(Mandatory = $true)]$StockManifest, [Parameter(Mandatory = $true)]$PatchedManifest,
        [string]$Aapt2
    )

    $zipalign = $null
    if ($Aapt2) {
        foreach ($leaf in @('zipalign.exe', 'zipalign', 'zipalign.bat', 'zipalign.cmd')) {
            $candidate = Join-Path (Split-Path -Parent $Aapt2) $leaf
            if (Test-Path -LiteralPath $candidate -PathType Leaf) { $zipalign = $candidate; break }
        }
    }
    $stockAlign = Invoke-Zipalign16 -Apk $StockApk -Zipalign $zipalign
    $patchedAlign = Invoke-Zipalign16 -Apk $PatchedApk -Zipalign $zipalign
    $result = Compare-ApkNativeAlignment -StockLibraries @(Get-ApkNativeLibraries -Apk $StockApk) `
        -PatchedLibraries @(Get-ApkNativeLibraries -Apk $PatchedApk) `
        -StockExtract (Get-ManifestExtractNativeLibs -Manifest $StockManifest) `
        -PatchedExtract (Get-ManifestExtractNativeLibs -Manifest $PatchedManifest) `
        -StockZipalign $stockAlign.Result -PatchedZipalign $patchedAlign.Result
    $result.zipalignDetail = [ordered]@{ stock = $stockAlign.Detail; patched = $patchedAlign.Detail }
    $result.runtime = 'pending'
    return $result
}
