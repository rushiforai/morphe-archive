package fc0;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class s extends Number {

    /* renamed from: j, reason: collision with root package name */
    public static final s f54648j = i(BigInteger.ZERO);

    /* renamed from: k, reason: collision with root package name */
    public static final s f54649k = i(BigInteger.ONE);

    /* renamed from: a, reason: collision with root package name */
    public final Object[] f54650a = new Object[0];

    /* renamed from: b, reason: collision with root package name */
    public final Object[] f54651b = new Object[0];

    /* renamed from: c, reason: collision with root package name */
    public final int f54652c;

    /* renamed from: d, reason: collision with root package name */
    public final BigInteger f54653d;

    /* renamed from: e, reason: collision with root package name */
    public final BigInteger f54654e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54655f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f54656g;

    /* renamed from: h, reason: collision with root package name */
    public transient BigDecimal f54657h;

    /* renamed from: i, reason: collision with root package name */
    public transient Long f54658i;

    public s(int i5, BigInteger bigInteger, BigInteger bigInteger2) {
        this.f54652c = i5;
        this.f54653d = bigInteger;
        this.f54654e = bigInteger2;
        this.f54655f = Objects.hash(Integer.valueOf(i5), bigInteger, bigInteger2);
        this.f54656g = BigInteger.ONE.equals(bigInteger2);
    }

    public static s f(double d5) {
        return g(BigDecimal.valueOf(d5));
    }

    public static s g(BigDecimal bigDecimal) {
        Objects.requireNonNull(bigDecimal);
        int iScale = bigDecimal.scale();
        return iScale <= 0 ? i(bigDecimal.toBigIntegerExact()) : h(bigDecimal.unscaledValue(), BigInteger.TEN.pow(iScale));
    }

    public static s h(BigInteger bigInteger, BigInteger bigInteger2) {
        Objects.requireNonNull(bigInteger);
        Objects.requireNonNull(bigInteger2);
        if (BigInteger.ONE.equals(bigInteger2)) {
            return i(bigInteger);
        }
        if (BigInteger.ZERO.equals(bigInteger2)) {
            throw new IllegalArgumentException("cannot initalize a rational number with divisor equal to ZERO");
        }
        int iSignum = bigInteger2.signum() * bigInteger.signum();
        if (iSignum == 0) {
            return f54648j;
        }
        BigInteger bigIntegerAbs = bigInteger.abs();
        BigInteger bigIntegerAbs2 = bigInteger2.abs();
        BigInteger bigIntegerGcd = bigIntegerAbs.gcd(bigIntegerAbs2);
        return new s(iSignum, bigIntegerAbs.divide(bigIntegerGcd), bigIntegerAbs2.divide(bigIntegerGcd));
    }

    public static s i(BigInteger bigInteger) {
        Objects.requireNonNull(bigInteger);
        return new s(bigInteger.signum(), bigInteger.abs(), BigInteger.ONE);
    }

    public final s a(s sVar) {
        BigInteger bigIntegerNegate = sVar.f54653d;
        BigInteger bigInteger = sVar.f54654e;
        int i5 = this.f54652c;
        BigInteger bigIntegerNegate2 = this.f54653d;
        if (i5 < 0) {
            bigIntegerNegate2 = bigIntegerNegate2.negate();
        }
        if (sVar.f54652c < 0) {
            bigIntegerNegate = bigIntegerNegate.negate();
        }
        BigInteger bigIntegerMultiply = bigIntegerNegate2.multiply(bigInteger);
        BigInteger bigInteger2 = this.f54654e;
        return h(bigIntegerMultiply.add(bigInteger2.multiply(bigIntegerNegate)), bigInteger2.multiply(bigInteger));
    }

    public final BigDecimal b() {
        synchronized (this.f54650a) {
            try {
                if (this.f54657h == null) {
                    BigDecimal bigDecimalDivide = new BigDecimal(this.f54653d).divide(new BigDecimal(this.f54654e), i.f54616b);
                    this.f54657h = bigDecimalDivide;
                    if (this.f54652c < 0) {
                        this.f54657h = bigDecimalDivide.negate();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return this.f54657h;
    }

    public final int c(s sVar) {
        int i5 = sVar.f54652c;
        int i11 = this.f54652c;
        int iCompare = Integer.compare(i11, i5);
        if (iCompare != 0) {
            return iCompare;
        }
        if (iCompare == 0 && i11 == 0) {
            return 0;
        }
        int iCompareTo = this.f54653d.multiply(sVar.f54654e).compareTo(this.f54654e.multiply(sVar.f54653d));
        return i11 > 0 ? iCompareTo : -iCompareTo;
    }

    public final BigInteger d() {
        int i5 = this.f54652c;
        BigInteger bigInteger = this.f54653d;
        return i5 < 0 ? bigInteger.negate() : bigInteger;
    }

    @Override // java.lang.Number
    public final double doubleValue() {
        return b().doubleValue();
    }

    public final s e(s sVar) {
        int i5 = this.f54652c * sVar.f54652c;
        if (i5 == 0) {
            return f54648j;
        }
        BigInteger bigInteger = sVar.f54653d;
        BigInteger bigInteger2 = sVar.f54654e;
        BigInteger bigIntegerMultiply = this.f54653d.multiply(bigInteger);
        BigInteger bigIntegerMultiply2 = this.f54654e.multiply(bigInteger2);
        BigInteger bigIntegerGcd = bigIntegerMultiply.gcd(bigIntegerMultiply2);
        return new s(i5, bigIntegerMultiply.divide(bigIntegerGcd), bigIntegerMultiply2.divide(bigIntegerGcd));
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof s) {
            return Objects.equals(b(), ((s) obj).b());
        }
        return false;
    }

    @Override // java.lang.Number
    public final float floatValue() {
        return (float) doubleValue();
    }

    public final int hashCode() {
        return this.f54655f;
    }

    @Override // java.lang.Number
    public final int intValue() {
        return (int) longValue();
    }

    public final s j(int i5) {
        int i11 = this.f54652c;
        if (i5 == 0) {
            if (i11 != 0) {
                return f54649k;
            }
            throw new ArithmeticException("0^0 is not defined");
        }
        if (i11 == 0) {
            return f54648j;
        }
        int i12 = 1;
        boolean z11 = (i5 & 1) == 0;
        if (i11 < 0 && !z11) {
            i12 = -1;
        }
        BigInteger bigInteger = this.f54654e;
        BigInteger bigInteger2 = this.f54653d;
        return i5 > 0 ? new s(i12, bigInteger2.pow(i5), bigInteger.pow(i5)) : new s(i12, bigInteger.pow(i5), bigInteger2.pow(i5));
    }

    public final s k() {
        return new s(this.f54652c, this.f54654e, this.f54653d);
    }

    @Override // java.lang.Number
    public final long longValue() {
        synchronized (this.f54651b) {
            try {
                if (this.f54658i == null) {
                    this.f54658i = Long.valueOf(this.f54652c < 0 ? this.f54653d.negate().divide(this.f54654e).longValue() : this.f54653d.divide(this.f54654e).longValue());
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return this.f54658i.longValue();
    }

    public final String toString() {
        return this.f54652c == 0 ? "0" : this.f54656g ? d().toString() : String.valueOf(b());
    }
}
