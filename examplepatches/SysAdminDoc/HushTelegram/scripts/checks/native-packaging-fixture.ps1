# Shared synthetic evidence for receipt, wrapper and malformed-report checks. Binary ELF/ZIP
# validation is exercised independently by test-native-library-check.ps1.
function New-NativePackagingFixture {
    param([string]$SourceSha256 = ('b' * 64))
    $entry = [ordered]@{
        name = 'lib/arm64-v8a/libfixture.so'; abi = 'arm64-v8a'; size = 64; sha256 = ('a' * 64)
        compression = 'DEFLATE'; compressionMethod = 8
        elf = [ordered]@{
            classBits = 64; machine = 183; byteOrder = 'little'; requiredLoadAlignmentBytes = 16384
            loadSegments = @([ordered]@{ index = 0; offset = 0; virtualAddress = 0; fileSize = 32; memorySize = 64; alignmentBytes = 16384 })
        }
    }
    $document = [ordered]@{
        NativeLibraries = [ordered]@{
            schemaVersion = 1; passed = $true; required64BitLoadAlignmentBytes = 16384; failures = @()
            sourceApkSha256 = $SourceSha256.ToLowerInvariant(); stockApkSha256 = ('c' * 64)
            patchedApkSha256 = ('d' * 64); checkerSha256 = ('e' * 64)
            stock = [ordered]@{ nativeEntryCount = 1; entries = @($entry) }
            patched = [ordered]@{ nativeEntryCount = 1; entries = @($entry) }
        }
        ZipAlignment = [ordered]@{
            passed = $true; pageSizeKb = 16; alignmentBytes = 4; apkSha256 = ('d' * 64)
            toolSha256 = ('f' * 64); buildToolsVersion = '37.0.0'
        }
    }
    return $document | ConvertTo-Json -Depth 12 | ConvertFrom-Json
}
