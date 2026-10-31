package ql;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;

/* loaded from: classes3.dex */
public final class y {

    /* renamed from: g, reason: collision with root package name */
    public static final BigInteger f84235g;

    /* renamed from: h, reason: collision with root package name */
    public static final BigInteger f84236h;

    /* renamed from: a, reason: collision with root package name */
    public Integer f84237a;

    /* renamed from: b, reason: collision with root package name */
    public BigInteger f84238b;

    /* renamed from: c, reason: collision with root package name */
    public z f84239c;

    /* renamed from: d, reason: collision with root package name */
    public z f84240d;

    /* renamed from: e, reason: collision with root package name */
    public Integer f84241e;

    /* renamed from: f, reason: collision with root package name */
    public a0 f84242f;

    static {
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        f84235g = bigIntegerValueOf;
        f84236h = bigIntegerValueOf.pow(256);
    }

    public final b0 a() throws GeneralSecurityException {
        Integer num = this.f84237a;
        if (num == null) {
            throw new GeneralSecurityException("key size is not set");
        }
        if (this.f84238b == null) {
            throw new GeneralSecurityException("publicExponent is not set");
        }
        if (this.f84239c == null) {
            throw new GeneralSecurityException("signature hash type is not set");
        }
        if (this.f84240d == null) {
            throw new GeneralSecurityException("mgf1 hash type is not set");
        }
        if (this.f84242f == null) {
            throw new GeneralSecurityException("variant is not set");
        }
        if (this.f84241e == null) {
            throw new GeneralSecurityException("salt length is not set");
        }
        if (num.intValue() < 2048) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least %d bits", this.f84237a, 2048));
        }
        if (this.f84239c != this.f84240d) {
            throw new GeneralSecurityException("MGF1 hash is different from signature hash");
        }
        BigInteger bigInteger = this.f84238b;
        int iCompareTo = bigInteger.compareTo(b0.f84121g);
        if (iCompareTo != 0) {
            if (iCompareTo < 0) {
                throw new InvalidAlgorithmParameterException("Public exponent must be at least 65537.");
            }
            if (bigInteger.mod(f84235g).equals(BigInteger.ZERO)) {
                throw new InvalidAlgorithmParameterException("Invalid public exponent");
            }
            if (bigInteger.compareTo(f84236h) > 0) {
                throw new InvalidAlgorithmParameterException("Public exponent cannot be larger than 2^256.");
            }
        }
        return new b0(this.f84237a.intValue(), this.f84238b, this.f84242f, this.f84239c, this.f84240d, this.f84241e.intValue());
    }

    public final void b(int i5) throws GeneralSecurityException {
        if (i5 < 0) {
            throw new GeneralSecurityException(String.format("Invalid salt length in bytes %d; salt length must be positive", Integer.valueOf(i5)));
        }
        this.f84241e = Integer.valueOf(i5);
    }
}
