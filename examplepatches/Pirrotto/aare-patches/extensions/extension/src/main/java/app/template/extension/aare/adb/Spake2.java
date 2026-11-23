package app.template.extension.aare.adb;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;

/**
 * SPAKE2 over Ed25519, exactly as BoringSSL's spake25519.cc (which adb's pairing uses), written
 * with plain BigInteger arithmetic: slow-ish but simple, and it only runs once per pairing.
 *
 * The points M and N are BoringSSL's: the first Ed25519 points found by hashing the seeds
 * "edwards25519 point generation seed (M)" / "(N)" with SHA-256.
 */
final class Spake2 {
    private static final BigInteger P = BigInteger.ONE.shiftLeft(255).subtract(BigInteger.valueOf(19));
    private static final BigInteger D = BigInteger.valueOf(-121665).multiply(BigInteger.valueOf(121666).modInverse(P)).mod(P);
    private static final BigInteger L = BigInteger.ONE.shiftLeft(252).add(new BigInteger("27742317777372353535851937790883648493"));
    private static final BigInteger TWO_D = D.shiftLeft(1).mod(P);
    private static final BigInteger SQRT_M1 = BigInteger.valueOf(2).modPow(P.subtract(BigInteger.ONE).shiftRight(2), P);

    private static final Point B = Point.affine(
            new BigInteger("15112221349535400772501151409588531511454012693041857206046113283949847762202"),
            new BigInteger("46316835694926478169428394003475163141307993866256225615783033603165251855960"));
    static final Point M = Point.affine(
            new BigInteger("456f78a904bd9c111e3b32bdd3a72c756c326f25ee4262ab40eef197c563a6c8", 16),
            new BigInteger("2ed1ee881b44cfcf538f47a347e3a1515c6b1c13326d62b6add9ddf64b7eda5a", 16));
    static final Point N = Point.affine(
            new BigInteger("6e5d004dea6d1a8ac201d18f13c844f59fbf3faeb3731e4410711743b3c51b20", 16),
            new BigInteger("78c73b69119a32710d68af06bddcbd3d107246b474feb5997a8e7de30adfe310", 16));

    private final boolean alice;
    private final byte[] myName, theirName;
    private BigInteger privateKey;
    private BigInteger passwordScalar;
    private byte[] passwordHash;
    private byte[] myMsg;

    Spake2(boolean alice, byte[] myName, byte[] theirName) {
        this.alice = alice;
        this.myName = myName.clone();
        this.theirName = theirName.clone();
    }

    byte[] generateMessage(byte[] password) throws Exception {
        byte[] random = new byte[64];
        new SecureRandom().nextBytes(random);
        return generateMessage(password, random);
    }

    /** With the 64 random bytes given, for tests. */
    byte[] generateMessage(byte[] password, byte[] random64) throws Exception {
        // x25519_sc_reduce, then left_shift_3 (times the cofactor, within 32 bytes).
        BigInteger reduced = littleEndian(random64).mod(L);
        privateKey = reduced.shiftLeft(3).mod(BigInteger.ONE.shiftLeft(256));
        Point p = B.multiply(privateKey);

        passwordHash = MessageDigest.getInstance("SHA-512").digest(password);
        BigInteger scalar = littleEndian(passwordHash).mod(L);
        // BoringSSL's fix for a missing left_shift_3: adds l, 2l, 4l to clear the low three bits.
        BigInteger order = L;
        for (int bit = 1; bit <= 4; bit <<= 1) {
            if (scalar.and(BigInteger.valueOf(bit)).signum() != 0) scalar = scalar.add(order);
            order = order.shiftLeft(1);
        }
        passwordScalar = scalar;

        Point mask = (alice ? M : N).multiply(passwordScalar);
        myMsg = p.add(mask).encode();
        return myMsg.clone();
    }

    /** The 64-byte key, or null if the peer's message isn't a point of the curve. */
    byte[] processMessage(byte[] theirMsg) throws Exception {
        if (theirMsg.length != 32 || myMsg == null) return null;
        Point qStar = Point.decode(theirMsg);
        if (qStar == null) return null;
        Point peersMask = (alice ? N : M).multiply(passwordScalar);
        Point qExt = qStar.add(peersMask.negate());
        byte[] dh = qExt.multiply(privateKey).encode();

        MessageDigest sha = MessageDigest.getInstance("SHA-512");
        if (alice) {
            withLength(sha, myName);
            withLength(sha, theirName);
            withLength(sha, myMsg);
            withLength(sha, theirMsg);
        } else {
            withLength(sha, theirName);
            withLength(sha, myName);
            withLength(sha, theirMsg);
            withLength(sha, myMsg);
        }
        withLength(sha, dh);
        withLength(sha, passwordHash);
        return sha.digest();
    }

