package santodan.patches;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.zip.ZipFile;

/** Real-input verifier, including all unaffected assembly blocks and failure paths. */
public final class VerifyCarScanner242 {
    public static void main(String[] args) throws Exception {
        try (ZipFile input = new ZipFile(args[0])) {
            if (input.getEntry(CarScanner242Arm64.ENTRY) != null) {
                VerifyCarScanner242Arm64.main(args);
                return;
            }
        }
        byte[] store, aot, guard;
        try (ZipFile apk = new ZipFile(args[0])) {
            store = apk.getInputStream(apk.getEntry(CarScanner242.ENTRY)).readAllBytes();
            aot = apk.getInputStream(apk.getEntry(CarScanner242.AOT_ENTRY)).readAllBytes();
            guard = apk.getInputStream(apk.getEntry(CarScanner242.GUARD_ENTRY)).readAllBytes();
        }
        var patched = CarScanner242.patch(store, aot, guard);
        verify(store, patched.store());
        verifyNative(aot, patched.aot(), guard, patched.guard());
        byte[] decoder = read(args[0], CarScanner242.DECODER_ENTRY);
        byte[] patchedDecoder = CarScanner242.patchDecoder(decoder);
        verifyDecoder(decoder, patchedDecoder);
        rejectDecoder(patchedDecoder);
        byte[] damagedDecoder = decoder.clone(); damagedDecoder[0x2573d] ^= 1;
        rejectDecoder(damagedDecoder);
        byte[] damagedSettingsDecoder = decoder.clone(); damagedSettingsDecoder[0x225ba] ^= 1;
        rejectDecoder(damagedSettingsDecoder);
        reject(patched.store(), aot, guard);
        reject(store, patched.aot(), guard);
        reject(store, aot, patched.guard());
        byte[] damaged = store.clone(); damaged[16384 + 4] ^= 1;
        reject(damaged, aot, guard);
        byte[] differentAot = aot.clone(); differentAot[0x1817ddf] ^= 1;
        reject(store, differentAot, guard);
        byte[] differentGuard = guard.clone(); differentGuard[0x2c170] ^= 1;
        reject(store, aot, differentGuard);
        // Rejection never mutates the caller's inputs.
        if (!Arrays.equals(store, read(args[0], CarScanner242.ENTRY)))
            throw new AssertionError("Input mutated");
        System.out.println("PASS: 2.2.42 IL/AOT premium + ECU gate, settings/profile decoder seeds, failure-only exit scheduler; 215 unrelated assemblies, ELF reload and rejection checks");
    }

    private static byte[] read(String apkPath, String entry) throws Exception {
        try (ZipFile apk = new ZipFile(apkPath)) {
            return apk.getInputStream(apk.getEntry(entry)).readAllBytes();
        }
    }

    public static void verifyDecoder(byte[] original, byte[] patched) {
        byte[] expected = original.clone();
        put(expected, 0x225ba, "b99e2a2f1690");
        put(expected, 0x2573d, "89c890");
        if (!Arrays.equals(expected, patched)) throw new AssertionError("Decoder mutation scope");
        // Interpret replacement plus the original subsequent XOR: ECX becomes zero,
        // SETNE AL becomes zero, then both multiply/XOR mixers produce seed zero.
        int ecx = java.nio.ByteBuffer.wrap(patched).order(java.nio.ByteOrder.LITTLE_ENDIAN).getInt(0x225bb);
        if ((ecx ^ 0x162f2a9e) != 0) throw new AssertionError("Settings seed is not normal");
        for (int position : new int[] {0, 1, 255, 256, 65537})
            for (int value = 0; value < 256; value++) {
                int encoded = (value + position + 0x38) & 255;
                if (((encoded + 0xffffffc7 - position + 1) & 255) != value)
                    throw new AssertionError("Settings round-trip failed");
            }
    }

