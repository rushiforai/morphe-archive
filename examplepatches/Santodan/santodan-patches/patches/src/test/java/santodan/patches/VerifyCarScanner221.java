package santodan.patches;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.zip.ZipFile;

/** Real-input verifier, including all unaffected assembly blocks and failure paths. */
public final class VerifyCarScanner221 {
    public static void main(String[] args) throws Exception {
        byte[] store, aot, guard;
        try (ZipFile apk = new ZipFile(args[0])) {
            store = apk.getInputStream(apk.getEntry(CarScanner221.ENTRY)).readAllBytes();
            aot = apk.getInputStream(apk.getEntry(CarScanner221.AOT_ENTRY)).readAllBytes();
            guard = apk.getInputStream(apk.getEntry(CarScanner221.GUARD_ENTRY)).readAllBytes();
        }
        var patched = CarScanner221.patch(store, aot, guard);
        verify(store, patched.store());
        verifyNative(aot, patched.aot(), guard, patched.guard());
        byte[] decoder = read(args[0], CarScanner221.DECODER_ENTRY);
        byte[] patchedDecoder = CarScanner221.patchDecoder(decoder);
        verifyDecoder(decoder, patchedDecoder);
        rejectDecoder(patchedDecoder);
        byte[] damagedDecoder = decoder.clone(); damagedDecoder[0x25d68] ^= 1;
        rejectDecoder(damagedDecoder);
        byte[] damagedSettingsDecoder = decoder.clone(); damagedSettingsDecoder[0x23fcc] ^= 1;
        rejectDecoder(damagedSettingsDecoder);
        reject(patched.store(), aot, guard);
        reject(store, patched.aot(), guard);
        reject(store, aot, patched.guard());
        byte[] damaged = store.clone(); damaged[16384 + 4] ^= 1;
        reject(damaged, aot, guard);
        byte[] differentAot = aot.clone(); differentAot[0x18d8a74] ^= 1;
        reject(store, differentAot, guard);
        byte[] differentGuard = guard.clone(); differentGuard[0x2abf0] ^= 1;
        reject(store, aot, differentGuard);
        // Rejection never mutates the caller's inputs.
        if (!Arrays.equals(store, read(args[0], CarScanner221.ENTRY)))
            throw new AssertionError("Input mutated");
        System.out.println("PASS: 2.2.21 IL/AOT premium + ECU gate, settings/profile decoder seeds, failure-only exit scheduler; 215 unrelated assemblies, ELF reload and rejection checks");
    }

    private static byte[] read(String apkPath, String entry) throws Exception {
        try (ZipFile apk = new ZipFile(apkPath)) {
            return apk.getInputStream(apk.getEntry(entry)).readAllBytes();
        }
    }

    public static void verifyDecoder(byte[] original, byte[] patched) {
        if (original.length != patched.length || CarScanner221.integer(patched, 0x25d68) != 0x2a0903e8)
            throw new AssertionError("Profile normal seed selection missing");
        if (CarScanner221.integer(patched, 0x23fcc) != 0x2a0903e8)
            throw new AssertionError("Settings normal seed selection missing");
        for (int i = 0; i < original.length; i++) {
            if (i >= 0x25d68 && i < 0x25d6c) continue;
            if (i >= 0x23fcc && i < 0x23fd0) continue;
            if (original[i] != patched[i]) throw new AssertionError("Unrelated decoder byte changed");
        }
        // Independent interpretation of the original AArch64 mixing sequence:
        // success must yield the profile database's normal seed, failure must not.
        if (profileSeed(0xec225c72) != 0 || profileSeed(0x9dac8f86) != 0x143a)
            throw new AssertionError("Unexpected profile seed contract");
        if (settingsSeed(0x3c6ef372) != 0 || settingsSeed(0xa54ff53a) != 0x4566)
            throw new AssertionError("Unexpected settings seed contract");
        // Native variant 1 writes with position + 0x38 (seed is only 16 bits),
        // but reads with (seed ^ 0xffffffc7) - (seed >>> 8) - position + 1.
        // A nonzero failure seed therefore breaks even same-process round trips.
        for (int position : new int[] {0, 1, 255, 256, 65537}) {
            for (int value = 0; value < 256; value++) {
                int encoded = (value + position + 0x38) & 255;
                if (readSettingsByte(encoded, position, settingsSeed(0x3c6ef372)) != value)
                    throw new AssertionError("Settings byte round trip failed");
                if (readSettingsByte(encoded, position, settingsSeed(0xa54ff53a)) == value)
                    throw new AssertionError("Failure seed unexpectedly decoded settings");
            }
        }
    }

