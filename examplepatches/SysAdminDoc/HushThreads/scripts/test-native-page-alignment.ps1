[CmdletBinding()]
param([string]$Root)
$ErrorActionPreference = 'Stop'
if (-not $Root) { $Root = Split-Path -Parent $PSScriptRoot }
. (Join-Path $PSScriptRoot 'Resolve-Java.ps1')
. (Join-Path $PSScriptRoot 'common.ps1')
. (Join-Path $PSScriptRoot 'release-receipt.ps1')
$java = Resolve-Java
$aapt2 = Resolve-Aapt2 -Root $Root
$zipalign = Join-Path (Split-Path -Parent $aapt2) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'zipalign.exe' } else { 'zipalign' })
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\', '/')
$work = Join-Path $tempRoot ('hushthreads-native-contracts-' + [guid]::NewGuid().ToString('N'))
function Assert-Native([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
try {
    New-Item -ItemType Directory -Path $work | Out-Null
    $fixture = Join-Path $work 'NativeFixture.java'
    [IO.File]::WriteAllText($fixture, @'
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.zip.CRC32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
public class NativeFixture {
    public static void main(String[] args) throws Exception {
        boolean wide = !args[1].startsWith("32");
        ByteBuffer elf = ByteBuffer.allocate(256).order(args[1].endsWith("be") ? ByteOrder.BIG_ENDIAN : ByteOrder.LITTLE_ENDIAN);
        elf.put(new byte[]{0x7f, 'E', 'L', 'F', (byte)(wide ? 2 : 1), (byte)(elf.order() == ByteOrder.LITTLE_ENDIAN ? 1 : 2), 1});
        int header = wide ? 64 : 52, size = wide ? 56 : 32;
        if (wide) elf.putLong(32, header); else elf.putInt(28, header);
        elf.putShort(wide ? 54 : 42, (short)size).putShort(wide ? 56 : 44, (short)2);
        for (int i = 0; i < 2; i++) {
            int p = header + size * i;
            elf.putInt(p, 1);
            long alignment = i == 1 && args[2].equals("bad-elf") ? 4096 : 16384;
            if (wide) elf.putLong(p + 48, alignment); else elf.putInt(p + 28, (int)alignment);
        }
        byte[] bytes = elf.array();
        if (args[2].equals("truncated")) bytes = new byte[]{0x7f, 'E', 'L', 'F', 2};
        try (ZipOutputStream zip = new ZipOutputStream(Files.newOutputStream(Path.of(args[0])))) {
            if (args[2].equals("stale-alignment")) {
                zip.putNextEntry(new ZipEntry("META-INF/MANIFEST.MF"));
                zip.write("Manifest-Version: 1.0\r\nCreated-By: fixture\r\n\r\n".getBytes(java.nio.charset.StandardCharsets.UTF_8));
                zip.closeEntry();
            }
            for (String name : new String[]{"lib/arm64-v8a/libfixture.so", "assets/embedded-native"}) {
                ZipEntry entry = new ZipEntry(name);
                if (!args[2].equals("compressed")) {
                    CRC32 crc = new CRC32(); crc.update(bytes);
                    entry.setMethod(ZipEntry.STORED); entry.setSize(bytes.length); entry.setCrc(crc.getValue());
                    if (args[2].equals("stale-alignment") && name.endsWith(".so"))
                        entry.setExtra(new byte[]{0x35, (byte)0xd9, 2, 0, 0, 0x10});
                }
                zip.putNextEntry(entry); zip.write(bytes); zip.closeEntry();
            }
            zip.putNextEntry(new ZipEntry("lib/arm64-v8a/libbase.soloader-manifest.so"));
            zip.write(new byte[]{1, 0, 0, 2, 'm', 'e', 't', 'a'}); zip.closeEntry();
            if (args.length == 4) {
                try (ZipFile manifest = new ZipFile(args[3])) {
                    zip.putNextEntry(new ZipEntry("AndroidManifest.xml"));
                    try (var source = manifest.getInputStream(manifest.getEntry("AndroidManifest.xml"))) { source.transferTo(zip); }
                    zip.closeEntry();
                }
            }
        }
    }
}
'@, [Text.UTF8Encoding]::new($false))
    function New-NativeFixture([string]$Name, [string]$Format = '64le', [string]$Kind = 'valid', [switch]$Align, [string]$ManifestApk) {
        $raw = Join-Path $work ($Name + '.raw.apk')
        $fixtureArguments = @($fixture, $raw, $Format, $Kind)
        if ($ManifestApk) { $fixtureArguments += $ManifestApk }
        & $java @fixtureArguments | Out-Null
        Assert-Native ($LASTEXITCODE -eq 0) 'Independent native fixture writer failed.'
        if (-not $Align) { return $raw }
        $aligned = Join-Path $work ($Name + '.apk')
        & $zipalign -f -P 16 4 $raw $aligned | Out-Null
        Assert-Native ($LASTEXITCODE -eq 0) 'Could not align the independent fixture.'
        return $aligned
    }
    function Read-NativeFixture([string]$Apk, [bool]$Extract = $true) {
        return Get-NativePageFacts -Apk $Apk -Java $java -Aapt2 $aapt2 -ExtractNativeLibs $Extract `
            -ReportPath (Join-Path $work ([guid]::NewGuid().ToString('N') + '.json'))
    }
    foreach ($format in @('64le', '64be', '32le', '32be')) {
        $valid = Read-NativeFixture (New-NativeFixture -Name $format -Format $format -Align)
        Assert-Native ($valid.libraries.Count -eq 2) 'An embedded ELF outside lib/ was omitted.'
        Assert-Native ($valid.zipAligned -eq $true) 'A valid ZIP was rejected.'
        foreach ($library in $valid.libraries) {
            Assert-Native ($library.elfAligned -eq $true -and $library.loadAlignments.Count -eq 2) 'A valid load segment was rejected or omitted.'
        }
        $delta = Get-NativePageDelta -Stock $valid -Patched $valid
        Assert-Native ($delta.alignmentCompatible -and $delta.packagingDefects.Count -eq 0) 'A valid native archive did not pass.'
    }
    $valid = Read-NativeFixture (New-NativeFixture -Name 'good' -Align)
    $badZipPath = New-NativeFixture -Name 'bad-zip'
    $badZip = Read-NativeFixture $badZipPath $false
    Assert-Native (-not $badZip.zipAligned -and $badZip.libraries[0].elfAligned) 'The bad ZIP fixture did not isolate ZIP alignment.'
    $mmapGood = Read-NativeFixture (New-NativeFixture -Name 'mmap-good' -Align) $false
    $delta = Get-NativePageDelta -Stock $mmapGood -Patched $badZip
    Assert-Native ($delta.packagingDefects.Count -eq 1 -and $delta.vendorElfIncompatibilities.Count -eq 0) 'Bad ZIP alignment was not a packaging defect.'
    $extractedBadZip = Read-NativeFixture $badZipPath $true
    $delta = Get-NativePageDelta -Stock $extractedBadZip -Patched $extractedBadZip
    Assert-Native (-not $extractedBadZip.zipAligned -and $delta.alignmentCompatible -and $delta.packagingDefects.Count -eq 0) 'Extracted libraries were held to APK mmap alignment.'
    $unalignedPath = New-NativeFixture -Name 'repair-zip'
    $beforeAlignment = Read-NativeFixture $unalignedPath
    Align-UnsignedNativeApk -Apk $unalignedPath -Aapt2 $aapt2 -Java $java -Facts $beforeAlignment
    $afterAlignment = Read-NativeFixture $unalignedPath
    $delta = Get-NativePageDelta -Stock $beforeAlignment -Patched $afterAlignment
    Assert-Native ($afterAlignment.zipAligned -and $delta.alignmentCompatible -and $delta.packagingDefects.Count -eq 0) 'Aligning unsigned ZIP entries changed native payloads or left bad alignment.'
    $badElf = Read-NativeFixture (New-NativeFixture -Name 'bad-elf' -Kind 'bad-elf' -Align)
    Assert-Native ($badElf.zipAligned -and -not $badElf.libraries[0].elfAligned) 'The bad ELF fixture did not isolate its second load segment.'
    $delta = Get-NativePageDelta -Stock $badElf -Patched $badElf
    Assert-Native (-not $delta.alignmentCompatible -and $delta.vendorElfIncompatibilities.Count -eq 2 -and $delta.packagingDefects.Count -eq 0) 'Unchanged vendor ELF incompatibility was confused with a packaging defect.'
    $delta = Get-NativePageDelta -Stock $valid -Patched $badElf
    Assert-Native ($delta.packagingDefects.Count -gt 0 -and $delta.vendorElfIncompatibilities.Count -eq 0) 'Changed native bytes passed as a vendor limitation.'
    $compressed = Read-NativeFixture (New-NativeFixture -Name 'compressed' -Kind 'compressed')
    Assert-Native ($null -eq $compressed.zipAligned) 'A compressed library was held to mmap ZIP alignment.'
    Assert-Native ((Get-NativePageDelta -Stock $compressed -Patched $compressed).alignmentCompatible) 'Valid extracted native libraries were rejected.'
    $notExtracted = Read-NativeFixture (New-NativeFixture -Name 'not-extracted' -Kind 'compressed') $false
    Assert-Native ((Get-NativePageDelta -Stock $notExtracted -Patched $notExtracted).packagingDefects.Count -gt 0) 'Compressed libraries with extraction disabled passed.'
    $truncated = New-NativeFixture -Name 'truncated' -Kind 'truncated'
    $rejected = $false
    try { Read-NativeFixture $truncated | Out-Null } catch {
        if ($_.Exception.Message -notlike '*Native ELF inspection failed*') { throw }
        $rejected = $true
    }
    Assert-Native $rejected 'A truncated native library passed inspection.'
    # ZIP names are case-sensitive even on a Windows host. Removing one must remain detectable.
    $upper = [pscustomobject]@{path='lib/arm64-v8a/libCase.so';sha256=('a' * 64);compressed=$true;loadAlignments=@(16384);elfAligned=$true}
    $lower = [pscustomobject]@{path='lib/arm64-v8a/libcase.so';sha256=('a' * 64);compressed=$true;loadAlignments=@(16384);elfAligned=$true}
    $bothCases = [pscustomobject]@{extractNativeLibs=$true;libraries=@($upper,$lower);zipAligned=$null}
    $oneCase = [pscustomobject]@{extractNativeLibs=$true;libraries=@($lower);zipAligned=$null}
    Assert-Native ((Get-NativePageDelta -Stock $bothCases -Patched $oneCase).packagingDefects.Count -eq 1) 'Removing a case-distinct native payload passed.'

    $desktop = Resolve-DesktopCli -Root $Root -Required
    $sdk = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $aapt2))
    $androidJar = Join-Path $sdk 'platforms/android-36/android.jar'
    Assert-Native (Test-Path -LiteralPath $androidJar -PathType Leaf) 'The signing fixture requires the project Android 36 SDK.'
    $manifestXml = Join-Path $work 'AndroidManifest.xml'
    [IO.File]::WriteAllText($manifestXml, '<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.native.fixture" android:versionCode="1" android:versionName="1"><uses-sdk android:minSdkVersion="28"/><application android:extractNativeLibs="false"/></manifest>')
    $manifestApk = Join-Path $work 'manifest.apk'
    & $aapt2 link --manifest $manifestXml -I $androidJar -o $manifestApk | Out-Null
    Assert-Native ($LASTEXITCODE -eq 0) 'Could not compile the independent signing fixture manifest.'
    $seed = Join-Path $work 'seed.p12'
    $keytool = Join-Path (Split-Path -Parent $java) $(if ($IsWindows -or $env:OS -eq 'Windows_NT') { 'keytool.exe' } else { 'keytool' })
    & $keytool -genkeypair -alias fixture -keyalg RSA -keysize 2048 -validity 1 -dname 'CN=Native fixture' `
        -storetype PKCS12 -keystore $seed -storepass 'native-fixture-password' -keypass 'native-fixture-password' 2>&1 | Out-Null
    Assert-Native ($LASTEXITCODE -eq 0) 'Could not generate an isolated disposable signing fixture.'
    $keyFixture = Join-Path $work 'SigningFixture.java'
    [IO.File]::WriteAllText($keyFixture, @'
import app.morphe.patcher.apk.ApkSigner;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.KeyStore;
public class SigningFixture {
    public static void main(String[] args) throws Exception {
        var signer = ApkSigner.INSTANCE; // Registers the pinned BKS provider.
        char[] password = "native-fixture-password".toCharArray();
        var seed = KeyStore.getInstance(new File(args[0]), password);
        for (String type : new String[]{"JKS", "BKS"}) {
            var store = KeyStore.getInstance(type);
            store.load(null, password);
            store.setKeyEntry("fixture", seed.getKey("fixture", password), password, seed.getCertificateChain("fixture"));
            try (var output = Files.newOutputStream(Path.of(args[1], type + ".keystore"))) {
                store.store(output, type.equals("BKS") ? null : password);
            }
        }
    }
}
'@, [Text.UTF8Encoding]::new($false))
    & $java -cp $desktop $keyFixture $seed $work | Out-Null
    Assert-Native ($LASTEXITCODE -eq 0) 'Could not prepare the independent JKS/BKS fixtures.'
    $savedStorePassword = $env:HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD
    $savedEntryPassword = $env:HUSHTHREADS_SIDELOAD_KEY_PASSWORD
    try {
        $env:HUSHTHREADS_SIDELOAD_KEY_PASSWORD = 'native-fixture-password'
        foreach ($type in @('PKCS12', 'JKS', 'BKS')) {
            $env:HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD = $(if ($type -eq 'BKS') { '' } else { 'native-fixture-password' })
            $key = $(if ($type -eq 'PKCS12') { $seed } else { Join-Path $work ($type + '.keystore') })
            $keyHash = (Get-FileHash -LiteralPath $key).Hash
            $unsigned = New-NativeFixture -Name ('sign-' + $type) -Kind 'stale-alignment' -Align -ManifestApk $manifestApk
            $before = Read-NativeFixture $unsigned $false
            if ($type -eq 'PKCS12') {
                $staleSigned = Join-Path $work 'stale-signed.apk'
                & $java -cp $desktop (Join-Path $PSScriptRoot 'SignAlignedApk.java') $unsigned $staleSigned $key fixture | Out-Null
                Assert-Native ($LASTEXITCODE -eq 0) 'The stale-alignment repro failed before its independent ZIP check.'
                $stale = Read-NativeFixture $staleSigned $false
                Assert-Native (-not $stale.zipAligned -and (Get-NativePageDelta -Stock $before -Patched $stale).packagingDefects.Count -eq 1) 'The stale 4 KB metadata fixture no longer reproduces the post-sign ZIP defect.'
            }
            Align-UnsignedNativeApk -Apk $unsigned -Aapt2 $aapt2 -Java $java -Facts $before
            $signed = Join-Path $work ($type + '-signed.apk')
            & $java -cp $desktop (Join-Path $PSScriptRoot 'SignAlignedApk.java') $unsigned $signed $key fixture | Out-Null
            Assert-Native ($LASTEXITCODE -eq 0) "Signing/verification failed for $type."
            $delta = Get-NativePageDelta -Stock $before -Patched (Read-NativeFixture $signed $false)
            Assert-Native ($delta.alignmentCompatible -and $delta.packagingDefects.Count -eq 0) "Signing reset alignment or changed payloads for $type."
            Assert-Native ((Get-FileHash -LiteralPath $key).Hash -ceq $keyHash) "Signing replaced or converted the $type key."
        }
    } finally {
        $env:HUSHTHREADS_SIDELOAD_KEYSTORE_PASSWORD = $savedStorePassword
        $env:HUSHTHREADS_SIDELOAD_KEY_PASSWORD = $savedEntryPassword
    }
    Write-Host '[native] final signed ZIP alignment, unchanged payloads and original BKS/JKS/PKCS12 keys passed'
    Write-Host '[native] valid ELF32/ELF64/endian, bad ELF, bad ZIP, extraction and malformed-input contracts passed'
} finally {
    $resolved = [IO.Path]::GetFullPath($work)
    if (-not $resolved.StartsWith($tempRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -or
        -not (Split-Path -Leaf $resolved).StartsWith('hushthreads-native-contracts-')) { throw 'Unsafe native fixture cleanup path.' }
    if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
}
$global:LASTEXITCODE = 0
