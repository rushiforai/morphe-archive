package app.morphed.extension.twitch.vpn.crypto;

import java.security.MessageDigest;

/**
 * ChaCha20-Poly1305 (RFC 8439) with WireGuard's nonces (a 64-bit counter), and XChaCha20-Poly1305 for its cookie
 * replies. Allocation-light: the tunnel encrypts and decrypts every packet with it.
 */
public final class ChaChaPoly {
    public static final int TAG = 16;

    private ChaChaPoly() {
    }

    private static int load(byte[] b, int at) {
        return (b[at] & 0xff) | (b[at + 1] & 0xff) << 8 | (b[at + 2] & 0xff) << 16 | (b[at + 3] & 0xff) << 24;
    }

    private static void store(byte[] b, int at, int v) {
        b[at] = (byte) v;
        b[at + 1] = (byte) (v >>> 8);
        b[at + 2] = (byte) (v >>> 16);
        b[at + 3] = (byte) (v >>> 24);
    }

    private static void rounds(int[] x) {
        for (int i = 0; i < 10; i++) {
            quarter(x, 0, 4, 8, 12);
            quarter(x, 1, 5, 9, 13);
            quarter(x, 2, 6, 10, 14);
            quarter(x, 3, 7, 11, 15);
            quarter(x, 0, 5, 10, 15);
            quarter(x, 1, 6, 11, 12);
            quarter(x, 2, 7, 8, 13);
            quarter(x, 3, 4, 9, 14);
        }
    }

    private static void quarter(int[] x, int a, int b, int c, int d) {
        x[a] += x[b];
        x[d] = Integer.rotateLeft(x[d] ^ x[a], 16);
        x[c] += x[d];
        x[b] = Integer.rotateLeft(x[b] ^ x[c], 12);
        x[a] += x[b];
        x[d] = Integer.rotateLeft(x[d] ^ x[a], 8);
        x[c] += x[d];
        x[b] = Integer.rotateLeft(x[b] ^ x[c], 7);
    }

    private static int[] initial(byte[] key, int counter, byte[] nonce12) {
        int[] s = new int[16];
        s[0] = 0x61707865;
        s[1] = 0x3320646e;
        s[2] = 0x79622d32;
        s[3] = 0x6b206574;
        for (int i = 0; i < 8; i++) s[4 + i] = load(key, 4 * i);
        s[12] = counter;
        s[13] = load(nonce12, 0);
        s[14] = load(nonce12, 4);
        s[15] = load(nonce12, 8);
        return s;
    }

    /** XORs the ChaCha20 keystream (from block counter) into data[offset, offset+length) -> out[outOffset...]. */
    static void xor(byte[] key, byte[] nonce12, int counter, byte[] data, int offset, int length, byte[] out, int outOffset) {
        int[] state = initial(key, counter, nonce12);
        int[] x = new int[16];
        byte[] block = new byte[64];
        for (int done = 0; done < length; done += 64) {
            System.arraycopy(state, 0, x, 0, 16);
            rounds(x);
            for (int i = 0; i < 16; i++) store(block, 4 * i, x[i] + state[i]);
            int n = Math.min(64, length - done);
            for (int i = 0; i < n; i++) out[outOffset + done + i] = (byte) (data[offset + done + i] ^ block[i]);
            state[12]++;
        }
    }

    /** WireGuard's nonce: four zero bytes, then the 64-bit counter, little-endian. */
    public static byte[] nonce(long counter) {
        byte[] nonce = new byte[12];
        for (int i = 0; i < 8; i++) nonce[4 + i] = (byte) (counter >>> (8 * i));
        return nonce;
    }

    /** plaintext -> ciphertext || tag, written to out at outOffset. */
    public static void seal(byte[] key, byte[] nonce12, byte[] aad, byte[] in, int offset, int length, byte[] out, int outOffset) {
        xor(key, nonce12, 1, in, offset, length, out, outOffset);
        byte[] tag = tag(key, nonce12, aad, out, outOffset, length);
        System.arraycopy(tag, 0, out, outOffset + length, TAG);
    }

    public static byte[] seal(byte[] key, byte[] nonce12, byte[] aad, byte[] plaintext) {
        byte[] out = new byte[plaintext.length + TAG];
        seal(key, nonce12, aad, plaintext, 0, plaintext.length, out, 0);
        return out;
    }

