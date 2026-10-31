package fc0;

import io.sentry.e3;
import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class r extends e implements o {

    /* renamed from: d, reason: collision with root package name */
    public final s f54647d;

    public r(s sVar) {
        Objects.requireNonNull(sVar);
        this.f54647d = sVar;
    }

    @Override // x60.f
    public final boolean a() {
        return this.f54647d.c(s.f54649k) == 0;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        x60.f fVar = (x60.f) obj;
        if (this == fVar) {
            return 0;
        }
        return fVar instanceof r ? this.f54647d.c(((r) fVar).f54647d) : r.class.getName().compareTo(fVar.getClass().getName());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof r) {
            return Objects.equals(this.f54647d, ((r) obj).f54647d);
        }
        return false;
    }

    @Override // java.util.function.DoubleSupplier
    public final double getAsDouble() {
        return this.f54647d.doubleValue();
    }

    @Override // fc0.e, kc0.a
    public final Object getValue() {
        return this.f54647d;
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        if (eVar instanceof r) {
            return true;
        }
        return eVar instanceof p;
    }

    public final int hashCode() {
        return this.f54647d.f54655f;
    }

    @Override // fc0.e
    public final Number i(Number number) {
        e3 e3VarQ = e3.q(this.f54647d);
        e3VarQ.n(number);
        return e3VarQ.t();
    }

    @Override // fc0.e
    public final e k() {
        return new r(this.f54647d.k());
    }

    @Override // fc0.e
    public final e l(e eVar) {
        if (eVar instanceof r) {
            return n((r) eVar);
        }
        if (eVar instanceof p) {
            return n(new r(((p) eVar).f54642g));
        }
        throw new IllegalStateException(String.format("%s.simpleCompose() not handled for converter %s", this, eVar));
    }

    @Override // fc0.e
    public final String m() {
        return "x -> x * " + this.f54647d;
    }

    public final e n(r rVar) {
        s sVar = this.f54647d;
        BigInteger bigIntegerMultiply = sVar.d().multiply(rVar.f54647d.d());
        BigInteger bigIntegerMultiply2 = sVar.f54654e.multiply(rVar.f54647d.f54654e);
        BigInteger bigIntegerGcd = bigIntegerMultiply.gcd(bigIntegerMultiply2);
        BigInteger bigIntegerDivide = bigIntegerMultiply.divide(bigIntegerGcd);
        BigInteger bigIntegerDivide2 = bigIntegerMultiply2.divide(bigIntegerGcd);
        BigInteger bigInteger = BigInteger.ONE;
        return (bigIntegerDivide.equals(bigInteger) && bigIntegerDivide2.equals(bigInteger)) ? e.f54605b : new r(bigIntegerDivide, bigIntegerDivide2);
    }

    public r(BigInteger bigInteger, BigInteger bigInteger2) {
        this.f54647d = s.h(bigInteger, bigInteger2);
    }
}
