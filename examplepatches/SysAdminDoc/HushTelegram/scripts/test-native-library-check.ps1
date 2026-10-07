<#
.SYNOPSIS
    Exercise native preservation and ELF LOAD facts with synthetic APK mutations.
.DESCRIPTION
    Valid compressed native entries in all four pinned ABIs pass. Library removal, addition,
    renaming, changed bytes or compression fail. Self-comparisons of damaged ELF files prove that
    malformed headers/tables and bad LOAD ranges/alignment fail independently of SHA-256 changes.
    Both exact official fixtures are read-only controls. No patcher, Gradle or device is used.
#>
[CmdletBinding()]
param(
    [string]$Root,
    [string]$Java,
    [string]$FixtureDir
)

$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
$Java = Resolve-Java -Explicit $Java
if (-not $FixtureDir) { $FixtureDir = $env:HUSHTELEGRAM_FIXTURE_DIR }
if (-not $FixtureDir) { $FixtureDir = Join-Path $Root 'fixtures' }
$fixtures = @('telegram-web-12.10.6-71129.apk', 'telegram-beta-12.10.7-71239.apk') |
    ForEach-Object { Join-Path $FixtureDir $_ }
foreach ($fixturePath in $fixtures) {
    if (-not (Test-Path -LiteralPath $fixturePath -PathType Leaf)) { throw "Missing read-only native fixture: $fixturePath" }
}

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function Set-Integer {
    param([byte[]]$Bytes, [int]$Offset, [uint64]$Value, [int]$Width, [bool]$BigEndian = $false)
    $valueBytes = switch ($Width) {
        2 { [BitConverter]::GetBytes([uint16]$Value); break }
        4 { [BitConverter]::GetBytes([uint32]$Value); break }
        8 { [BitConverter]::GetBytes([uint64]$Value); break }
        default { throw "Unsupported integer width: $Width" }
    }
    if ($BigEndian) { [Array]::Reverse($valueBytes) }
    $valueBytes.CopyTo($Bytes, $Offset)
}

function New-Elf {
    param([string]$Abi = 'arm64-v8a', [uint64]$Alignment = 16384, [switch]$BigEndian)
    $is64 = $Abi -in @('arm64-v8a', 'x86_64')
    $headerSize = if ($is64) { 64 } else { 52 }
    $phSize = if ($is64) { 56 } else { 32 }
    $metadata = if ($is64) { 52 } else { 40 }
    $machine = switch ($Abi) {
        'arm64-v8a' { 183; break }
        'x86_64' { 62; break }
        'armeabi-v7a' { 40; break }
        'x86' { 3; break }
        default { throw "Unknown synthetic ABI: $Abi" }
    }
    $bytes = [byte[]]::new(512)
    ([byte[]](0x7f, 69, 76, 70)).CopyTo($bytes, 0)
    $bytes[4] = if ($is64) { 2 } else { 1 }
    $bytes[5] = if ($BigEndian) { 2 } else { 1 }
    $bytes[6] = 1
    Set-Integer $bytes 16 3 2 $BigEndian
    Set-Integer $bytes 18 $machine 2 $BigEndian
    Set-Integer $bytes 20 1 4 $BigEndian
    Set-Integer $bytes $(if ($is64) { 32 } else { 28 }) $headerSize $(if ($is64) { 8 } else { 4 }) $BigEndian
    Set-Integer $bytes $metadata $headerSize 2 $BigEndian
    Set-Integer $bytes ($metadata + 2) $phSize 2 $BigEndian
    Set-Integer $bytes ($metadata + 4) 2 2 $BigEndian
    for ($index = 0; $index -lt 2; $index++) {
        $ph = $headerSize + ($index * $phSize)
        Set-Integer $bytes $ph 1 4 $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 4 } else { 24 })) 5 4 $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 8 } else { 4 })) ($index * 256) $(if ($is64) { 8 } else { 4 }) $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 16 } else { 8 })) (65536 + ($index * 65792)) $(if ($is64) { 8 } else { 4 }) $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 32 } else { 16 })) 256 $(if ($is64) { 8 } else { 4 }) $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 40 } else { 20 })) (256 + ($index * 64)) $(if ($is64) { 8 } else { 4 }) $BigEndian
        Set-Integer $bytes ($ph + $(if ($is64) { 48 } else { 28 })) $Alignment $(if ($is64) { 8 } else { 4 }) $BigEndian
    }
    $bytes[500] = 71
    return ,$bytes
}

