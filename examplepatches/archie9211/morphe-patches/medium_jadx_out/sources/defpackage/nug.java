package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class nug {
    public static final BigInteger g;
    public static final BigInteger h;
    public Integer a = null;
    public BigInteger b = qug.g;
    public oug c = null;
    public oug d = null;
    public Integer e = null;
    public zwf f = zwf.s;

    static {
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        g = bigIntegerValueOf;
        h = bigIntegerValueOf.pow(256);
    }

    public final void a(int i) {
        this.a = Integer.valueOf(i);
    }

    public final void b(int i) {
        if (i < 0) {
            throw new GeneralSecurityException(String.format("Invalid salt length in bytes %d; salt length must be positive", Integer.valueOf(i)));
        }
        this.e = Integer.valueOf(i);
    }

    public final qug c() {
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
            ygf.l("signature hash type is not set");
            return null;
        }
        if (this.d == null) {
            ygf.l("mgf1 hash type is not set");
            return null;
        }
        if (this.e == null) {
            ygf.l(mgKMENwrbHf.MAMOKzZHl);
            return null;
        }
        if (num.intValue() < 2048) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least %d bits", this.a, Integer.valueOf(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH)));
        }
        if (this.c != this.d) {
            ygf.l("MGF1 hash is different from signature hash");
            return null;
        }
        BigInteger bigInteger = this.b;
        int iCompareTo = bigInteger.compareTo(qug.g);
        if (iCompareTo != 0) {
            if (iCompareTo < 0) {
                throw new InvalidAlgorithmParameterException("Public exponent must be at least 65537.");
            }
            if (bigInteger.mod(g).equals(BigInteger.ZERO)) {
                throw new InvalidAlgorithmParameterException("Invalid public exponent");
            }
            if (bigInteger.compareTo(h) > 0) {
                throw new InvalidAlgorithmParameterException("Public exponent cannot be larger than 2^256.");
            }
        }
        return new qug(this.a.intValue(), this.b, this.f, this.c, this.d, this.e.intValue());
    }
}
