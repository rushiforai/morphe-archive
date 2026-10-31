package fc0;

import b.c0;
import io.sentry.e3;
import java.math.BigInteger;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class p extends e implements o {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f54638h = 0;

    /* renamed from: d, reason: collision with root package name */
    public final int f54639d;

    /* renamed from: e, reason: collision with root package name */
    public final int f54640e;

    /* renamed from: f, reason: collision with root package name */
    public final int f54641f;

    /* renamed from: g, reason: collision with root package name */
    public final s f54642g;

    public p(int i5, int i11) {
        s sVarI;
        if (i5 == 0) {
            throw new IllegalArgumentException("base cannot be zero (because 0^0 is undefined)");
        }
        this.f54639d = i5;
        this.f54640e = i11;
        this.f54641f = Objects.hash(Integer.valueOf(i5), Integer.valueOf(i11));
        if (i11 == 0) {
            sVarI = s.f54649k;
        } else {
            BigInteger bigIntegerPow = BigInteger.valueOf(i5).pow(Math.abs(i11));
            sVarI = i11 > 0 ? s.i(bigIntegerPow) : s.h(BigInteger.ONE, bigIntegerPow);
        }
        this.f54642g = sVarI;
    }

    @Override // x60.f
    public final boolean a() {
        return this.f54639d == 1 || this.f54640e == 0;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        x60.f fVar = (x60.f) obj;
        if (this == fVar) {
            return 0;
        }
        if (a() && fVar.a()) {
            return 0;
        }
        if (!(fVar instanceof p)) {
            return p.class.getName().compareTo(fVar.getClass().getName());
        }
        p pVar = (p) fVar;
        int iCompare = Integer.compare(this.f54639d, pVar.f54639d);
        return iCompare != 0 ? iCompare : Integer.compare(this.f54640e, pVar.f54640e);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof x60.f) {
            x60.f fVar = (x60.f) obj;
            if (a() && fVar.a()) {
                return true;
            }
        }
        if (obj instanceof p) {
            p pVar = (p) obj;
            if (this.f54639d == pVar.f54639d && this.f54640e == pVar.f54640e) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.function.DoubleSupplier
    public final double getAsDouble() {
        return this.f54642g.doubleValue();
    }

    @Override // fc0.e, kc0.a
    public final Object getValue() {
        return this.f54642g;
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        return eVar instanceof p ? ((p) eVar).f54639d == this.f54639d : eVar instanceof r;
    }

    public final int hashCode() {
        return this.f54641f;
    }

    @Override // fc0.e
    public final Number i(Number number) {
        e3 e3VarQ = e3.q(this.f54642g);
        e3VarQ.n(number);
        return e3VarQ.t();
    }

    @Override // fc0.e
    public final e k() {
        return new p(this.f54639d, -this.f54640e);
    }

    @Override // fc0.e
    public final e l(e eVar) {
        if (eVar instanceof p) {
            p pVar = (p) eVar;
            int i5 = pVar.f54639d;
            int i11 = this.f54639d;
            if (i11 == i5) {
                return new p(i11, this.f54640e + pVar.f54640e);
            }
        }
        if (eVar instanceof r) {
            return (e) new r(this.f54642g).d(eVar);
        }
        throw new IllegalStateException(String.format("%s.simpleCompose() not handled for converter %s", this, eVar));
    }

    @Override // fc0.e
    public final String m() {
        int i5 = this.f54640e;
        int i11 = this.f54639d;
        return i11 < 0 ? c0.g(i11, i5, "x -> x * (", ")^") : c0.g(i11, i5, "x -> x * ", "^");
    }
}