    /** ciphertext || tag -> plaintext into out; false when the tag doesn't match (nothing trustworthy written). */
    public static boolean open(byte[] key, byte[] nonce12, byte[] aad, byte[] in, int offset, int length, byte[] out, int outOffset) {
        if (length < TAG) return false;
        int body = length - TAG;
        byte[] expected = tag(key, nonce12, aad, in, offset, body);
        byte[] given = new byte[TAG];
        System.arraycopy(in, offset + body, given, 0, TAG);
        if (!MessageDigest.isEqual(expected, given)) return false;
        xor(key, nonce12, 1, in, offset, body, out, outOffset);
        return true;
    }

    public static byte[] open(byte[] key, byte[] nonce12, byte[] aad, byte[] sealed) {
        if (sealed.length < TAG) return null;
        byte[] out = new byte[sealed.length - TAG];
        return open(key, nonce12, aad, sealed, 0, sealed.length, out, 0) ? out : null;
    }

    private static byte[] tag(byte[] key, byte[] nonce12, byte[] aad, byte[] cipher, int offset, int length) {
        byte[] polyKey = new byte[32];
        xor(key, nonce12, 0, new byte[32], 0, 32, polyKey, 0);
        Poly1305 poly = new Poly1305(polyKey);
        int aadLength = aad == null ? 0 : aad.length;
        if (aadLength > 0) poly.update(aad, 0, aadLength);
        poly.pad();
        poly.update(cipher, offset, length);
        poly.pad();
        byte[] lengths = new byte[16];
        for (int i = 0; i < 8; i++) {
            lengths[i] = (byte) ((long) aadLength >>> (8 * i));
            lengths[8 + i] = (byte) ((long) length >>> (8 * i));
        }
        poly.update(lengths, 0, 16);
        return poly.finish();
    }

    /** HChaCha20: a subkey from a key and the first 16 bytes of an XChaCha nonce. */
    static byte[] hchacha(byte[] key, byte[] nonce16) {
        int[] x = new int[16];
        x[0] = 0x61707865;
        x[1] = 0x3320646e;
        x[2] = 0x79622d32;
        x[3] = 0x6b206574;
        for (int i = 0; i < 8; i++) x[4 + i] = load(key, 4 * i);
        for (int i = 0; i < 4; i++) x[12 + i] = load(nonce16, 4 * i);
        rounds(x);
        byte[] out = new byte[32];
        for (int i = 0; i < 4; i++) store(out, 4 * i, x[i]);
        for (int i = 0; i < 4; i++) store(out, 16 + 4 * i, x[12 + i]);
        return out;
    }

    /** XChaCha20-Poly1305 open (24-byte nonce), for WireGuard's cookie replies. */
    public static byte[] xopen(byte[] key, byte[] nonce24, byte[] aad, byte[] sealed) {
        byte[] first = new byte[16];
        System.arraycopy(nonce24, 0, first, 0, 16);
        byte[] subkey = hchacha(key, first);
        byte[] nonce = new byte[12];
        System.arraycopy(nonce24, 16, nonce, 4, 8);
        return open(subkey, nonce, aad, sealed);
    }

    /** Poly1305 with 26-bit limbs (poly1305-donna, 32-bit). */
    static final class Poly1305 {
        private final int r0, r1, r2, r3, r4, s1, s2, s3, s4;
        private final int pad0, pad1, pad2, pad3;
        private int h0, h1, h2, h3, h4;
        private final byte[] block = new byte[16];
        private int blockLength;

        Poly1305(byte[] key) {
            int t0 = load(key, 0), t1 = load(key, 4), t2 = load(key, 8), t3 = load(key, 12);
            r0 = t0 & 0x3ffffff;
            r1 = ((t0 >>> 26) | (t1 << 6)) & 0x3ffff03;
            r2 = ((t1 >>> 20) | (t2 << 12)) & 0x3ffc0ff;
            r3 = ((t2 >>> 14) | (t3 << 18)) & 0x3f03fff;
            r4 = (t3 >>> 8) & 0x00fffff;
            s1 = r1 * 5;
            s2 = r2 * 5;
            s3 = r3 * 5;
            s4 = r4 * 5;
            pad0 = load(key, 16);
            pad1 = load(key, 20);
            pad2 = load(key, 24);
            pad3 = load(key, 28);
        }

        void update(byte[] data, int offset, int length) {
            for (int i = 0; i < length; i++) {
                block[blockLength++] = data[offset + i];
                if (blockLength == 16) {
                    processBlock(block, 1 << 24);
                    blockLength = 0;
                }
            }
        }

        /** Zero-pads to a 16-byte boundary (the AEAD's padding). */
        void pad() {
            if (blockLength == 0) return;
            for (int i = blockLength; i < 16; i++) block[i] = 0;
            processBlock(block, 1 << 24);
            blockLength = 0;
        }

