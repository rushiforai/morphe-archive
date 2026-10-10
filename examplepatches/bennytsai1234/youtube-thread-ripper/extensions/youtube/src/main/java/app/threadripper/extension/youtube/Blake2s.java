package app.threadripper.extension.youtube;

/**
 * BLAKE2s (RFC 7693) for WireGuard: plain and keyed hashing with 16 or 32 byte output, and
 * HMAC-BLAKE2s. Android has no BLAKE2s provider.
 */
final class Blake2s {
    private static final int[] IV = {
            0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19,
    };

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
            {10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0},
    };

    private final int[] h = new int[8];
    private final int[] v = new int[16];
    private final int[] m = new int[16];
    private final byte[] block = new byte[64];
    private final int outLen;
    private int blockLen;
    private long total;

    private Blake2s(int outLen, byte[] key) {
        this.outLen = outLen;
        System.arraycopy(IV, 0, h, 0, 8);
        int keyLen = key == null ? 0 : key.length;
        h[0] ^= 0x01010000 ^ (keyLen << 8) ^ outLen;
        if (keyLen > 0) {
            System.arraycopy(key, 0, block, 0, keyLen);
            blockLen = 64;
        }
    }

    /** BLAKE2s-256 of the concatenated inputs. */
    static byte[] hash(byte[]... inputs) {
        Blake2s b = new Blake2s(32, null);
        for (byte[] in : inputs) b.update(in, 0, in.length);
        return b.digest();
    }

    /** Keyed BLAKE2s with 16 byte output (WireGuard's MAC). */
    static byte[] mac(byte[] key, byte[] in, int off, int len) {
        Blake2s b = new Blake2s(16, key);
        b.update(in, off, len);
        return b.digest();
    }

    /** HMAC-BLAKE2s-256 (WireGuard's KDF building block); key is at most 64 bytes. */
    static byte[] hmac(byte[] key, byte[]... inputs) {
        byte[] ipad = new byte[64];
        byte[] opad = new byte[64];
        for (int i = 0; i < 64; i++) {
            byte k = i < key.length ? key[i] : 0;
            ipad[i] = (byte) (k ^ 0x36);
            opad[i] = (byte) (k ^ 0x5c);
        }
        Blake2s inner = new Blake2s(32, null);
        inner.update(ipad, 0, 64);
        for (byte[] in : inputs) inner.update(in, 0, in.length);
        byte[] innerHash = inner.digest();
        Blake2s outer = new Blake2s(32, null);
        outer.update(opad, 0, 64);
        outer.update(innerHash, 0, 32);
        return outer.digest();
    }

    private void update(byte[] in, int off, int len) {
        while (len > 0) {
            // The last block is compressed in digest() with the final flag, so only compress a full
            // block when more input follows.
            if (blockLen == 64) {
                total += 64;
                compress(false);
                blockLen = 0;
            }
            int n = Math.min(64 - blockLen, len);
            System.arraycopy(in, off, block, blockLen, n);
            blockLen += n;
            off += n;
            len -= n;
        }
    }

    private byte[] digest() {
        total += blockLen;
        for (int i = blockLen; i < 64; i++) block[i] = 0;
        compress(true);
        byte[] out = new byte[outLen];
        for (int i = 0; i < outLen; i++) out[i] = (byte) (h[i >> 2] >>> (8 * (i & 3)));
        return out;
    }

    private void compress(boolean last) {
        for (int i = 0; i < 16; i++) {
            int j = i * 4;
            m[i] = (block[j] & 0xff) | (block[j + 1] & 0xff) << 8 | (block[j + 2] & 0xff) << 16 | (block[j + 3] & 0xff) << 24;
        }
        System.arraycopy(h, 0, v, 0, 8);
        System.arraycopy(IV, 0, v, 8, 8);
        v[12] ^= (int) total;
        v[13] ^= (int) (total >>> 32);
        if (last) v[14] = ~v[14];
        for (byte[] s : SIGMA) {
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
        v[a] += v[b] + x;
        v[d] = Integer.rotateRight(v[d] ^ v[a], 16);
        v[c] += v[d];
        v[b] = Integer.rotateRight(v[b] ^ v[c], 12);
        v[a] += v[b] + y;
        v[d] = Integer.rotateRight(v[d] ^ v[a], 8);
        v[c] += v[d];
        v[b] = Integer.rotateRight(v[b] ^ v[c], 7);
    }
}
