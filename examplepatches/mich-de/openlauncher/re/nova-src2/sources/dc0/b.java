package dc0;

import fc0.i;
import fc0.j;
import fc0.o;
import fc0.s;
import ic0.c;
import io.sentry.e3;
import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.measure.IncommensurableException;
import javax.measure.MeasurementException;
import javax.measure.UnconvertibleException;
import jc0.d;
import jc0.f;
import jc0.g;
import tech.units.indriya.function.DefaultNumberSystem;
import x60.e;

/* loaded from: classes5.dex */
public abstract class b implements e, Comparable, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final d f49216c = new d();

    /* renamed from: a, reason: collision with root package name */
    public String f49217a;

    /* renamed from: b, reason: collision with root package name */
    public String f49218b;

    static {
        new HashMap();
    }

    public b(String str) {
        this.f49218b = str;
    }

    @Override // x60.e
    public abstract Map a();

    @Override // x60.e
    public abstract x60.b b();

    @Override // x60.e
    public e c(int i5) {
        if (i5 > 0) {
            return m(c(i5 - 1));
        }
        d dVar = f49216c;
        return i5 == 0 ? dVar : dVar.h(c(-i5));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        String str = this.f49218b;
        b bVar = (b) ((e) obj);
        String str2 = bVar.f49218b;
        int iCompareTo = str == null ? str2 == null ? 0 : -1 : str2 == null ? 1 : str.compareTo(str2);
        if (iCompareTo != 0) {
            return iCompareTo;
        }
        String str3 = this.f49217a;
        String str4 = bVar.f49217a;
        if (str3 == null) {
            return str4 == null ? 0 : -1;
        }
        if (str4 == null) {
            return 1;
        }
        return str3.compareTo(str4);
    }

    public final b d(Class cls) {
        Logger logger = f.f69443b;
        e eVar = (e) g.f69453c.f49215b.get(cls);
        if (eVar == null) {
            f.f69443b.log(Level.FINER, "Quantity type: " + cls + " unknown");
        }
        x60.b bVarB = eVar != null ? eVar.b() : null;
        if (bVarB == null || bVarB.equals(b())) {
            return this;
        }
        throw new ClassCastException("The unit: " + this + " is not compatible with quantities of type " + cls);
    }

    public abstract boolean equals(Object obj);

    public final e g(double d5) {
        s sVarF = s.f(d5);
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        if (defaultNumberSystem.c(j.a(sVarF).f54631b, sVarF) == 0) {
            return this;
        }
        e3 e3VarQ = e3.q(sVarF);
        e3VarQ.f67209c = ((DefaultNumberSystem) ((c) e3VarQ.f67208b)).k((Number) e3VarQ.f67209c);
        return r(o.s(e3VarQ.t()));
    }

    public final e h(e eVar) {
        jc0.c[] cVarArr;
        b bVar = (b) eVar;
        d dVar = f49216c;
        boolean zEquals = bVar.equals(dVar);
        e eVarV = bVar;
        if (!zEquals) {
            jc0.c[] cVarArr2 = dVar != null ? dVar.f69438d : new jc0.c[]{new jc0.c(dVar, 1, 1)};
            if (bVar instanceof d) {
                jc0.c[] cVarArr3 = ((d) bVar).f69438d;
                cVarArr = new jc0.c[cVarArr3.length];
                for (int i5 = 0; i5 < cVarArr3.length; i5++) {
                    jc0.c cVar = cVarArr3[i5];
                    cVarArr[i5] = new jc0.c(cVar.f69435a, -cVar.f69436b, cVar.f69437c);
                }
            } else {
                cVarArr = new jc0.c[]{new jc0.c(bVar, -1, 1)};
            }
            eVarV = d.v(cVarArr2, cVarArr);
        }
        return m(eVarV);
    }

    public final x60.f i(e eVar) {
        if (this == eVar || equals(eVar)) {
            return fc0.e.f54605b;
        }
        e eVarQ = q();
        b bVar = (b) eVar;
        e eVarQ2 = bVar.q();
        if (eVarQ.equals(eVarQ2)) {
            return bVar.i(eVarQ2).g().d(k());
        }
        try {
            return j(eVar);
        } catch (IncommensurableException e3) {
            throw new UnconvertibleException(e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final x60.f j(e eVar) throws IncommensurableException {
        boolean zEquals;
        if (this == eVar || equals(eVar)) {
            zEquals = true;
        } else if (eVar == null) {
            zEquals = false;
        } else {
            x60.b bVarB = b();
            x60.b bVarB2 = eVar.b();
            if (!bVarB.equals(bVarB2)) {
                zEquals = zg.a.C(bVarB).equals(zg.a.C(bVarB2));
            }
        }
        if (zEquals) {
            b bVar = (b) eVar;
            return zg.a.B(bVar.q().b()).d(bVar.k()).g().d(zg.a.B(q().b()).d(k()));
        }
        throw new IncommensurableException(this + " is not compatible with " + eVar);
    }

    public abstract x60.f k();

    public final e l(double d5) {
        s sVarF = s.f(d5);
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        return defaultNumberSystem.c(j.a(sVarF).f54631b, sVarF) == 0 ? this : r(o.s(sVarF));
    }

    public final e m(e eVar) {
        d dVar = f49216c;
        if (equals(dVar)) {
            return eVar;
        }
        if (eVar.equals(dVar)) {
            return this;
        }
        return d.v(this instanceof d ? ((d) this).f69438d : new jc0.c[]{new jc0.c(this, 1, 1)}, eVar instanceof d ? ((d) eVar).f69438d : new jc0.c[]{new jc0.c(eVar, 1, 1)});
    }

    public final e n(x60.c cVar) {
        return r(o.y0(cVar));
    }

    public final e o(int i5) {
        jc0.c[] cVarArr;
        if (i5 <= 0) {
            if (i5 != 0) {
                return f49216c.h(o(-i5));
            }
            throw new ArithmeticException("Root's order of zero");
        }
        if (this instanceof d) {
            jc0.c[] cVarArr2 = ((d) this).f69438d;
            cVarArr = new jc0.c[cVarArr2.length];
            for (int i11 = 0; i11 < cVarArr2.length; i11++) {
                int iU = d.u(Math.abs(cVarArr2[i11].f69436b), cVarArr2[i11].f69437c * i5);
                jc0.c cVar = cVarArr2[i11];
                cVarArr[i11] = new jc0.c(cVar.f69435a, cVar.f69436b / iU, (cVar.f69437c * i5) / iU);
            }
        } else {
            cVarArr = new jc0.c[]{new jc0.c(this, 1, i5)};
        }
        return d.v(cVarArr, new jc0.c[0]);
    }

    public final e p(double d5) {
        s sVarF = s.f(d5);
        DefaultNumberSystem defaultNumberSystem = (DefaultNumberSystem) i.a();
        defaultNumberSystem.getClass();
        return defaultNumberSystem.c(j.a(sVarF).f54632c, sVarF) == 0 ? this : r(new fc0.f(sVarF));
    }

    public abstract e q();

    public final e r(x60.f fVar) {
        e eVarQ = q();
        e eVarQ2 = q();
        if (this == eVarQ2 || equals(eVarQ2)) {
            fVar = k().d(fVar);
        }
        x60.f fVar2 = fVar;
        return fVar2.a() ? eVarQ : new jc0.e(null, null, this, eVarQ, fVar2);
    }

    public final String toString() {
        ec0.b bVarL = ec0.b.L(1);
        bVarL.getClass();
        try {
            return ((StringBuilder) bVarL.K(this, new StringBuilder())).toString();
        } catch (IOException e3) {
            throw new MeasurementException(e3);
        }
    }
}
