package app.morphed.extension.twitch.vpn.crypto;

import java.security.SecureRandom;

/** Curve25519 Diffie-Hellman (RFC 7748), after TweetNaCl: constant time, 16 limbs of 16 bits. */
public final class X25519 {
    private static final long[] A24 = {0xDB41, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    private static final byte[] BASE = new byte[32];

    static {
        BASE[0] = 9;
    }

    private X25519() {
    }

    public static byte[] generatePrivateKey(SecureRandom random) {
        byte[] key = new byte[32];
        random.nextBytes(key);
        key[0] &= (byte) 248;
        key[31] &= 127;
        key[31] |= 64;
        return key;
    }

    public static byte[] publicKey(byte[] privateKey) {
        return scalarMult(privateKey, BASE);
    }

    /** The shared secret of a private key and a peer's public key. */
    public static byte[] scalarMult(byte[] scalar, byte[] point) {
        byte[] z = new byte[32];
        System.arraycopy(scalar, 0, z, 0, 32);
        z[31] = (byte) ((scalar[31] & 127) | 64);
        z[0] &= (byte) 248;
        long[] x = new long[16];
        unpack(x, point);
        long[] a = new long[16], b = new long[16], c = new long[16], d = new long[16], e = new long[16], f = new long[16];
        System.arraycopy(x, 0, b, 0, 16);
        a[0] = 1;
        d[0] = 1;
        for (int i = 254; i >= 0; --i) {
            int r = ((z[i >>> 3] & 0xff) >>> (i & 7)) & 1;
            select(a, b, r);
            select(c, d, r);
            add(e, a, c);
            sub(a, a, c);
            add(c, b, d);
            sub(b, b, d);
            mul(d, e, e);
            mul(f, a, a);
            mul(a, c, a);
            mul(c, b, e);
            add(e, a, c);
            sub(a, a, c);
            mul(b, a, a);
            sub(c, d, f);
            mul(a, c, A24);
            add(a, a, d);
            mul(c, c, a);
            mul(a, d, f);
            mul(d, b, x);
            mul(b, e, e);
            select(a, b, r);
            select(c, d, r);
        }
        invert(c, c);
        mul(a, a, c);
        byte[] out = new byte[32];
        pack(out, a);
        return out;
    }

    private static void carry(long[] o) {
        for (int i = 0; i < 16; i++) {
            o[i] += 1L << 16;
            long c = o[i] >> 16;
            if (i < 15) o[i + 1] += c - 1;
            else o[0] += 38 * (c - 1);
            o[i] -= c << 16;
        }
    }

    private static void select(long[] p, long[] q, int b) {
        long c = ~(b - 1L);
        for (int i = 0; i < 16; i++) {
            long t = c & (p[i] ^ q[i]);
            p[i] ^= t;
            q[i] ^= t;
        }
    }

    private static void pack(byte[] o, long[] n) {
        long[] m = new long[16], t = new long[16];
        System.arraycopy(n, 0, t, 0, 16);
        carry(t);
        carry(t);
        carry(t);
        for (int j = 0; j < 2; j++) {
            m[0] = t[0] - 0xffed;
            for (int i = 1; i < 15; i++) {
                m[i] = t[i] - 0xffff - ((m[i - 1] >> 16) & 1);
                m[i - 1] &= 0xffff;
            }
            m[15] = t[15] - 0x7fff - ((m[14] >> 16) & 1);
            int b = (int) ((m[15] >> 16) & 1);
            m[14] &= 0xffff;
            select(t, m, 1 - b);
        }
        for (int i = 0; i < 16; i++) {
            o[2 * i] = (byte) t[i];
            o[2 * i + 1] = (byte) (t[i] >> 8);
        }
    }

    private static void unpack(long[] o, byte[] n) {
        for (int i = 0; i < 16; i++) o[i] = (n[2 * i] & 0xff) + ((long) (n[2 * i + 1] & 0xff) << 8);
        o[15] &= 0x7fff;
    }

    private static void add(long[] o, long[] a, long[] b) {
        for (int i = 0; i < 16; i++) o[i] = a[i] + b[i];
    }

    private static void sub(long[] o, long[] a, long[] b) {
        for (int i = 0; i < 16; i++) o[i] = a[i] - b[i];
    }

    private static void mul(long[] o, long[] a, long[] b) {
        long[] t = new long[31];
        for (int i = 0; i < 16; i++) for (int j = 0; j < 16; j++) t[i + j] += a[i] * b[j];
        for (int i = 0; i < 15; i++) t[i] += 38 * t[i + 16];
        System.arraycopy(t, 0, o, 0, 16);
        carry(o);
        carry(o);
    }

    private static void invert(long[] o, long[] i) {
        long[] c = new long[16];
        System.arraycopy(i, 0, c, 0, 16);
        for (int a = 253; a >= 0; a--) {
            mul(c, c, c);
            if (a != 2 && a != 4) mul(c, c, i);
        }
        System.arraycopy(c, 0, o, 0, 16);
    }
}
