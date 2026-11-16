package app.morphed.extension.twitch.vpn.crypto;

/** BLAKE2s (RFC 7693), keyed or not, and the HMAC / HKDF WireGuard builds on it. */
public final class Blake2s {
    private static final int[] IV = {
            0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19};
    private static final byte[][] SIGMA = {
            {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
            {14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3},
            {11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4},
            {7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8},
            {9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13},
            {2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9},
            {12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11},
            {13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10},
            {6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5},
            {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0}};

    private final int[] h = new int[8];
    private final byte[] buffer = new byte[64];
    private int bufferLength;
    private long counter;
    private final int outLength;
    private final int[] v = new int[16], m = new int[16];

    public Blake2s(int outLength, byte[] key) {
        int keyLength = key == null ? 0 : key.length;
        if (outLength < 1 || outLength > 32 || keyLength > 32) throw new IllegalArgumentException();
        this.outLength = outLength;
        System.arraycopy(IV, 0, h, 0, 8);
        h[0] ^= 0x01010000 ^ (keyLength << 8) ^ outLength;
        if (keyLength > 0) {
            System.arraycopy(key, 0, buffer, 0, keyLength);
            bufferLength = 64;
        }
    }

    public Blake2s update(byte[] data) {
        return update(data, 0, data.length);
    }

    public Blake2s update(byte[] data, int offset, int length) {
        for (int i = 0; i < length; i++) {
            if (bufferLength == 64) {
                counter += 64;
                compress(false);
                bufferLength = 0;
            }
            buffer[bufferLength++] = data[offset + i];
        }
        return this;
    }

    public byte[] digest() {
        counter += bufferLength;
        for (int i = bufferLength; i < 64; i++) buffer[i] = 0;
        compress(true);
        byte[] out = new byte[outLength];
        for (int i = 0; i < outLength; i++) out[i] = (byte) (h[i >> 2] >>> (8 * (i & 3)));
        return out;
    }

    private void compress(boolean last) {
        for (int i = 0; i < 16; i++) {
            m[i] = (buffer[4 * i] & 0xff) | (buffer[4 * i + 1] & 0xff) << 8 | (buffer[4 * i + 2] & 0xff) << 16
                    | (buffer[4 * i + 3] & 0xff) << 24;
        }
        System.arraycopy(h, 0, v, 0, 8);
        System.arraycopy(IV, 0, v, 8, 8);
        v[12] ^= (int) counter;
        v[13] ^= (int) (counter >>> 32);
        if (last) v[14] = ~v[14];
        for (int round = 0; round < 10; round++) {
            byte[] s = SIGMA[round];
            g(0, 4, 8, 12, m[s[0]], m[s[1]]);
            g(1, 5, 9, 13, m[s[2]], m[s[3]]);
            g(2, 6, 10, 14, m[s[4]], m[s[5]]);
            g(3, 7, 11, 15, m[s[6]], m[s[7]]);
            g(0, 5, 10, 15, m[s[8]], m[s[9]]);
            g(1, 6, 11, 12, m[s[10]], m[s[11]]);
            g(2, 7, 8, 13, m[s[12]], m[s[13]]);
            g(3, 4, 9, 14, m[s[14]], m[s[15]]);
        }
        for (int i = 0; i < 8; i++) h[i] ^= v[i] ^ v[i + 8];
    }

    private void g(int a, int b, int c, int d, int x, int y) {
        v[a] = v[a] + v[b] + x;
        v[d] = Integer.rotateRight(v[d] ^ v[a], 16);
        v[c] = v[c] + v[d];
        v[b] = Integer.rotateRight(v[b] ^ v[c], 12);
        v[a] = v[a] + v[b] + y;
        v[d] = Integer.rotateRight(v[d] ^ v[a], 8);
        v[c] = v[c] + v[d];
        v[b] = Integer.rotateRight(v[b] ^ v[c], 7);
    }

    // --- WireGuard's uses

    public static byte[] hash(byte[]... parts) {
        Blake2s b = new Blake2s(32, null);
        for (byte[] part : parts) b.update(part);
        return b.digest();
    }

    /** Keyed BLAKE2s with a 16-byte result (WireGuard's MAC). */
    public static byte[] mac(byte[] key, byte[] data, int length) {
        return new Blake2s(16, key).update(data, 0, length).digest();
    }

    public static byte[] hmac(byte[] key, byte[]... parts) {
        byte[] k = new byte[64];
        byte[] keyBytes = key.length > 64 ? hash(key) : key;
        System.arraycopy(keyBytes, 0, k, 0, keyBytes.length);
        byte[] inner = new byte[64], outer = new byte[64];
        for (int i = 0; i < 64; i++) {
            inner[i] = (byte) (k[i] ^ 0x36);
            outer[i] = (byte) (k[i] ^ 0x5c);
        }
        Blake2s in = new Blake2s(32, null).update(inner);
        for (byte[] part : parts) in.update(part);
        return new Blake2s(32, null).update(outer).update(in.digest()).digest();
    }

    /** WireGuard's KDF: n 32-byte keys from a chaining key and input. */
    public static byte[][] kdf(int n, byte[] key, byte[] input) {
        byte[] prk = hmac(key, input);
        byte[][] out = new byte[n][];
        byte[] previous = new byte[0];
        for (int i = 0; i < n; i++) {
            previous = hmac(prk, previous, new byte[]{(byte) (i + 1)});
            out[i] = previous;
        }
        return out;
    }
}
