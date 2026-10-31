package l1;

import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public abstract class e3 {
    static {
        new p1.y0(f1.f73276m);
    }

    public static final void a(d1 d1Var, z5 z5Var, p9 p9Var, Function2 function2, p1.o oVar, int i5, int i11) {
        d1 d1Var2;
        int i12;
        p9 p9Var2;
        z5 z5Var2;
        p9 p9Var3;
        z5 z5Var3;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-2127166334);
        if ((i5 & 6) == 0) {
            if ((i11 & 1) == 0) {
                d1Var2 = d1Var;
                int i13 = tVar.f(d1Var2) ? 4 : 2;
                i12 = i13 | i5;
            } else {
                d1Var2 = d1Var;
            }
            i12 = i13 | i5;
        } else {
            d1Var2 = d1Var;
            i12 = i5;
        }
        if ((i5 & 48) == 0) {
            i12 |= 16;
        }
        if ((i5 & 384) == 0) {
            if ((i11 & 4) == 0) {
                p9Var2 = p9Var;
                int i14 = tVar.f(p9Var2) ? 256 : 128;
                i12 |= i14;
            } else {
                p9Var2 = p9Var;
            }
            i12 |= i14;
        } else {
            p9Var2 = p9Var;
        }
        if ((i5 & 3072) == 0) {
            i12 |= tVar.h(function2) ? 2048 : 1024;
        }
        if ((i12 & 1171) == 1170 && tVar.E()) {
            tVar.V();
            p9Var3 = p9Var2;
            z5Var3 = z5Var;
        } else {
            tVar.X();
            if ((i5 & 1) == 0 || tVar.B()) {
                if ((i11 & 1) != 0) {
                    d1Var2 = (d1) tVar.j(g1.f73330a);
                }
                z5Var2 = (z5) tVar.j(a6.f73027a);
                if ((i11 & 4) != 0) {
                    p9Var2 = (p9) tVar.j(q9.f73875a);
                }
            } else {
                tVar.V();
                z5Var2 = z5Var;
            }
            tVar.q();
            e0.w0 w0VarA = q5.a(false, 0.0f, 0L, tVar, 0, 7);
            long j11 = d1Var2.f73148a;
            boolean zE = tVar.e(j11);
            Object objP = tVar.P();
            if (zE || objP == p1.n.f81514a) {
                objP = new e1.g1(j11, i2.s.b(0.4f, j11));
                tVar.m0(objP);
            }
            p1.a0.b(new p1.r1[]{g1.f73330a.a(d1Var2), androidx.compose.foundation.e.f13914a.a(w0VarA), k1.n.f70844a.a(h1.f73367a), a6.f73027a.a(z5Var2), e1.h1.f51306a.a((e1.g1) objP), q9.f73875a.a(p9Var2)}, x1.f.d(-1066563262, new b3.p1(p9Var2, function2, 2), tVar), tVar, 56);
            p9Var3 = p9Var2;
            z5Var3 = z5Var2;
        }
        d1 d1Var3 = d1Var2;
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new d3(d1Var3, z5Var3, p9Var3, function2, i5, i11);
        }
    }
}