    private static int readSettingsByte(int value, int position, int seed) {
        return (value + (seed ^ 0xffffffc7) - (seed >>> 8) - position + 1) & 255;
    }

    private static int settingsSeed(int input) {
        int mixed = Integer.rotateRight(input ^ 0xa2fa3cdc, 19) * 0x85ebca77 ^ 0x162f2a9e;
        boolean nonzero = mixed != 0;
        mixed ^= nonzero ? 0x91e10da5 : 0;
        mixed = (mixed ^ mixed >>> 16) * 0x7feb352d;
        mixed = (mixed ^ mixed >>> 15) * 0x846ca68b;
        int high = (mixed >>> 18 & 127) + (nonzero ? 1 : 0);
        int low = ((mixed >>> 18 ^ mixed >>> 2) & 127) + (nonzero ? 1 : 0);
        return high << 8 | low;
    }

    private static int profileSeed(int input) {
        int mixed = Integer.rotateRight(input, 21) * 0x27d4eb2f ^ 0x8712d5cf;
        boolean nonzero = mixed != 0;
        mixed ^= nonzero ? 0xd1b54a35 : 0;
        mixed = (mixed ^ mixed >>> 16) * 0x7feb352d;
        mixed = (mixed ^ mixed >>> 15) * 0x846ca68b;
        int high = (mixed >>> 18 & 127) + (nonzero ? 1 : 0);
        int low = ((mixed >>> 18 ^ mixed >>> 2) & 127) + (nonzero ? 1 : 0);
        return high << 8 | low;
    }

    private static void rejectDecoder(byte[] decoder) {
        try { CarScanner221.patchDecoder(decoder); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsupported profile decoder accepted");
    }

    public static void verifyNative(byte[] aot, byte[] patchedAot, byte[] guard, byte[] patchedGuard) {
        if (aot.length != patchedAot.length || guard.length != patchedGuard.length)
            throw new AssertionError("Native library size changed");
        for (int i = 0; i < aot.length; i++) {
            if (i >= 0x238a00 && i < 0x238a08 || i >= 0x6aff20 && i < 0x6aff28) continue;
            if (aot[i] != patchedAot[i]) throw new AssertionError("Unrelated AOT bytes changed");
        }
        for (int offset : new int[] {0x238a00, 0x6aff20}) {
            if (CarScanner221.integer(patchedAot, offset) != 0x52800020
                || CarScanner221.integer(patchedAot, offset + 4) != 0xd65f03c0)
                throw new AssertionError("AOT Boolean return missing");
        }
        for (int i = 0; i < guard.length; i++) {
            if (i >= 0x2abf0 && i < 0x2abf4) continue;
            if (guard[i] != patchedGuard[i]) throw new AssertionError("Unrelated guard bytes changed");
        }
        if (CarScanner221.integer(patchedGuard, 0x2abf0) != 0xd65f03c0)
            throw new AssertionError("Exit scheduler not disabled");
    }

    public static void verify(byte[] original, byte[] patched) {
        int descriptors = 16384 + 20 + 5616;
        for (int i = 0; i < 216; i++) {
            int d = descriptors + i * 28;
            int oldStart = 16384 + CarScannerAssemblyStore.integer(original, d + 4);
            int newStart = 16384 + CarScannerAssemblyStore.integer(patched, d + 4);
            int oldSize = CarScannerAssemblyStore.integer(original, d + 8);
            int newSize = CarScannerAssemblyStore.integer(patched, d + 8);
            if (i != 193) {
                if (!Arrays.equals(Arrays.copyOfRange(original, oldStart, oldStart + oldSize),
                    Arrays.copyOfRange(patched, newStart, newStart + newSize)))
                    throw new AssertionError("Unrelated image changed: " + i);
            } else {
                byte[] before = CarScannerAssemblyStore.decodeLz4(original, oldStart + 12,
                    oldStart + oldSize, CarScannerAssemblyStore.integer(original, oldStart + 8));
                byte[] after = Arrays.copyOfRange(patched, newStart, newStart + newSize);
                if (after.length != before.length) throw new AssertionError("Managed size changed");
                int[] starts = {0x9c860, 0x1a46f8}, lengths = {124, 115};
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
        try { CarScanner221.patch(store, aot, guard); }
        catch (IllegalStateException expected) { return; }
        throw new AssertionError("Unsupported input accepted");
    }
}