    public static void verifyNative(byte[] aot, byte[] patchedAot, byte[] guard, byte[] patchedGuard) {
        byte[] expectedAot = aot.clone(), expectedGuard = guard.clone();
        put(expectedAot, 0x202480, "b801000000c3");
        put(expectedAot, 0x6595c0, "b801000000c3");
        expectedGuard[0x2c170] = (byte) 0xc3;
        if (!Arrays.equals(expectedAot, patchedAot) || !Arrays.equals(expectedGuard, patchedGuard))
            throw new AssertionError("Native mutation scope");
    }

    private static void put(byte[] bytes, int offset, String hex) {
        byte[] value = CarScanner242.hexBytes(hex);
        System.arraycopy(value, 0, bytes, offset, value.length);
    }

    private static void rejectDecoder(byte[] bytes) {
        try { CarScanner242.patchDecoder(bytes); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsupported decoder accepted");
    }

    public static void verify(byte[] original, byte[] patched) {
        int descriptors = 16384 + 20 + 5616;
        for (int i = 0; i < 216; i++) {
            int d = descriptors + i * 28;
            int oldStart = 16384 + CarScannerAssemblyStore.integer(original, d + 4);
            int newStart = 16384 + CarScannerAssemblyStore.integer(patched, d + 4);
            int oldSize = CarScannerAssemblyStore.integer(original, d + 8);
            int newSize = CarScannerAssemblyStore.integer(patched, d + 8);
            if (i != 192) {
                if (!Arrays.equals(Arrays.copyOfRange(original, oldStart, oldStart + oldSize),
                    Arrays.copyOfRange(patched, newStart, newStart + newSize)))
                    throw new AssertionError("Unrelated image changed: " + i);
            } else {
                byte[] before = CarScannerAssemblyStore.decodeLz4(original, oldStart + 12,
                    oldStart + oldSize, CarScannerAssemblyStore.integer(original, oldStart + 8));
                byte[] after = Arrays.copyOfRange(patched, newStart, newStart + newSize);
                if (after.length != before.length) throw new AssertionError("Managed size changed");
                int[] starts = {0x9d724, 0x1a94bc}, lengths = {124, 115};
                for (int k = 0; k < starts.length; k++) {
                    int start = starts[k];
                    if (after[start] != 0x17 || after[start + 1] != 0x2a)
                        throw new AssertionError("Boolean return missing");
                    for (int j = start + 2; j < start + lengths[k]; j++)
                        if (after[j] != 0) throw new AssertionError("Unexpected unreachable IL");
                }
                for (int j = 0; j < before.length; j++) {
                    if (j >= starts[0] && j < starts[0] + lengths[0]
                        || j >= starts[1] && j < starts[1] + lengths[1]) continue;
                    if (before[j] != after[j]) throw new AssertionError("Unrelated managed bytes changed");
                }
            }
        }
        var oldElf = java.nio.ByteBuffer.wrap(original).order(java.nio.ByteOrder.LITTLE_ENDIAN);
        var newElf = java.nio.ByteBuffer.wrap(patched).order(java.nio.ByteOrder.LITTLE_ENDIAN);
        int oldHeaders = Math.toIntExact(oldElf.getLong(40));
        int newHeaders = Math.toIntExact(newElf.getLong(40));
        int delta = patched.length - original.length;
        if (newHeaders != oldHeaders + delta) throw new AssertionError("ELF section table not relocated");
        for (int i = 0; i < Short.toUnsignedInt(oldElf.getShort(60)); i++) {
            int o = oldHeaders + i * 64, n = newHeaders + i * 64;
            long offset = newElf.getLong(n + 24), length = newElf.getLong(n + 32);
            if (newElf.getInt(n + 4) != 8 && offset + length > patched.length)
                throw new AssertionError("ELF section out of bounds");
            if (oldElf.getLong(o + 24) == 16384 && length != oldElf.getLong(o + 32) + delta)
                throw new AssertionError("Payload length not updated");
        }
        // The allocated ELF segments and all name-hash index entries are untouched.
        for (int i = 0; i < descriptors; i++) {
            if (i >= 40 && i < 48) continue;
            if (original[i] != patched[i]) throw new AssertionError("ELF prefix or index changed");
        }
    }

    private static void reject(byte[] store, byte[] aot, byte[] guard) {
        try { CarScanner242.patch(store, aot, guard); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsupported input accepted");
    }
}
