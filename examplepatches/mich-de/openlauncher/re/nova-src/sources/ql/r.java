package ql;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: e, reason: collision with root package name */
    public static final BigInteger f84198e;

    /* renamed from: f, reason: collision with root package name */
    public static final BigInteger f84199f;

    /* renamed from: a, reason: collision with root package name */
    public Integer f84200a;

    /* renamed from: b, reason: collision with root package name */
    public BigInteger f84201b;

    /* renamed from: c, reason: collision with root package name */
    public s f84202c;

    /* renamed from: d, reason: collision with root package name */
    public t f84203d;

    static {
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        f84198e = bigIntegerValueOf;
        f84199f = bigIntegerValueOf.pow(256);
    }

    public final u a() throws GeneralSecurityException {
        Integer num = this.f84200a;
        if (num == null) {
            throw new GeneralSecurityException("key size is not set");
        }
        if (this.f84201b == null) {
            throw new GeneralSecurityException("publicExponent is not set");
        }
        if (this.f84202c == null) {
            throw new GeneralSecurityException("hash type is not set");
        }
        if (this.f84203d == null) {
            throw new GeneralSecurityException("variant is not set");
        }
        if (num.intValue() < 2048) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size in bytes %d; must be at least 2048 bits", this.f84200a));
        }
        BigInteger bigInteger = this.f84201b;
        int iCompareTo = bigInteger.compareTo(u.f84213e);
        if (iCompareTo != 0) {
            if (iCompareTo < 0) {
                throw new InvalidAlgorithmParameterException("Public exponent must be at least 65537.");
            }
            if (bigInteger.mod(f84198e).equals(BigInteger.ZERO)) {
                throw new InvalidAlgorithmParameterException("Invalid public exponent");
            }
            if (bigInteger.compareTo(f84199f) > 0) {
                throw new InvalidAlgorithmParameterException("Public exponent cannot be larger than 2^256.");
            }
        }
        return new u(this.f84200a.intValue(), this.f84201b, this.f84203d, this.f84202c);
    }
}
