package fc0;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.function.DoubleSupplier;
import tech.units.indriya.function.DefaultNumberSystem;

/* loaded from: classes5.dex */
public interface o extends x60.f, kc0.a, DoubleSupplier, Comparable {
    static o f(s sVar) {
        return sVar.equals(s.f54649k) ? m.f54635a : new r(sVar);
    }

    static o of(double d5) {
        return d5 == 1.0d ? m.f54635a : f(s.f(d5));
    }

    static o s(Number number) {
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        if (defaultNumberSystem.c(j.a(number).f54631b, number) == 0) {
            return m.f54635a;
        }
        Number numberI = defaultNumberSystem.i(number);
        if (numberI instanceof s) {
            return f((s) numberI);
        }
        if (defaultNumberSystem.f(numberI)) {
            return numberI instanceof BigInteger ? f(s.i((BigInteger) numberI)) : f(s.i(BigInteger.valueOf(numberI.longValue())));
        }
        if ((numberI instanceof Double) || (numberI instanceof Float)) {
            return of(numberI.doubleValue());
        }
        if (numberI instanceof BigDecimal) {
            return f(s.g((BigDecimal) numberI));
        }
        throw new UnsupportedOperationException("not yet supported");
    }

    static o v0(long j11, long j12) {
        s sVar = s.f54648j;
        return f(s.h(BigInteger.valueOf(j11), BigInteger.valueOf(j12)));
    }

    static o y0(x60.d dVar) {
        if (dVar == null) {
            return m.f54635a;
        }
        if (dVar.a() == 1) {
            return s(dVar.b());
        }
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        if (!defaultNumberSystem.f(dVar.b())) {
            return s(defaultNumberSystem.j(dVar.a(), dVar.b()));
        }
        int i5 = p.f54638h;
        Integer numB = dVar.b();
        return new p(numB.intValue(), dVar.a());
    }

    @Override // x60.f
    default boolean e() {
        return true;
    }
}
