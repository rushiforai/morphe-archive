package fc0;

import io.sentry.e3;
import java.util.Objects;
import tech.units.indriya.function.DefaultNumberSystem;

/* loaded from: classes5.dex */
public final class l extends e implements kc0.a {

    /* renamed from: d, reason: collision with root package name */
    public final double f54633d;

    /* renamed from: e, reason: collision with root package name */
    public final double f54634e;

    public l(double d5) {
        this.f54633d = d5;
        this.f54634e = Math.log(d5);
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
        if (obj instanceof l) {
            return Double.valueOf(this.f54633d).equals(Double.valueOf(((l) obj).f54633d));
        }
        return false;
    }

    @Override // fc0.e
    public final boolean h(e eVar) {
        return (eVar instanceof n) && ((n) eVar).f54636d == this.f54633d;
    }

    public final int hashCode() {
        return Objects.hash(Double.valueOf(this.f54633d));
    }

    @Override // fc0.e
    public final Number i(Number number) {
        e3 e3VarQ = e3.q(Double.valueOf(this.f54634e));
        e3VarQ.n(number);
        ic0.c cVar = (ic0.c) e3VarQ.f67208b;
        Number number2 = (Number) e3VarQ.f67209c;
        ((DefaultNumberSystem) cVar).getClass();
        e3VarQ.f67209c = Double.valueOf(Math.exp(number2.doubleValue()));
        return e3VarQ.t();
    }

    @Override // fc0.e
    public final e k() {
        return new n(this.f54633d);
    }

    @Override // fc0.e
    public final e l(e eVar) {
        return e.f54605b;
    }

    @Override // fc0.e
    public final String m() {
        double d5 = this.f54633d;
        if (d5 == 2.718281828459045d) {
            return "x -> e^x";
        }
        if (d5 < 0.0d) {
            return "x -> (" + d5 + ")^x";
        }
        return "x -> " + d5 + "^x";
    }
}
