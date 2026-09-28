package app.patchlab.extension.offlinegames;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import static org.junit.Assert.*;

public class NativeLibraryStoreTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void mountedApkWinsOverStockLibraryAndCachedOutput() throws Exception {
        File apk = temporary.newFile("base.apk");
        File root = temporary.newFolder("private-libraries");
        File stock = temporary.newFolder("nativeLibraryDir");
        File stockIl2cpp = new File(stock, "libil2cpp.so");
        Files.write(stockIl2cpp.toPath(), bytes("stock install"));
        writeApk(apk, "patched v1", false);
        File first = NativeLibraryStore.prepare(apk, root);
        assertArrayEquals(bytes("patched v1"), Files.readAllBytes(new File(first, "libil2cpp.so").toPath()));
        assertArrayEquals(bytes("stock install"), Files.readAllBytes(stockIl2cpp.toPath()));
        assertEquals(first, NativeLibraryStore.prepare(apk, root));

        // A new mount at the SAME sourceDir must not reuse the previous patch's libraries.
        writeApk(apk, "patched v2", false);
        File second = NativeLibraryStore.prepare(apk, root);
        assertNotEquals(first, second);
        assertArrayEquals(bytes("patched v2"), Files.readAllBytes(new File(second, "libil2cpp.so").toPath()));
        assertArrayEquals(bytes("patched v1"), Files.readAllBytes(new File(first, "libil2cpp.so").toPath()));
    }

    @Test public void damagedCachedLibraryIsRepairedFromApk() throws Exception {
        File apk = temporary.newFile("base.apk");
        File root = temporary.newFolder("cache");
        writeApk(apk, "expected", false);
        File directory = NativeLibraryStore.prepare(apk, root);
        File library = new File(directory, "libil2cpp.so");
        Files.write(library.toPath(), bytes("tampered")); // same length as expected
        assertEquals(directory, NativeLibraryStore.prepare(apk, root));
        assertArrayEquals(bytes("expected"), Files.readAllBytes(library.toPath()));
    }

    @Test public void mismatchedApkPayloadIsRejectedWithoutPublishingBadLibrary() throws Exception {
        File apk = temporary.newFile("base.apk");
        File root = temporary.newFolder("cache");
        writeApk(apk, "patched", true);
        try {
            NativeLibraryStore.prepare(apk, root);
            fail("Unexpected payload accepted");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("libil2cpp.so"));
        }
        try (var paths = Files.walk(root.toPath())) {
            assertFalse(paths.anyMatch(p -> p.getFileName().toString().equals("libil2cpp.so") ||
                    p.getFileName().toString().endsWith(".tmp")));
        }
    }

    @Test public void stockApkWithoutManifestDoesNotSilentlyFallBack() throws Exception {
        File apk = temporary.newFile("base.apk");
        try (ZipOutputStream zip = new ZipOutputStream(new FileOutputStream(apk))) {
            entry(zip, "unrelated.txt", bytes("stock"));
        }
        try {
            NativeLibraryStore.prepare(apk, temporary.newFolder("cache"));
            fail("Missing patch manifest accepted");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("remount"));
        }
    }

    @Test public void arm64ManifestSelectsArm64PayloadAndUsesSeparateCache() throws Exception {
        File apk = temporary.newFile("base.apk");
        File root = temporary.newFolder("cache");
        writeApk(apk, "armv7", false);
        File armv7 = NativeLibraryStore.prepare(apk, root);
        writeApk(apk, "arm64", false, "arm64-v8a");
        File arm64 = NativeLibraryStore.prepare(apk, root);
        assertNotEquals(armv7, arm64);
        assertArrayEquals(bytes("arm64"), Files.readAllBytes(new File(arm64, "libil2cpp.so").toPath()));
    }

    @Test public void unsupportedAbiIsRejectedBeforeExtraction() throws Exception {
        File apk = temporary.newFile("base.apk");
        writeApk(apk, "bad ABI", false, "../../escape");
        try {
            NativeLibraryStore.prepare(apk, temporary.newFolder("cache"));
            fail("Unsupported ABI accepted");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("ABI"));
        }
    }

    private static void writeApk(File file, String il2cpp, boolean mismatch) throws Exception {
        writeApk(file, il2cpp, mismatch, null);
    }

    private static void writeApk(File file, String il2cpp, boolean mismatch, String abi) throws Exception {
        Map<String, byte[]> libs = new LinkedHashMap<>();
        libs.put("libmain.so", bytes("Unity loader"));
        libs.put("libunity.so", bytes("Unity engine"));
        libs.put("libil2cpp.so", bytes(il2cpp));
        StringBuilder manifest = new StringBuilder("format=1\n");
        if (abi != null) manifest.append("abi=").append(abi).append('\n');
        for (var lib : libs.entrySet()) {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(lib.getValue());
            manifest.append(lib.getKey()).append('=');
            for (byte b : hash) manifest.append(String.format("%02x", b & 255));
            manifest.append('\n');
        }
        try (ZipOutputStream zip = new ZipOutputStream(new FileOutputStream(file))) {
            entry(zip, NativeLibraryStore.MANIFEST, bytes(manifest.toString()));
            for (var lib : libs.entrySet()) {
                entry(zip, "lib/" + (abi == null ? "armeabi-v7a" : abi) + "/" + lib.getKey(),
                        mismatch && lib.getKey().equals("libil2cpp.so") ? bytes("bad data") : lib.getValue());
            }
        }
    }

    private static void entry(ZipOutputStream zip, String name, byte[] data) throws IOException {
        zip.putNextEntry(new ZipEntry(name));
        zip.write(data);
        zip.closeEntry();
    }

    private static byte[] bytes(String value) { return value.getBytes(StandardCharsets.UTF_8); }
}
