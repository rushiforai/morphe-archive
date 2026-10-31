package n0;

import e10.h4;
import e10.j2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import p1.s2;
import p1.t1;
import p1.z2;

/* loaded from: classes.dex */
public abstract class z {

    /* renamed from: a, reason: collision with root package name */
    public static final t[] f77536a = new t[0];

    public static final void a(Function0 function0, b2.t tVar, o0 o0Var, e0 e0Var, p1.o oVar, int i5) {
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1055276397);
        int i11 = (tVar2.h(function0) ? 4 : 2) | i5 | (tVar2.f(tVar) ? 32 : 16) | (tVar2.f(o0Var) ? 256 : 128) | (tVar2.f(e0Var) ? 2048 : 1024);
        if (tVar2.S(i11 & 1, (i11 & 1171) != 1170)) {
            c(x1.f.d(-933153643, new androidx.compose.foundation.lazy.layout.d(o0Var, tVar, e0Var, androidx.compose.runtime.d.m(function0, tVar2)), tVar2), tVar2, 6);
        } else {
            tVar2.V();
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b20.g(function0, tVar, o0Var, e0Var, i5);
        }
    }

    public static final void b(Object obj, int i5, k0 k0Var, x1.e eVar, p1.o oVar, int i11) {
        int i12;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(872548579);
        if ((i11 & 6) == 0) {
            i12 = (tVar.h(obj) ? 4 : 2) | i11;
        } else {
            i12 = i11;
        }
        if ((i11 & 48) == 0) {
            i12 |= tVar.d(i5) ? 32 : 16;
        }
        if ((i11 & 384) == 0) {
            i12 |= tVar.h(k0Var) ? 256 : 128;
        }
        if ((i11 & 3072) == 0) {
            i12 |= tVar.h(eVar) ? 2048 : 1024;
        }
        if (tVar.S(i12 & 1, (i12 & 1171) != 1170)) {
            boolean zF = tVar.f(obj) | tVar.f(k0Var);
            Object objP = tVar.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (zF || objP == g1Var) {
                objP = new j0(obj, k0Var);
                tVar.m0(objP);
            }
            j0 j0Var = (j0) objP;
            j0Var.f77436c = i5;
            p1.e1 e1Var = j0Var.f77440g;
            p1.m0 m0Var = z2.g1.f98069a;
            j0 j0Var2 = (j0) tVar.j(m0Var);
            z1.f fVarL = o2.f.l();
            Function1 function1E = fVarL != null ? fVarL.e() : null;
            z1.f fVarQ = o2.f.q(fVarL);
            try {
                if (j0Var2 != ((j0) ((s2) e1Var).getValue())) {
                    ((s2) e1Var).setValue(j0Var2);
                    if (j0Var.f77437d > 0) {
                        j0 j0Var3 = j0Var.f77438e;
                        if (j0Var3 != null) {
                            j0Var3.b();
                        }
                        if (j0Var2 != null) {
                            j0Var2.a();
                        } else {
                            j0Var2 = null;
                        }
                        j0Var.f77438e = j0Var2;
                    }
                }
                Unit unit = Unit.f71706a;
                o2.f.w(fVarL, fVarQ, function1E);
                boolean zF2 = tVar.f(j0Var);
                Object objP2 = tVar.P();
                if (zF2 || objP2 == g1Var) {
                    objP2 = new b00.t(j0Var, 25);
                    tVar.m0(objP2);
                }
                p1.o0.b(j0Var, (Function1) objP2, tVar);
                p1.a0.a(m0Var.a(j0Var), eVar, tVar, ((i12 >> 6) & 112) | 8);
            } catch (Throwable th2) {
                o2.f.w(fVarL, fVarQ, function1E);
                throw th2;
            }
        } else {
            tVar.V();
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k0.u(obj, i5, k0Var, eVar, i11);
        }
    }

    public static final void c(x1.e eVar, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-709502251);
        if (tVar.S(i5 & 1, (i5 & 3) != 2)) {
            z2 z2Var = y1.g.f96570a;
            y1.e eVar2 = (y1.e) tVar.j(z2Var);
            y1.d dVarF = y1.j.f(tVar);
            Object[] objArr = {eVar2};
            ab.c0 c0Var = new ab.c0(7, new j00.k0(21, (byte) 0), new jt.e(23, eVar2, dVarF));
            boolean zH = tVar.h(eVar2) | tVar.h(dVarF);
            Object objP = tVar.P();
            if (zH || objP == p1.n.f81514a) {
                objP = new b00.c(9, eVar2, dVarF);
                tVar.m0(objP);
            }
            y0 y0Var = (y0) y1.j.d(objArr, c0Var, (Function0) objP, tVar, 0);
            p1.a0.a(z2Var.a(y0Var), x1.f.d(-412824043, new h4(eVar, y0Var, 5), tVar), tVar, 56);
        } else {
            tVar.V();
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new j2(eVar, i5);
        }
    }

    public static final void d(d0 d0Var, Object obj, int i5, Object obj2, p1.o oVar, int i11) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(1439843069);
        int i12 = (tVar.f(d0Var) ? 4 : 2) | i11 | (tVar.f(obj) ? 32 : 16) | (tVar.d(i5) ? 256 : 128) | (tVar.f(obj2) ? 2048 : 1024);
        if (tVar.S(i12 & 1, (i12 & 1171) != 1170)) {
            ((y1.c) obj).f(obj2, x1.f.d(980966366, new b00.v(d0Var, i5, obj2, 2), tVar), tVar, 48);
        } else {
            tVar.V();
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c0(d0Var, obj, i5, obj2, i11);
        }
    }

    public static final int e(int i5, r1.e eVar) {
        int i11 = eVar.f85079c - 1;
        int i12 = 0;
        while (i12 < i11) {
            int iC = b.c0.c(i11, i12, 2, i12);
            Object[] objArr = eVar.f85077a;
            int i13 = ((f) objArr[iC]).f77411a;
            if (i13 != i5) {
                if (i13 < i5) {
                    i12 = iC + 1;
                    if (i5 < ((f) objArr[i12]).f77411a) {
                    }
                } else {
                    i11 = iC - 1;
                }
            }
            return iC;
        }
        return i12;
    }

    public static p1.e1 f() {
        return androidx.compose.runtime.d.j(Unit.f71706a, p1.g1.f81422b);
    }

    public static final int g(d0 d0Var, Object obj, int i5) {
        int iC;
        return (obj == null || d0Var.a() == 0 || (i5 < d0Var.a() && obj.equals(d0Var.d(i5))) || (iC = d0Var.c(obj)) == -1) ? i5 : iC;
    }
}
