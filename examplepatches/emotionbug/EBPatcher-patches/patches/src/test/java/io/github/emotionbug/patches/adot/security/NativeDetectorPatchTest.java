package io.github.emotionbug.patches.adot.security;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;
import org.junit.Assume;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import static org.junit.Assert.*;

public class NativeDetectorPatchTest {
    @Rule public TemporaryFolder temp = new TemporaryFolder();
    private static final String[] ABIS = {"arm64-v8a", "armeabi-v7a"};
    private static final int[][] OFFSETS = {{0x5c18, 0x6280, 0x6134}, {0x4684, 0x4bbc, 0x4ac0}};

    @Test public void rejectsUnknownAbiTruncationAndInvalidElfWithoutMutation() {
        rejectUnchanged("x86", new byte[39824], "unsupported ABI");
        rejectUnchanged(ABIS[0], new byte[12], "size");
        rejectUnchanged(ABIS[0], new byte[39824], "ELF");
        rejectUnchanged(ABIS[1], new byte[31284], "ELF");
    }

    @Test public void missingOrOversizedLibraryEmitsNothing() throws Exception {
        for (int size : new int[]{0, 39825}) {
            Path apk = temp.newFile().toPath(), work = temp.getRoot().toPath().resolve("work-" + size);
            try (ZipOutputStream zip = new ZipOutputStream(Files.newOutputStream(apk))) {
                if (size != 0) {
                    zip.putNextEntry(new ZipEntry(entry(ABIS[0])));
                    zip.write(new byte[size]); zip.closeEntry();
                }
            }
            assertThrows(IOException.class, () -> replacements(apk));
            assertFalse(Files.exists(work));
        }
    }

    @Test public void privateOriginalGuardsAndExactUnchangedRegions() throws Exception {
        Path apk = fixture();
        byte[][] originals = originals(apk);
        for (int abi = 0; abi < ABIS.length; abi++) {
            String name = ABIS[abi];
            byte[] original = originals[abi];
            byte[] wrongAbi = original.clone(); wrongAbi[4] = (byte)(abi == 0 ? 1 : 2);
            rejectUnchanged(name, wrongAbi, "ELF");
            byte[] changedBody = original.clone(); changedBody[OFFSETS[abi][0]] ^= 1;
            rejectUnchanged(name, changedBody, "entry");
            byte[] changedUnrelated = original.clone(); changedUnrelated[changedUnrelated.length - 1] ^= 1;
            rejectUnchanged(name, changedUnrelated, "digest");
            byte[] patched = original.clone(); NativeDetectorPatch.patchLibrary(name, patched);
            assertEquals(original.length, patched.length);
            int width = abi == 0 ? 8 : 4;
            for (int i = 0; i < original.length; i++) {
                boolean replacement = false;
                for (int offset : OFFSETS[abi]) if (i >= offset && i < offset + width) replacement = true;
                if (!replacement) assertEquals("untouched byte " + name + ":" + i, original[i], patched[i]);
            }
            for (int offset : OFFSETS[abi]) assertImmediateZeroReturn(patched, offset, abi == 0);
            rejectUnchanged(name, patched, "entry");
        }
    }

    @Test public void privateZipOutputsBothLibrariesAndRejectsReapplicationAtomically() throws Exception {
        Path apk = fixture(); byte[][] original = originals(apk);
        Map<String, byte[]> output = replacements(apk);
        assertEquals(2, output.size());
        byte[][] reread = originals(apk);
        Path repacked = temp.newFile("reapplied.apk").toPath();
        try (ZipOutputStream zip = new ZipOutputStream(Files.newOutputStream(repacked))) {
            for (int i = 0; i < ABIS.length; i++) {
                assertArrayEquals(original[i], reread[i]);
                assertEquals(original[i].length, output.get(entry(ABIS[i])).length);
                zip.putNextEntry(new ZipEntry(entry(ABIS[i])));
                // Valid first ABI, patched second: failure must not emit a partial map/file.
                zip.write(i == 0 ? original[i] : output.get(entry(ABIS[i])));
                zip.closeEntry();
            }
        }
        Path rejected = temp.getRoot().toPath().resolve("rejected");
        assertThrows(IOException.class, () -> replacements(repacked));
        assertFalse(Files.exists(rejected));
    }

    private static Map<String,byte[]> replacements(Path apk) throws IOException {
        try (ZipFile zip = new ZipFile(apk.toFile())) {
            return new NativeDetectorPatch().replacements((name, size) -> {
                ZipEntry entry = zip.getEntry(name);
                if (entry == null || entry.isDirectory() || entry.getSize() != size) throw new IOException("Invalid library size");
                try (InputStream in = zip.getInputStream(entry)) {
                    return io.github.emotionbug.patches.adot.PatchFiles.read(in, size);
                }
            });
        }
    }

    // Decode instruction fields rather than comparing against another copy of the byte patch.
    // This proves a straight-line constant-zero return with no stack/proc/fork instruction;
    // device/emulator execution remains a separate integration responsibility.
    private static void assertImmediateZeroReturn(byte[] bytes, int offset, boolean arm64) {
        ByteBuffer code = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        if (arm64) {
            int mov = code.getInt(offset), ret = code.getInt(offset + 4);
            assertEquals(0x52800000, mov & 0xff800000); // MOVZ Wd, imm16
            assertEquals(0, mov & 31); // W0
            assertEquals(0, (mov >>> 5) & 0xffff); // immediate
            assertEquals(0, (mov >>> 21) & 3); // shift
            assertEquals(0xd65f0000, ret & 0xfffffc1f); // RET Xn
            assertEquals(30, (ret >>> 5) & 31); // link register
        } else {
            int mov = code.getShort(offset) & 0xffff, branch = code.getShort(offset + 2) & 0xffff;
            assertEquals(0x2000, mov & 0xf800); // MOVS Rd, imm8
            assertEquals(0, (mov >>> 8) & 7); assertEquals(0, mov & 255);
            assertEquals(0x4700, branch & 0xff87); // BX Rm, not BLX
            assertEquals(14, (branch >>> 3) & 15); // link register
        }
    }

    private static void rejectUnchanged(String abi, byte[] bytes, String message) {
        byte[] before = bytes.clone();
        IOException error = assertThrows(IOException.class, () -> NativeDetectorPatch.patchLibrary(abi, bytes));
        assertTrue(error.getMessage(), error.getMessage().contains(message));
        assertArrayEquals(before, bytes);
    }
    private static String entry(String abi) { return "lib/" + abi + "/libauthmanager.so"; }
    private static Path fixture() {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide the private original APK via EBPATCHER_TEST_APK", path != null);
        return Paths.get(path);
    }
    private static byte[][] originals(Path apk) throws IOException {
        byte[][] result = new byte[ABIS.length][];
        try (ZipFile zip = new ZipFile(apk.toFile())) {
            for (int i = 0; i < ABIS.length; i++) {
                try (InputStream input = zip.getInputStream(zip.getEntry(entry(ABIS[i])))) {
                    result[i] = input.readNBytes(65537);
                    assertTrue("bounded fixture", result[i].length <= 65536);
                }
            }
        }
        return result;
    }
}