    void destroy() {
        privateKey = null;
        passwordScalar = null;
        if (passwordHash != null) Arrays.fill(passwordHash, (byte) 0);
    }

    private static void withLength(MessageDigest sha, byte[] data) {
        long n = data.length;
        byte[] len = new byte[8];
        for (int i = 0; i < 8; i++) len[i] = (byte) (n >>> (8 * i));
        sha.update(len);
        sha.update(data);
    }

    static BigInteger littleEndian(byte[] b) {
        byte[] be = new byte[b.length + 1];
        for (int i = 0; i < b.length; i++) be[b.length - i] = b[i];
        return new BigInteger(be);
    }

    /** A point of edwards25519 in extended coordinates (X:Y:Z:T), x = X/Z, y = Y/Z, xy = T/Z. */
    static final class Point {
        final BigInteger x, y, z, t;

        private Point(BigInteger x, BigInteger y, BigInteger z, BigInteger t) {
            this.x = x;
            this.y = y;
            this.z = z;
            this.t = t;
        }

        static Point affine(BigInteger x, BigInteger y) {
            return new Point(x.mod(P), y.mod(P), BigInteger.ONE, x.multiply(y).mod(P));
        }

        static final Point IDENTITY = new Point(BigInteger.ZERO, BigInteger.ONE, BigInteger.ONE, BigInteger.ZERO);

        /** Addition for a = -1 twisted Edwards curves (add-2008-hwcd-3), complete. */
        Point add(Point o) {
            BigInteger a = y.subtract(x).multiply(o.y.subtract(o.x)).mod(P);
            BigInteger b = y.add(x).multiply(o.y.add(o.x)).mod(P);
            BigInteger c = t.multiply(TWO_D).multiply(o.t).mod(P);
            BigInteger d = z.shiftLeft(1).multiply(o.z).mod(P);
            BigInteger e = b.subtract(a), f = d.subtract(c), g = d.add(c), h = b.add(a);
            return new Point(e.multiply(f).mod(P), g.multiply(h).mod(P), f.multiply(g).mod(P), e.multiply(h).mod(P));
        }

        Point negate() {
            return new Point(P.subtract(x).mod(P), y, z, P.subtract(t).mod(P));
        }

        /** k·this for any k ≥ 0 (as an integer, not reduced: the small-order part matters here). */
        Point multiply(BigInteger k) {
            Point result = IDENTITY;
            for (int i = k.bitLength() - 1; i >= 0; i--) {
                result = result.add(result);
                if (k.testBit(i)) result = result.add(this);
            }
            return result;
        }

        byte[] encode() {
            BigInteger zi = z.modInverse(P);
            BigInteger ax = x.multiply(zi).mod(P), ay = y.multiply(zi).mod(P);
            byte[] out = new byte[32];
            byte[] be = ay.toByteArray();
            for (int i = 0; i < be.length && i < 32; i++) out[i] = be[be.length - 1 - i];
            if (ax.testBit(0)) out[31] |= (byte) 0x80;
            return out;
        }

        static Point decode(byte[] s) {
            byte[] copy = s.clone();
            boolean sign = (copy[31] & 0x80) != 0;
            copy[31] &= 0x7F;
            BigInteger y = littleEndian(copy);
            if (y.compareTo(P) >= 0) return null;
            BigInteger yy = y.multiply(y).mod(P);
            BigInteger u = yy.subtract(BigInteger.ONE).mod(P);
            BigInteger v = D.multiply(yy).add(BigInteger.ONE).mod(P);
            BigInteger xx = u.multiply(v.modInverse(P)).mod(P);
            BigInteger x = xx.modPow(P.add(BigInteger.valueOf(3)).shiftRight(3), P);
            if (!x.multiply(x).subtract(xx).mod(P).equals(BigInteger.ZERO)) {
                x = x.multiply(SQRT_M1).mod(P);
                if (!x.multiply(x).subtract(xx).mod(P).equals(BigInteger.ZERO)) return null;
            }
            if (x.signum() == 0 && sign) return null;
            if (x.testBit(0) != sign) x = P.subtract(x);
            return affine(x, y);
        }
    }
}