        private void processBlock(byte[] m, int hibit) {
            int t0 = load(m, 0), t1 = load(m, 4), t2 = load(m, 8), t3 = load(m, 12);
            h0 += t0 & 0x3ffffff;
            h1 += ((t0 >>> 26) | (t1 << 6)) & 0x3ffffff;
            h2 += ((t1 >>> 20) | (t2 << 12)) & 0x3ffffff;
            h3 += ((t2 >>> 14) | (t3 << 18)) & 0x3ffffff;
            h4 += (t3 >>> 8) | hibit;
            long d0 = (long) h0 * r0 + (long) h1 * s4 + (long) h2 * s3 + (long) h3 * s2 + (long) h4 * s1;
            long d1 = (long) h0 * r1 + (long) h1 * r0 + (long) h2 * s4 + (long) h3 * s3 + (long) h4 * s2;
            long d2 = (long) h0 * r2 + (long) h1 * r1 + (long) h2 * r0 + (long) h3 * s4 + (long) h4 * s3;
            long d3 = (long) h0 * r3 + (long) h1 * r2 + (long) h2 * r1 + (long) h3 * r0 + (long) h4 * s4;
            long d4 = (long) h0 * r4 + (long) h1 * r3 + (long) h2 * r2 + (long) h3 * r1 + (long) h4 * r0;
            long c = d0 >>> 26;
            h0 = (int) d0 & 0x3ffffff;
            d1 += c;
            c = d1 >>> 26;
            h1 = (int) d1 & 0x3ffffff;
            d2 += c;
            c = d2 >>> 26;
            h2 = (int) d2 & 0x3ffffff;
            d3 += c;
            c = d3 >>> 26;
            h3 = (int) d3 & 0x3ffffff;
            d4 += c;
            c = d4 >>> 26;
            h4 = (int) d4 & 0x3ffffff;
            h0 += (int) (c * 5);
            c = h0 >>> 26;
            h0 &= 0x3ffffff;
            h1 += (int) c;
        }

        byte[] finish() {
            if (blockLength > 0) { // the last partial block: a 1 after it, no high bit
                block[blockLength] = 1;
                for (int i = blockLength + 1; i < 16; i++) block[i] = 0;
                processBlock(block, 0);
                blockLength = 0;
            }
            int c = h1 >>> 26;
            h1 &= 0x3ffffff;
            h2 += c;
            c = h2 >>> 26;
            h2 &= 0x3ffffff;
            h3 += c;
            c = h3 >>> 26;
            h3 &= 0x3ffffff;
            h4 += c;
            c = h4 >>> 26;
            h4 &= 0x3ffffff;
            h0 += c * 5;
            c = h0 >>> 26;
            h0 &= 0x3ffffff;
            h1 += c;
            int g0 = h0 + 5;
            c = g0 >>> 26;
            g0 &= 0x3ffffff;
            int g1 = h1 + c;
            c = g1 >>> 26;
            g1 &= 0x3ffffff;
            int g2 = h2 + c;
            c = g2 >>> 26;
            g2 &= 0x3ffffff;
            int g3 = h3 + c;
            c = g3 >>> 26;
            g3 &= 0x3ffffff;
            int g4 = h4 + c - (1 << 26);
            int mask = (g4 >>> 31) - 1; // all ones when h >= p: take g
            g0 &= mask;
            g1 &= mask;
            g2 &= mask;
            g3 &= mask;
            g4 &= mask;
            mask = ~mask;
            h0 = (h0 & mask) | g0;
            h1 = (h1 & mask) | g1;
            h2 = (h2 & mask) | g2;
            h3 = (h3 & mask) | g3;
            h4 = (h4 & mask) | g4;
            long f0 = ((h0) | (h1 << 26)) & 0xffffffffL;
            long f1 = ((h1 >>> 6) | (h2 << 20)) & 0xffffffffL;
            long f2 = ((h2 >>> 12) | (h3 << 14)) & 0xffffffffL;
            long f3 = ((h3 >>> 18) | (h4 << 8)) & 0xffffffffL;
            f0 += pad0 & 0xffffffffL;
            f1 += (pad1 & 0xffffffffL) + (f0 >>> 32);
            f2 += (pad2 & 0xffffffffL) + (f1 >>> 32);
            f3 += (pad3 & 0xffffffffL) + (f2 >>> 32);
            byte[] out = new byte[16];
            store(out, 0, (int) f0);
            store(out, 4, (int) f1);
            store(out, 8, (int) f2);
            store(out, 12, (int) f3);
            return out;
        }
    }
}
