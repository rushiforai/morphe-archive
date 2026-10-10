package app.threadripper.extension.youtube;

import java.math.BigInteger;
import java.security.SecureRandom;

/**
 * X25519 (RFC 7748) with BigInteger arithmetic. Android only has an XDH provider from API 33, and
 * WireGuard needs a few of these per handshake (one handshake every two minutes), so speed does
 * not matter. Not constant time; the keys only protect this app's own WARP traffic.
 */
final class X25519 {
    private static final BigInteger P = BigInteger.ONE.shiftLeft(255).subtract(BigInteger.valueOf(19));
    private static final BigInteger A24 = BigInteger.valueOf(121665);
    private static final BigInteger P_MINUS_2 = P.subtract(BigInteger.valueOf(2));
    private static final byte[] BASE = new byte[32];
    private static final SecureRandom RANDOM = new SecureRandom();

    static {
        BASE[0] = 9;
    }

    private X25519() {
    }

    static byte[] generatePrivateKey() {
        byte[] k = new byte[32];
        RANDOM.nextBytes(k);
        k[0] &= (byte) 248;
        k[31] &= 127;
        k[31] |= 64;
        return k;
    }

    static byte[] publicKey(byte[] privateKey) {
        return scalarMult(privateKey, BASE);
    }

    static byte[] sharedSecret(byte[] privateKey, byte[] publicKey) {
        return scalarMult(privateKey, publicKey);
    }

    private static byte[] scalarMult(byte[] scalar, byte[] point) {
        byte[] k = scalar.clone();
        k[0] &= (byte) 248;
        k[31] &= 127;
        k[31] |= 64;
        byte[] u = point.clone();
        u[31] &= 127;
        BigInteger x1 = decode(u);
        BigInteger x2 = BigInteger.ONE, z2 = BigInteger.ZERO, x3 = x1, z3 = BigInteger.ONE;
        int swap = 0;
        for (int t = 254; t >= 0; t--) {
            int bit = (k[t >>> 3] >>> (t & 7)) & 1;
            swap ^= bit;
            if (swap == 1) {
                BigInteger tmp = x2; x2 = x3; x3 = tmp;
                tmp = z2; z2 = z3; z3 = tmp;
            }
            swap = bit;
            BigInteger a = x2.add(z2).mod(P);
            BigInteger aa = a.multiply(a).mod(P);
            BigInteger b = x2.subtract(z2).mod(P);
            BigInteger bb = b.multiply(b).mod(P);
            BigInteger e = aa.subtract(bb).mod(P);
            BigInteger c = x3.add(z3).mod(P);
            BigInteger d = x3.subtract(z3).mod(P);
            BigInteger da = d.multiply(a).mod(P);
            BigInteger cb = c.multiply(b).mod(P);
            BigInteger sum = da.add(cb).mod(P);
            BigInteger diff = da.subtract(cb).mod(P);
            x3 = sum.multiply(sum).mod(P);
            z3 = x1.multiply(diff.multiply(diff)).mod(P);
            x2 = aa.multiply(bb).mod(P);
            z2 = e.multiply(aa.add(A24.multiply(e))).mod(P);
        }
        if (swap == 1) {
            x2 = x3;
            z2 = z3;
        }
        return encode(x2.multiply(z2.modPow(P_MINUS_2, P)).mod(P));
    }

    /** Little-endian bytes to an unsigned number. */
    private static BigInteger decode(byte[] le) {
        byte[] be = new byte[33];
        for (int i = 0; i < 32; i++) be[32 - i] = le[i];
        return new BigInteger(be);
    }

    private static byte[] encode(BigInteger n) {
        byte[] be = n.toByteArray();
        byte[] le = new byte[32];
        for (int i = 0; i < 32 && i < be.length; i++) le[i] = be[be.length - 1 - i];
        return le;
    }
}
