package defpackage;

import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ytg {
    public static final BigInteger e;
    public static final BigInteger f;
    public Integer a = null;
    public BigInteger b = dug.e;
    public aug c = null;
    public d1g d = d1g.K;

    static {
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        e = bigIntegerValueOf;
        f = bigIntegerValueOf.pow(256);
    }

    public final void a(int i) {
        this.a = Integer.valueOf(i);
    }

    public final dug b() {
        Integer num = this.a;
        if (num == null) {
            ygf.l("key size is not set");
            return null;
        }
        if (this.b == null) {
            ygf.l("publicExponent is not set");
            return null;
        }
        if (this.c == null) {
            ygf.l("hash type is not set");
            return null;
        }
        if (num.intValue() < 2048) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least 2048 bits", this.a));
        }
        BigInteger bigInteger = this.b;
        int iCompareTo = bigInteger.compareTo(dug.e);
        if (iCompareTo != 0) {
            if (iCompareTo < 0) {
                throw new InvalidAlgorithmParameterException("Public exponent must be at least 65537.");
            }
            if (bigInteger.mod(e).equals(BigInteger.ZERO)) {
                throw new InvalidAlgorithmParameterException("Invalid public exponent");
            }
            if (bigInteger.compareTo(f) > 0) {
                throw new InvalidAlgorithmParameterException("Public exponent cannot be larger than 2^256.");
            }
        }
        return new dug(this.a.intValue(), this.b, this.d, this.c);
    }
}
