package santodan.patches;

import java.util.Arrays;
import java.util.zip.ZipFile;

/**
 * Proves the experimental structural fallback reproduces the reviewed exact
 * 2.2.52 transform byte-for-byte, and that it fails safe on malformed input.
 * This is the closest available proxy for an unknown future build: the generic
 * path locates the same targets by structure and must agree with the exact path.
 */
public final class VerifyCarScannerGeneric {
    public static void main(String[] args) throws Exception {
        byte[] store, aot, guard, decoder;
        try (ZipFile apk = new ZipFile(args[0])) {
            store = apk.getInputStream(apk.getEntry(CarScannerGeneric.ENTRY)).readAllBytes();
            aot = apk.getInputStream(apk.getEntry(CarScannerGeneric.AOT_ENTRY)).readAllBytes();
            guard = apk.getInputStream(apk.getEntry(CarScannerGeneric.GUARD_ENTRY)).readAllBytes();
            decoder = apk.getInputStream(apk.getEntry(CarScannerGeneric.DECODER_ENTRY)).readAllBytes();
        }

        var generic = CarScannerGeneric.patch(store, aot, guard);
        byte[] genericDecoder = CarScannerGeneric.patchDecoder(decoder);
        var exact = CarScanner252.patch(store, aot, guard);
        byte[] exactDecoder = CarScanner252.patchDecoder(decoder);

        if (!Arrays.equals(generic.store(), exact.store()))
            throw new AssertionError("Generic store differs from exact 2.2.52 store");
        if (!Arrays.equals(generic.aot(), exact.aot()))
            throw new AssertionError("Generic AOT differs from exact 2.2.52 AOT");
        if (!Arrays.equals(generic.guard(), exact.guard()))
            throw new AssertionError("Generic guard differs from exact 2.2.52 guard");
        if (!Arrays.equals(genericDecoder, exactDecoder))
            throw new AssertionError("Generic decoder differs from exact 2.2.52 decoder");

        // The generic output satisfies the same exhaustive structural checks.
        VerifyCarScanner252.verify(store, generic.store());
        VerifyCarScanner252.verifyNative(aot, generic.aot(), guard, generic.guard());
        VerifyCarScanner252.verifyDecoder(decoder, genericDecoder);

        // Rejection: a truncated or non-XABA store must fail safe, never write.
        reject(new byte[32], aot, guard);
        byte[] noXaba = store.clone(); noXaba[16384] ^= 0xff;
        reject(noXaba, aot, guard);

        // Input is never mutated by a successful run.
        byte[][] fresh;
        try (ZipFile apk = new ZipFile(args[0])) {
            fresh = new byte[][] {
                apk.getInputStream(apk.getEntry(CarScannerGeneric.ENTRY)).readAllBytes(),
                apk.getInputStream(apk.getEntry(CarScannerGeneric.AOT_ENTRY)).readAllBytes(),
                apk.getInputStream(apk.getEntry(CarScannerGeneric.GUARD_ENTRY)).readAllBytes(),
            };
        }
        if (!Arrays.equals(store, fresh[0]) || !Arrays.equals(aot, fresh[1]) || !Arrays.equals(guard, fresh[2]))
            throw new AssertionError("Input mutated");

        System.out.println("PASS: experimental generic fallback reproduces the exact 2.2.52 store/AOT/guard/decoder "
            + "(structural metadata + method-address-table lookup), passes all exact structural checks, and fails safe on malformed input");
    }

    private static void reject(byte[] store, byte[] aot, byte[] guard) {
        try { CarScannerGeneric.patch(store, aot, guard); }
        catch (RuntimeException expected) { return; }
        throw new AssertionError("Malformed store accepted by generic fallback");
    }
}
