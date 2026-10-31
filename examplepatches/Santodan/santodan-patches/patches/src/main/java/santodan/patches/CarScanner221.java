package santodan.patches;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.MessageDigest;
import java.util.Arrays;

/** Exact 2.2.21 IL/AOT premium and repackaging compatibility transformation. */
public final class CarScanner221 {
    public static final String ENTRY = "lib/arm64-v8a/libassembly-store.so";
    public static final String AOT_ENTRY = "lib/arm64-v8a/libaot-CarScannerMaui.dll.so";
    public static final String DECODER_ENTRY = "lib/arm64-v8a/libvndctx.so";
    private static final int PAYLOAD = 16384;
    private static final int DESCRIPTORS = PAYLOAD + 20 + 5616;
    private static final int TARGET = 193;
    private static final int BODY = 0x9c854;
    private CarScanner221() {}

    public static Result patch(byte[] store, byte[] aot, byte[] guard) {
        requireHash(store, "8e27ae5a623eb6edc47e8c90c3592da7f5b0db0384f89a7ba8541489a4d26f67", "assembly store (unsupported or already modified)");
        requireHash(aot, "87a8bd91e73f0fd9f28754ca079ef753944b84fc5eddcc3f1bd558b3f13e9fbd", "AOT image");
        requireHash(guard, "b44e030155fabfc3ce2617a8ad776706a2b43f872bf6644392bd2b811a756ed4", "integrity library");
        // mono_aot_file_info format 187, table VA 0x18db380. Both methods have
        // compiled AArch64 bodies; changing IL alone would leave these paths active.
        check(integer(aot, 0x18d8a74) == 0x97a56fe3
            && integer(aot, 0x18dd5cc) == 0x97b73a55, "Unexpected AOT method entries");
        check(longInteger(aot, 0x238a00) == 0x910003fda9ba7bfdL
            && longInteger(aot, 0x6aff20) == 0x910003fda9be7bfdL, "Unexpected AOT bodies");
        // Failure-only scheduler creates a sleeping thread ending in _exit(0).
        // Leave JNI attachment, hash validation and every transport method intact.
        check(integer(guard, 0x2abf0) == 0xa9bd7bfd, "Unexpected exit scheduler");
        check(integer(store, PAYLOAD) == 0x41424158 && integer(store, PAYLOAD + 4) == 0x80010003,
            "Unexpected XABA format");
        int descriptor = DESCRIPTORS + TARGET * 28;
        int start = PAYLOAD + integer(store, descriptor + 4);
        int size = integer(store, descriptor + 8);
        check(start == 9915948 && size == 24870304 && integer(store, descriptor) == TARGET,
            "Unexpected assembly descriptor");
        // XALZ compression descriptor index is independent of XABA's sorted index.
        check(integer(store, start) == 0x5a4c4158 && integer(store, start + 4) == 124,
            "Unexpected XALZ header");
        byte[] image = CarScannerAssemblyStore.decodeLz4(store, start + 12, start + size, integer(store, start + 8));
        requireHash(image, "4cc192ffd7e358be162590a22b38a7f9c9f83e0728a24fbc78ab999493d5f261", "CarScannerMaui.dll");
        // Exact MethodDefs: SharedSettings.get_AdsProductPurchased (0x060015be,
        // bool instance()), and OBDDataReader/<>c.<Initialize>b__181_0
        // (0x06002894, bool instance(string)), the ECU certificate predicate.
        rewriteBoolean(image, BODY, 0x00043013, 124);
        rewriteBoolean(image, 0x1a46ec, 0x00023013, 115);
        byte[] nativeImage = aot.clone();
        for (int offset : new int[] {0x238a00, 0x6aff20}) {
            putInt(nativeImage, offset, 0x52800020); // mov w0, #1
            putInt(nativeImage, offset + 4, 0xd65f03c0); // ret, before any stack changes
        }
        byte[] nativeGuard = guard.clone();
        putInt(nativeGuard, 0x2abf0, 0xd65f03c0); // return before scheduling _exit

        // Store supports plain PE images as well as XALZ. Keep every other image
        // byte-for-byte; replace this block with MZ and shift later descriptors.
        // Keep the relocated ELF64 section-header table aligned to eight bytes.
        int padding = (size - image.length) & 7;
        int delta = image.length + padding - size;
        byte[] result = new byte[Math.addExact(store.length, delta)];
        System.arraycopy(store, 0, result, 0, start);
        System.arraycopy(image, 0, result, start, image.length);
        System.arraycopy(store, start + size, result, start + image.length + padding, store.length - start - size);
        int end = start + size;
        for (int i = 0; i < 216; i++) {
            int d = DESCRIPTORS + i * 28;
            for (int offsetField : new int[] {4, 12, 20}) {
                int offset = integer(store, d + offsetField);
                if (offset != 0 && PAYLOAD + offset >= end)
                    putInt(result, d + offsetField, Math.addExact(offset, delta));
            }
        }
        putInt(result, descriptor + 8, image.length);
        long oldHeaders = longInteger(store, 40);
        int newHeaders = Math.toIntExact(oldHeaders + delta);
        putLong(result, 40, newHeaders);
        int payloadSections = 0;
        int count = Short.toUnsignedInt(buffer(store).getShort(60));
        for (int i = 0; i < count; i++) {
            int original = Math.toIntExact(oldHeaders) + i * 64;
            int updated = newHeaders + i * 64;
            long offset = longInteger(store, original + 24);
            long length = longInteger(store, original + 32);
            if (offset == PAYLOAD) {
                check(offset + length >= end && integer(store, original + 4) == 1
                    && longInteger(store, original + 8) == 0, "Payload must be non-allocated PROGBITS");
                putLong(result, updated + 32, length + delta);
                payloadSections++;
            } else if (offset >= end) {
                putLong(result, updated + 24, offset + delta);
            }
        }
        check(payloadSections == 1, "Expected one ELF payload section");
        check(result[start] == 'M' && result[start + 1] == 'Z', "Rebuilt image missing");
        return new Result(result, nativeImage, nativeGuard);
    }

