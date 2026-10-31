package k0;

import androidx.core.graphics.Insets;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class i2 {

    /* renamed from: a, reason: collision with root package name */
    public static final a3.k f70646a = new a3.k(new h50.q(6));

    public static final void a(b2.t tVar, b2.f fVar, x1.e eVar, p1.o oVar, int i5, int i11) {
        int i12;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(380139498);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
        } else if ((i5 & 6) == 0) {
            i12 = (tVar2.f(tVar) ? 4 : 2) | i5;
        } else {
            i12 = i5;
        }
        int i14 = i11 & 2;
        if (i14 != 0) {
            i12 |= 48;
        } else if ((i5 & 48) == 0) {
            i12 |= tVar2.f(fVar) ? 32 : 16;
        }
        int i15 = i12 | 384;
        if ((i5 & 3072) == 0) {
            i15 |= tVar2.h(eVar) ? 2048 : 1024;
        }
        if (tVar2.S(i15 & 1, (i15 & 1171) != 1170)) {
            if (i13 != 0) {
                tVar = b2.r.f17024a;
            }
            if (i14 != 0) {
                fVar = b2.d.f16997a;
            }
            z2.r0 r0VarD = p.d(fVar, false);
            boolean zF = tVar2.f(r0VarD) | ((i15 & 7168) == 2048);
            Object objP = tVar2.P();
            if (zF || objP == p1.n.f81514a) {
                objP = new e1.j0(r0VarD, eVar);
                tVar2.m0(objP);
            }
            z2.r1.a(tVar, (Function2) objP, tVar2, i15 & 14, 0);
        } else {
            tVar2.V();
        }
        b2.t tVar3 = tVar;
        b2.f fVar2 = fVar;
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new u(tVar3, fVar2, eVar, i5, i11);
        }
    }

    public static final void b(b2.t tVar, p1.o oVar) {
        o oVar2 = o.f70691c;
        p1.t tVar2 = (p1.t) oVar;
        int iHashCode = Long.hashCode(tVar2.T);
        b2.t tVarI = fg.a.I(tVar, oVar);
        p1.n1 n1VarL = tVar2.l();
        b3.l.Po.getClass();
        Function0 function0 = b3.k.f17270b;
        i50.c cVar = tVar2.f81553a;
        tVar2.f0();
        if (tVar2.S) {
            tVar2.k(function0);
        } else {
            tVar2.p0();
        }
        p1.a0.j(oVar2, b3.k.f17275g, oVar);
        p1.a0.j(n1VarL, b3.k.f17274f, oVar);
        p1.a0.j(tVarI, b3.k.f17272d, oVar);
        b3.i iVar = b3.k.f17278j;
        if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
            a2.c.u(iHashCode, tVar2, iHashCode, iVar);
        }
        tVar2.p(true);
    }

    public static j0 c(float f11) {
        return new j0(f11, 0, 0, 0);
    }

    public static final z0 d(b bVar, p1.o oVar) {
        return new z0(bVar, (y3.c) ((p1.t) oVar).j(c3.z1.f19497h));
    }

    public static final b2.t e(b2.t tVar) {
        return fg.a.i(tVar, new j2(0));
    }

    public static final b2.t f(b2.t tVar) {
        return fg.a.i(tVar, new k2());
    }

    public static final b2.t g(b2.t tVar) {
        return fg.a.i(tVar, new j2(1));
    }

    public static final b2.t h(b2.t tVar) {
        return fg.a.i(tVar, new j2(3));
    }

    public static final a1 i(Insets insets) {
        return new a1(insets.left, insets.top, insets.right, insets.bottom);
    }

    public static final b2.t j(b2.t tVar, g2 g2Var) {
        return fg.a.i(tVar, new b00.r0(g2Var, 17));
    }
}