function New-Entry {
    param([string]$Name, [byte[]]$Bytes, [string]$Compression = 'DEFLATE')
    [pscustomobject]@{ Name = $Name; Bytes = $Bytes; Compression = $Compression }
}

function Copy-Entries {
    param([object[]]$Entries)
    $copies = @($Entries | ForEach-Object { New-Entry -Name $_.Name -Bytes ([byte[]]$_.Bytes.Clone()) -Compression $_.Compression })
    return ,$copies
}

function Assert-StoredZipEntries {
    param([string]$Apk, [object[]]$Entries)
    # Read the synthetic ZIP headers and raw bytes independently of ZipArchive and the checker.
    $bytes = [IO.File]::ReadAllBytes($Apk)
    Assert-True ($bytes.Length -ge 22) 'Stored fixture has no ZIP directory.'
    $end = $bytes.Length - 22
    Assert-True ([BitConverter]::ToUInt32($bytes, $end) -eq 0x06054b50 -and
        [BitConverter]::ToUInt16($bytes, $end + 20) -eq 0) 'Stored fixture has no ordinary ZIP end record.'
    $count = [BitConverter]::ToUInt16($bytes, $end + 10)
    $centralStart = [int][BitConverter]::ToUInt32($bytes, $end + 16)
    $central = $centralStart
    $verified = 0
    for ($index = 0; $index -lt $count; $index++) {
        Assert-True ($central -ge 0 -and $central + 46 -le $end -and
            [BitConverter]::ToUInt32($bytes, $central) -eq 0x02014b50) 'Stored fixture has an invalid central header.'
        $nameLength = [BitConverter]::ToUInt16($bytes, $central + 28)
        $extraLength = [BitConverter]::ToUInt16($bytes, $central + 30)
        $commentLength = [BitConverter]::ToUInt16($bytes, $central + 32)
        $next = $central + 46 + $nameLength + $extraLength + $commentLength
        Assert-True ($next -le $end) 'Stored fixture central entry is truncated.'
        $name = [Text.Encoding]::UTF8.GetString($bytes, $central + 46, $nameLength)
        $expected = @($Entries | Where-Object { $_.Name -ceq $name })
        if ($expected.Count -gt 0) {
            Assert-True ($expected.Count -eq 1 -and [BitConverter]::ToUInt16($bytes, $central + 10) -eq 0 -and
                [BitConverter]::ToUInt32($bytes, $central + 20) -eq $expected[0].Bytes.Length -and
                [BitConverter]::ToUInt32($bytes, $central + 24) -eq $expected[0].Bytes.Length) "Stored fixture central method or sizes differ: $name"
            $local = [int][BitConverter]::ToUInt32($bytes, $central + 42)
            Assert-True ($local -ge 0 -and $local + 30 -le $centralStart -and
                [BitConverter]::ToUInt32($bytes, $local) -eq 0x04034b50 -and
                [BitConverter]::ToUInt16($bytes, $local + 8) -eq 0 -and
                [BitConverter]::ToUInt32($bytes, $local + 18) -eq $expected[0].Bytes.Length -and
                [BitConverter]::ToUInt32($bytes, $local + 22) -eq $expected[0].Bytes.Length) "Stored fixture local method or sizes differ: $name"
            $localNameLength = [BitConverter]::ToUInt16($bytes, $local + 26)
            $payload = $local + 30 + $localNameLength + [BitConverter]::ToUInt16($bytes, $local + 28)
            Assert-True ($payload + $expected[0].Bytes.Length -le $centralStart -and
                [Text.Encoding]::UTF8.GetString($bytes, $local + 30, $localNameLength) -ceq $name) "Stored fixture local name or payload range differs: $name"
            $raw = [byte[]]::new($expected[0].Bytes.Length)
            [Array]::Copy($bytes, $payload, $raw, 0, $raw.Length)
            Assert-True ([Convert]::ToBase64String($raw) -ceq [Convert]::ToBase64String($expected[0].Bytes)) "Stored fixture raw bytes differ: $name"
            $verified++
        }
        $central = $next
    }
    Assert-True ($verified -eq $Entries.Count) 'Stored fixture is missing a requested entry or has duplicate entries.'
}