    public static final String GUARD_ENTRY = "lib/arm64-v8a/libusbtransport.so";

    /** Preserves the original settings and profile transforms' normal seeds after repackaging. */
    public static byte[] patchDecoder(byte[] original) {
        requireHash(original, "2c68f2179bc348ea18bd7e40ba18fb2c21a1b6d77cb98959387994336f2765c5",
            "profile decoder (unsupported or already modified)");
        // n7q3v1 -> variant-2 seed initializer at VA/file offset 0x25540.
        // csel w8,w9,w8,ne chooses 0xec225c72 on context validation success,
        // 0x9dac8f86 on failure. Downstream mixing yields seed 0 or 0x143a.
        check(integer(original, 0x25d68) == 0x1a881128, "Unexpected profile seed selection");
        // GetShiftStream uses variant 1 for both settings reads and writes.
        // Its initializer at 0x230fc has a separate validation-dependent seed.
        check(integer(original, 0x23fcc) == 0x1a881128, "Unexpected settings seed selection");
        byte[] result = original.clone();
        putInt(result, 0x25d68, 0x2a0903e8); // mov w8,w9: normal seed; transform stays intact
        putInt(result, 0x23fcc, 0x2a0903e8); // same selection for settings, not just profiles
        return result;
    }

    public static final class Result {
        private final byte[] store, aot, guard;
        private Result(byte[] store, byte[] aot, byte[] guard) {
            this.store = store;
            this.aot = aot;
            this.guard = guard;
        }
        public byte[] store() { return store; }
        public byte[] aot() { return aot; }
        public byte[] guard() { return guard; }
    }

    private static void rewriteBoolean(byte[] image, int body, int header, int length) {
        check(integer(image, body) == header && integer(image, body + 4) == length
            && integer(image, body + 8) == 0, "Unexpected managed method body");
        Arrays.fill(image, body + 12, body + 12 + length, (byte) 0);
        image[body + 12] = 0x17;
        image[body + 13] = 0x2a;
    }

    static int integer(byte[] bytes, int offset) { return buffer(bytes).getInt(offset); }
    private static long longInteger(byte[] bytes, int offset) { return buffer(bytes).getLong(offset); }
    private static void putInt(byte[] bytes, int offset, int value) { buffer(bytes).putInt(offset, value); }
    private static void putLong(byte[] bytes, int offset, long value) { buffer(bytes).putLong(offset, value); }
    private static ByteBuffer buffer(byte[] bytes) { return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN); }
    private static void requireHash(byte[] bytes, String expected, String label) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
            StringBuilder actual = new StringBuilder();
            for (byte value : digest) actual.append(String.format("%02x", value & 255));
            check(expected.equals(actual.toString()), "Unexpected " + label);
        } catch (java.security.NoSuchAlgorithmException exception) { throw new IllegalStateException(exception); }
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new IllegalStateException("Car Scanner 2.2.21: " + message);
    }
}
