package fc0;

import io.sentry.e3;
import java.util.Objects;
import tech.units.indriya.function.DefaultNumberSystem;

/* loaded from: classes5.dex */
public final class n extends e implements kc0.a {

    /* renamed from: d, reason: collision with root package name */
    public final double f54636d;

    /* renamed from: e, reason: collision with root package name */
    public final double f54637e;

    public n(double d5) {
        this.f54636d = d5;
        this.f54637e = Math.log(d5);
    }

    @Override // x60.f
    public final boolean a() {
        return false;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        x60.f fVar = (x60.f) obj;
        if (this == fVar) {
            return 0;
        }
        if (fVar instanceof kc0.a) {
            return toString().compareTo(String.valueOf(((kc0.a) fVar).getValue()));
        }
        return -1;
    }

    @Override // x60.f
    public final boolean e() {
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof n) {
            return Double.valueOf(this.f54636d).equals(Double.valueOf(((n) obj).f54636d));
        }
        return false;
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        return (eVar instanceof l) && ((l) eVar).f54633d == this.f54636d;
    }

    public final int hashCode() {
        return Objects.hash(Double.valueOf(this.f54636d));
    }

    @Override // fc0.e
    public final Number i(Number number) {
        e3 e3VarQ = e3.q(number);
        ic0.c cVar = (ic0.c) e3VarQ.f67208b;
        Number number2 = (Number) e3VarQ.f67209c;
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) cVar;
        defaultNumberSystem.getClass();
        e3VarQ.f67209c = Double.valueOf(Math.log(number2.doubleValue()));
        e3VarQ.f67209c = defaultNumberSystem.g((Number) e3VarQ.f67209c, defaultNumberSystem.k(defaultNumberSystem.i(Double.valueOf(this.f54637e))));
        return e3VarQ.t();
    }

    @Override // fc0.e
    public final e k() {
        return new l(this.f54636d);
    }

    @Override // fc0.e
    public final e l(e eVar) {
        return e.f54605b;
    }

    @Override // fc0.e
    public final String m() {
        double d5 = this.f54636d;
        if (d5 == 2.718281828459045d) {
            return "x -> ln(x)";
        }
        return "x -> log(base=" + d5 + ", x)";
    }
}