function New-NativeApk {
    param([string]$Name, [object[]]$Entries, [string]$Resource = 'unrelated resource')
    $apk = Join-Path $caseRoot "$Name.apk"
    $zip = [IO.Compression.ZipFile]::Open($apk, [IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($entry in $Entries) {
            $stream = $zip.CreateEntry($entry.Name, [IO.Compression.CompressionLevel]::Optimal).Open()
            try { $stream.Write($entry.Bytes, 0, $entry.Bytes.Length) } finally { $stream.Dispose() }
        }
        $stream = $zip.CreateEntry('res/raw/other.txt').Open()
        try { $bytes = [Text.Encoding]::UTF8.GetBytes($Resource); $stream.Write($bytes, 0, $bytes.Length) } finally { $stream.Dispose() }
    } finally { $zip.Dispose() }
    $storedEntries = @($Entries | Where-Object { $_.Compression -ceq 'STORE' })
    if ($storedEntries.Count -gt 0) {
        # Framework's NoCompression still emits method 8. The required JDK writes genuine method 0.
        $payloadDirectory = [IO.Path]::GetFullPath((Join-Path $caseRoot ('stored-' + [guid]::NewGuid().ToString('N'))))
        $ownedPrefix = $caseRoot + [IO.Path]::DirectorySeparatorChar
        Assert-True ($payloadDirectory.StartsWith($ownedPrefix, [StringComparison]::OrdinalIgnoreCase)) 'Unsafe stored payload directory.'
        try {
            New-Item -ItemType Directory -Path $payloadDirectory | Out-Null
            $payloadPrefix = $payloadDirectory + [IO.Path]::DirectorySeparatorChar
            $arguments = @('--update', '--file', $apk, '--no-manifest', '--no-compress')
            foreach ($entry in $storedEntries) {
                $file = [IO.Path]::GetFullPath((Join-Path $payloadDirectory $entry.Name))
                Assert-True ($file.StartsWith($payloadPrefix, [StringComparison]::OrdinalIgnoreCase)) 'Unsafe stored payload path.'
                New-Item -ItemType Directory -Force -Path (Split-Path -Parent $file) | Out-Null
                [IO.File]::WriteAllBytes($file, $entry.Bytes)
                $arguments += @('-C', $payloadDirectory, $entry.Name)
            }
            $preference = $ErrorActionPreference
            try {
                $ErrorActionPreference = 'Continue'
                $global:LASTEXITCODE = -1
                $jarOutput = @(& $archiver @arguments 2>&1 | ForEach-Object { "$_" })
                $jarExit = $LASTEXITCODE
            } finally { $ErrorActionPreference = $preference }
            Assert-True ($jarExit -eq 0) "Stored fixture creation failed.`n$($jarOutput -join "`n")"
            Assert-StoredZipEntries -Apk $apk -Entries $storedEntries
        } finally {
            if ($payloadDirectory.StartsWith($ownedPrefix, [StringComparison]::OrdinalIgnoreCase) -and
                (Test-Path -LiteralPath $payloadDirectory -PathType Container)) {
                Remove-Item -LiteralPath $payloadDirectory -Recurse -Force
            }
        }
    }
    return $apk
}

function Invoke-Check {
    param([string]$Patched, [string]$Name, [string]$Stock = $stockApk)
    $report = Join-Path $caseRoot "$Name-report.json"
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $global:LASTEXITCODE = -1
        $output = @(& $Java '-cp' $caseRoot 'NativeLibraryCheck' $Stock $Patched $report 2>&1 | ForEach-Object { "$_" })
        $exitCode = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    Assert-True (Test-Path -LiteralPath $report -PathType Leaf) "No JSON report for $Name (exit $exitCode).`n$($output -join "`n")"
    $text = [IO.File]::ReadAllText($report)
    $facts = $text | ConvertFrom-Json
    Assert-True ($text.TrimEnd() -eq ($output -join "`n").TrimEnd()) "Stdout and JSON report differ for $Name."
    [pscustomobject]@{ ExitCode = $exitCode; Facts = $facts; Text = $text }
}

function Assert-Refusal {
    param([object]$Result, [string]$Pattern, [string]$Message)
    Assert-True ($Result.ExitCode -eq 1 -and $Result.Facts.passed -eq $false -and
        ($Result.Facts.failures -join "`n") -match $Pattern) "$Message`n$($Result.Text)"
}

function Assert-BadElf {
    param([string]$Name, [scriptblock]$Change, [string]$Pattern, [string]$Abi = 'arm64-v8a')
    $bytes = New-Elf -Abi $Abi
    & $Change $bytes
    $apk = New-NativeApk -Name $Name -Entries @(New-Entry -Name "lib/$Abi/libsample.so" -Bytes $bytes)
    $result = Invoke-Check -Stock $apk -Patched $apk -Name $Name
    Assert-Refusal $result $Pattern "Malformed ELF $Name passed against itself."
    Assert-True (($result.Facts.failures -join "`n") -notmatch 'bytes differ|compression differs') "ELF $Name was refused only by a preservation mismatch."
}

$tempBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$caseRoot = [IO.Path]::GetFullPath((Join-Path $tempBase ('hushtelegram-native-check-' + [guid]::NewGuid().ToString('N'))))
$requiredPrefix = $tempBase.TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
Assert-True ($caseRoot.StartsWith($requiredPrefix, [StringComparison]::OrdinalIgnoreCase)) "Unsafe temporary path: $caseRoot"
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
try {
    New-Item -ItemType Directory -Path $caseRoot | Out-Null
    $compiler = Join-Path (Split-Path -Parent (Get-Command $Java).Source) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'javac.exe' } else { 'javac' })
    Assert-True (Test-Path -LiteralPath $compiler -PathType Leaf) "No compiler beside the resolved JDK: $compiler"
    $archiver = Join-Path (Split-Path -Parent $compiler) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'jar.exe' } else { 'jar' })
    Assert-True (Test-Path -LiteralPath $archiver -PathType Leaf) "No archiver beside the resolved JDK: $archiver"
    $preference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $compileOutput = @(& $compiler '-encoding' 'UTF-8' '-d' $caseRoot (Join-Path $PSScriptRoot 'NativeLibraryCheck.java') 2>&1 | ForEach-Object { "$_" })
        $compileExit = $LASTEXITCODE
    } finally { $ErrorActionPreference = $preference }
    Assert-True ($compileExit -eq 0) "Native checker did not compile.`n$($compileOutput -join "`n")"
    $stockEntries = @(
        New-Entry 'lib/arm64-v8a/libsample.so' (New-Elf -Abi 'arm64-v8a')
        New-Entry 'lib/armeabi-v7a/libsample.so' (New-Elf -Abi 'armeabi-v7a' -Alignment 4096)
        New-Entry 'lib/x86/libsample.so' (New-Elf -Abi 'x86' -Alignment 4096)
        New-Entry 'lib/x86_64/libsample.so' (New-Elf -Abi 'x86_64')
    )
    $stockApk = New-NativeApk -Name 'stock' -Entries $stockEntries
    $same = Invoke-Check -Patched $stockApk -Name 'unchanged'
    Assert-True ($same.ExitCode -eq 0 -and $same.Facts.passed -eq $true -and $same.Facts.schemaVersion -eq 1 -and
        $same.Facts.stock.nativeEntryCount -eq 4 -and $same.Facts.patched.nativeEntryCount -eq 4 -and
        $same.Facts.required64BitLoadAlignmentBytes -eq 16384 -and @($same.Facts.failures).Count -eq 0) "Valid compressed ELF controls failed.`n$($same.Text)"
    foreach ($entry in $same.Facts.stock.entries) {
        $original = $stockEntries | Where-Object { $_.Name -ceq $entry.name }
        $sha = [Security.Cryptography.SHA256]::Create()
        try { $expectedHash = -join ($sha.ComputeHash($original.Bytes) | ForEach-Object { $_.ToString('x2') }) } finally { $sha.Dispose() }
        $is64 = $entry.abi -in @('arm64-v8a', 'x86_64')
        Assert-True ($entry.sha256 -ceq $expectedHash -and $entry.compression -ceq 'DEFLATE' -and $entry.compressionMethod -eq 8 -and
            $entry.size -eq 512 -and $entry.elf.byteOrder -ceq 'little' -and @($entry.elf.loadSegments).Count -eq 2 -and
            $entry.elf.classBits -eq $(if ($is64) { 64 } else { 32 }) -and
            $entry.elf.requiredLoadAlignmentBytes -eq $(if ($is64) { 16384 } else { 0 }) -and
            @($entry.elf.loadSegments | Where-Object { $_.alignmentBytes -ne $(if ($is64) { 16384 } else { 4096 }) }).Count -eq 0) "Native evidence differs from independently generated bytes: $($entry.name)"
    }
    $reversed = Copy-Entries $stockEntries
    [Array]::Reverse($reversed)
    $repacked = Invoke-Check -Patched (New-NativeApk 'repacked' $reversed 'changed resource') -Name 'repacked'
    Assert-True ($repacked.ExitCode -eq 0 -and $repacked.Text -ceq $same.Text) 'Native evidence depends on ZIP order, unrelated resources or input paths.'

    $changed = Copy-Entries $stockEntries
    $changed[0].Bytes[500] = $changed[0].Bytes[500] -bxor 1
    Assert-Refusal (Invoke-Check -Patched (New-NativeApk 'changed-bytes' $changed) -Name 'changed-bytes') 'arm64-v8a/libsample\.so: native bytes differ' 'A changed library passed.'
    Assert-Refusal (Invoke-Check -Patched (New-NativeApk 'removed' $stockEntries[1..3]) -Name 'removed') 'arm64-v8a/libsample\.so: native entry is missing' 'A removed library passed.'
    $added = @($stockEntries) + @(New-Entry 'lib/arm64-v8a/libextra.so' (New-Elf))
    Assert-Refusal (Invoke-Check -Patched (New-NativeApk 'added' $added) -Name 'added') 'libextra\.so: native entry is absent from stock' 'An added native entry passed.'
    $renamed = Copy-Entries $stockEntries
    $renamed[0].Name = 'lib/arm64-v8a/librenamed.so'
    $renameResult = Invoke-Check -Patched (New-NativeApk 'renamed' $renamed) -Name 'renamed'
    Assert-Refusal $renameResult 'libsample\.so: native entry is missing' 'A renamed library passed.'
    Assert-True (($renameResult.Facts.failures -join "`n") -match 'librenamed\.so: native entry is absent from stock') 'A rename did not name the added path.'
    $compression = Copy-Entries $stockEntries
    $compression[0].Compression = 'STORE'
    $compressionResult = Invoke-Check -Patched (New-NativeApk 'compression' $compression) -Name 'compression'
    Assert-Refusal $compressionResult 'arm64-v8a/libsample\.so: native compression differs' 'A compression change passed.'
    Assert-True (($compressionResult.Facts.failures -join "`n") -notmatch 'bytes differ') 'Changing only compression was reported as changed native bytes.'
    $stored = Copy-Entries $stockEntries
    foreach ($entry in $stored) { $entry.Compression = 'STORE' }
    $storedApk = New-NativeApk 'stored' $stored
    $storedResult = Invoke-Check -Stock $storedApk -Patched $storedApk -Name 'stored'
    Assert-True ($storedResult.ExitCode -eq 0 -and
        @($storedResult.Facts.stock.entries | Where-Object { $_.compression -cne 'STORE' -or $_.compressionMethod -ne 0 }).Count -eq 0) 'Unchanged stored libraries failed or have the wrong compression facts.'
    $duplicate = New-NativeApk 'duplicate' (@($stockEntries) + @($stockEntries[0]))
    Assert-Refusal (Invoke-Check -Stock $duplicate -Patched $duplicate -Name 'duplicate') 'duplicate native ZIP entry' 'Duplicate native entry names passed.'

    Assert-BadElf 'magic' { param($b) $b[0] = 0 } 'invalid ELF magic'
    Assert-BadElf 'class' { param($b) $b[4] = 3 } 'invalid ELF class'
    Assert-BadElf 'byte-order' { param($b) $b[5] = 3 } 'invalid ELF byte order'
    Assert-BadElf 'ident-version' { param($b) $b[6] = 0 } 'invalid ELF identification version'
    Assert-BadElf 'header-version' { param($b) Set-Integer $b 20 0 4 } 'invalid ELF header version'
    Assert-BadElf 'machine' { param($b) Set-Integer $b 18 62 2 } 'does not match ABI arm64-v8a'
    Assert-BadElf 'header-size' { param($b) Set-Integer $b 52 63 2 } 'invalid ELF header size'
    Assert-BadElf 'ph-size' { param($b) Set-Integer $b 54 55 2 } 'invalid ELF program-header size'
    Assert-BadElf 'ph-offset-overflow' { param($b) Set-Integer $b 32 ([uint64]::MaxValue) 8 } 'ELF program-header offset exceeds'
    Assert-BadElf 'ph-count' { param($b) Set-Integer $b 56 60000 2 } 'ELF program-header table is outside'
    Assert-BadElf 'extended-count-without-sections' { param($b) Set-Integer $b 56 65535 2 } 'ELF section-header table is missing'
    Assert-BadElf 'section-table' { param($b) Set-Integer $b 40 500 8; Set-Integer $b 58 64 2; Set-Integer $b 60 1 2 } 'ELF section-header table is outside'
    Assert-BadElf 'first-load-alignment' { param($b) Set-Integer $b (64 + 48) 4096 8 } 'LOAD\[0\] alignment 4096 is below 16384'
    Assert-BadElf 'second-load-alignment' { param($b) Set-Integer $b (64 + 56 + 48) 4096 8 } 'LOAD\[1\] alignment 4096 is below 16384'
    Assert-BadElf 'x86_64-load-alignment' { param($b) Set-Integer $b (64 + 56 + 48) 4096 8 } 'below 16384 bytes for x86_64' 'x86_64'
    Assert-BadElf 'non-power-of-two' { param($b) Set-Integer $b (64 + 48) 24576 8 } 'alignment is not a power of two'
    Assert-BadElf 'incongruent' { param($b) Set-Integer $b (64 + 56 + 16) 131329 8 } 'not congruent to alignment'
    Assert-BadElf 'load-file-range' { param($b) Set-Integer $b (64 + 56 + 32) 257 8 } 'segment\[1\] file range is outside'
    Assert-BadElf 'load-memory-size' { param($b) Set-Integer $b (64 + 40) 255 8 } 'file size exceeds memory size'
    Assert-BadElf 'load-memory-overflow' { param($b) Set-Integer $b (64 + 16) ([uint64]::MaxValue) 8 } 'memory range overflows'
    Assert-BadElf 'elf32-memory-overflow' { param($b) Set-Integer $b (52 + 8) 4294967167 4 } 'memory range overflows' 'x86'
    Assert-BadElf 'no-loads' { param($b) Set-Integer $b 64 0 4; Set-Integer $b 120 0 4 } 'ELF has no LOAD segments'
    foreach ($length in @(8, 30, 90, 320)) {
        $truncated = (New-Elf)[0..($length - 1)]
        $apk = New-NativeApk -Name "truncated-$length" -Entries @(New-Entry 'lib/arm64-v8a/libsample.so' $truncated)
        Assert-Refusal (Invoke-Check -Stock $apk -Patched $apk -Name "truncated-$length") 'outside native entry.*truncated ELF' "Truncated ELF length $length passed."
    }
    $bigEndian = New-NativeApk 'big-endian' @(New-Entry 'lib/arm64-v8a/libsample.so' (New-Elf -BigEndian))
    $bigEndianResult = Invoke-Check -Stock $bigEndian -Patched $bigEndian -Name 'big-endian'
    Assert-True ($bigEndianResult.ExitCode -eq 0 -and $bigEndianResult.Facts.stock.entries[0].elf.byteOrder -ceq 'big' -and
        $bigEndianResult.Facts.stock.entries[0].elf.loadSegments[1].alignmentBytes -eq 16384) 'ELF fields were not parsed in their declared byte order.'
    $extendedBytes = New-Elf
    [Array]::Clear($extendedBytes, 448, 64)
    Set-Integer $extendedBytes 40 448 8
    Set-Integer $extendedBytes 56 65535 2
    Set-Integer $extendedBytes 58 64 2
    Set-Integer $extendedBytes 62 65535 2
    Set-Integer $extendedBytes (448 + 32) 1 8
    Set-Integer $extendedBytes (448 + 44) 2 4
    $extendedApk = New-NativeApk 'extended-counts' @(New-Entry 'lib/arm64-v8a/libsample.so' $extendedBytes)
    $extendedResult = Invoke-Check -Stock $extendedApk -Patched $extendedApk -Name 'extended-counts'
    Assert-True ($extendedResult.ExitCode -eq 0 -and
        @($extendedResult.Facts.stock.entries[0].elf.loadSegments).Count -eq 2) 'Valid extended ELF counts were not read from the null section.'
    foreach ($alignment in @(0, 1, 4096)) {
        $legacy = New-NativeApk "legacy-$alignment" @(New-Entry 'lib/armeabi-v7a/libsample.so' (New-Elf -Abi 'armeabi-v7a' -Alignment $alignment))
        $legacyResult = Invoke-Check -Stock $legacy -Patched $legacy -Name "legacy-$alignment"
        Assert-True ($legacyResult.ExitCode -eq 0) "A valid 32-bit LOAD alignment $alignment was held to a 16 KB rule."
    }
    $empty = New-NativeApk 'no-native-entries' @()
    $emptyResult = Invoke-Check -Stock $empty -Patched $empty -Name 'no-native-entries'
    Assert-True ($emptyResult.ExitCode -eq 0 -and $emptyResult.Facts.stock.nativeEntryCount -eq 0 -and
        @($emptyResult.Facts.stock.entries).Count -eq 0) 'An APK without native libraries failed or has invented evidence.'
    $notZip = Join-Path $caseRoot 'not-an-apk.apk'
    [IO.File]::WriteAllText($notZip, 'not a ZIP archive')
    Assert-Refusal (Invoke-Check -Stock $notZip -Patched $notZip -Name 'not-an-apk') 'cannot read ZIP archive' 'Invalid APK bytes passed.'

    foreach ($fixturePath in $fixtures) {
        $before = (Get-FileHash -LiteralPath $fixturePath -Algorithm SHA256).Hash
        $name = [IO.Path]::GetFileNameWithoutExtension($fixturePath)
        $actual = Invoke-Check -Stock $fixturePath -Patched $fixturePath -Name $name
        Assert-True ($actual.ExitCode -eq 0 -and $actual.Facts.stock.nativeEntryCount -eq 8 -and
            $actual.Facts.patched.nativeEntryCount -eq 8 -and
            @($actual.Facts.stock.entries | Where-Object { $_.compression -cne 'DEFLATE' }).Count -eq 0 -and
            @($actual.Facts.stock.entries | Where-Object { $_.elf.requiredLoadAlignmentBytes -eq 16384 }).Count -eq 4) "Pinned native fixture failed: $name`n$($actual.Text)"
        Assert-True ((Get-FileHash -LiteralPath $fixturePath -Algorithm SHA256).Hash -ceq $before) "The read-only fixture changed: $name"
    }
} finally {
    if ($caseRoot.StartsWith($requiredPrefix, [StringComparison]::OrdinalIgnoreCase) -and
        (Test-Path -LiteralPath $caseRoot -PathType Container)) {
        Remove-Item -LiteralPath $caseRoot -Recurse -Force
    }
}

$global:LASTEXITCODE = 0
Write-Host '[scripts] native library check contracts passed'
