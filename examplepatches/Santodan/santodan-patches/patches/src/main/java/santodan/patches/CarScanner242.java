package santodan.patches;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.MessageDigest;
import java.util.Arrays;

/** Exact 2.2.42 IL/AOT premium and repackaging compatibility transformation. */
public final class CarScanner242 {
    public static final String ENTRY = "lib/x86_64/libassembly-store.so";
    public static final String AOT_ENTRY = "lib/x86_64/libaot-CarScannerMaui.dll.so";
    public static final String DECODER_ENTRY = "lib/x86_64/libvndctx.so";
    private static final int PAYLOAD = 16384;
    private static final int DESCRIPTORS = PAYLOAD + 20 + 5616;
    private static final int TARGET = 192;
    private static final int BODY = 0x9d718;
    private CarScanner242() {}

    public static Result patch(byte[] store, byte[] aot, byte[] guard) {
        requireHash(store, "c335a31f92a2e65d33cee39841c57214d3bded10f1d54d0921b04c22dbcff1ad", "assembly store (unsupported or already modified)");
        requireHash(aot, "1647f3bc6e1f781dbaaae7037d88cbf97742b4729917cde5a388902567183b83", "AOT image");
        requireHash(guard, "b7d613318de8e9c235cdbcc49aa2af8b3757919aabfbf0341caa03576850c47c", "integrity library");
        // Mono format 187 x86_64 uses five-byte CALL entries (MethodDef row - 1).
        checkBytes(aot, 0x1817ddf, "e89c669efe"); // -> VA 0x206480, file 0x202480
        checkBytes(aot, 0x181dd98, "e82378e3fe"); // -> VA 0x65d5c0, file 0x6595c0
        checkBytes(aot, 0x202480, "4883ec484c893c24");
        checkBytes(aot, 0x6595c0, "4883ec184c893c24");
        // Failure-only scheduler; worker sleeps then calls _exit(0).
        checkBytes(guard, 0x2c170, "4156534881ecb8130000");
        check(integer(store, PAYLOAD) == 0x41424158 && integer(store, PAYLOAD + 4) == 0x80030003,
            "Unexpected XABA format");
        int descriptor = DESCRIPTORS + TARGET * 28;
        int start = PAYLOAD + integer(store, descriptor + 4);
        int size = integer(store, descriptor + 8);
        check(start == 9831424 && size == 25113624 && integer(store, descriptor) == TARGET,
            "Unexpected assembly descriptor");
        // XALZ compression descriptor index is independent of XABA's sorted index.
        check(integer(store, start) == 0x5a4c4158 && integer(store, start + 4) == 123,
            "Unexpected XALZ header");
        byte[] image = CarScannerAssemblyStore.decodeLz4(store, start + 12, start + size, integer(store, start + 8));
        requireHash(image, "13ed668f0e5c13228fbdbe8c93a4defd45b79bcecc62500f020003121cdd5801", "CarScannerMaui.dll");
        // Exact MethodDefs: SharedSettings.get_AdsProductPurchased (0x060015dc,
        // bool instance()), and OBDDataReader/<>c.<Initialize>b__181_0
        // (0x06002901, bool instance(string)), the ECU certificate predicate.
        rewriteBoolean(image, BODY, 0x00043013, 124);
        rewriteBoolean(image, 0x1a94b0, 0x00023013, 115);
        byte[] nativeImage = aot.clone();
        for (int offset : new int[] {0x202480, 0x6595c0})
            writeBytes(nativeImage, offset, "b801000000c3"); // mov eax,1; ret before stack changes
        byte[] nativeGuard = guard.clone();
        nativeGuard[0x2c170] = (byte) 0xc3; // return before scheduling _exit

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

    public static final String GUARD_ENTRY = "lib/x86_64/libusbtransport.so";

    /** Preserve seed zero for native settings (variant 1) and profiles (variant 2). */
    public static byte[] patchDecoder(byte[] original) {
        requireHash(original, "1200790584238e24822b4075cd1f768f50932ae4ba99aa852a758f3d7fdd4c7d",
            "settings/profile decoder (unsupported or already modified)");
        // Decoder VAs equal file offsets. Variant 1's paths converge here.
        // The normal input makes this multiply produce 0x162f2a9e; the following
        // XOR then yields zero and the untouched mixing stores normal seed zero.
        checkBytes(original, 0x225ba, "69c877caeb8531c081f19e2a2f16");
        // Variant 2: select the native success constant regardless of validation.
        checkBytes(original, 0x25733, "b9725c22ecb8868fac9d0f45c1");
        byte[] result = original.clone();
        writeBytes(result, 0x225ba, "b99e2a2f1690"); // mov ecx,0x162f2a9e; nop
        writeBytes(result, 0x2573d, "89c890"); // mov eax,ecx; nop
        return result;
    }

    private static void checkBytes(byte[] bytes, int offset, String hex) {
        byte[] expected = hexBytes(hex);
        check(Arrays.equals(expected, Arrays.copyOfRange(bytes, offset, offset + expected.length)),
            "Unexpected native instruction at " + Integer.toHexString(offset));
    }

    private static void writeBytes(byte[] bytes, int offset, String hex) {
        byte[] replacement = hexBytes(hex);
        System.arraycopy(replacement, 0, bytes, offset, replacement.length);
    }

    static byte[] hexBytes(String hex) {
        byte[] result = new byte[hex.length() / 2];
        for (int i = 0; i < result.length; i++)
            result[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
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
        if (!condition) throw new IllegalStateException("Car Scanner 2.2.42: " + message);
    }
}
