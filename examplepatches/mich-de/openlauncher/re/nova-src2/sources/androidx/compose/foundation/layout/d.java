package androidx.compose.foundation.layout;

import b00.w0;
import b2.t;
import c3.q2;
import hv.u1;
import k0.i1;
import k0.m1;
import k0.o1;
import k0.p1;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import y3.n;

/* loaded from: classes.dex */
public abstract class d {
    public static p1 a(int i5, float f11, float f12) {
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f12 = 0;
        }
        return new p1(f11, f12, f11, f12);
    }

    public static final p1 b(float f11, float f12, float f13, float f14) {
        return new p1(f11, f12, f13, f14);
    }

    public static p1 c(float f11, float f12, float f13, int i5) {
        float f14 = u1.f60611a;
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f14 = 0;
        }
        if ((i5 & 4) != 0) {
            f12 = 0;
        }
        if ((i5 & 8) != 0) {
            f13 = 0;
        }
        return new p1(f11, f14, f12, f13);
    }

    public static final float d(o1 o1Var, n nVar) {
        return nVar == n.f96612a ? o1Var.c(nVar) : o1Var.b(nVar);
    }

    public static final float e(o1 o1Var, n nVar) {
        return nVar == n.f96612a ? o1Var.b(nVar) : o1Var.c(nVar);
    }

    public static final t f(t tVar, Function1 function1) {
        return tVar.then(new OffsetPxElement(function1, new w0(function1, 2)));
    }

    public static final t g(t tVar, float f11, float f12) {
        return tVar.then(new OffsetElement(f11, f12, new i1(0, f11, f12)));
    }

    public static t h(t tVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f12 = 0;
        }
        return g(tVar, f11, f12);
    }

    public static final t i(t tVar, o1 o1Var) {
        return tVar.then(new PaddingValuesElement(o1Var, new b00.t(o1Var, 19)));
    }

    public static final t j(t tVar, float f11) {
        return tVar.then(new PaddingElement(f11, f11, f11, f11, new m1(f11, 0)));
    }

    public static final t k(t tVar, float f11, float f12) {
        return tVar.then(new PaddingElement(f11, f12, f11, f12, new i1(1, f11, f12)));
    }

    public static t l(t tVar, float f11, float f12, int i5) {
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f12 = 0;
        }
        return k(tVar, f11, f12);
    }

    public static final t m(t tVar, final float f11, final float f12, final float f13, final float f14) {
        return tVar.then(new PaddingElement(f11, f12, f13, f14, new Function1() { // from class: k0.l1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                q2 q2Var = (q2) obj;
                q2Var.d("padding");
                q2Var.b().b("start", new y3.f(f11));
                q2Var.b().b("top", new y3.f(f12));
                q2Var.b().b("end", new y3.f(f13));
                q2Var.b().b("bottom", new y3.f(f14));
                return Unit.f71706a;
            }
        }));
    }

    public static t n(t tVar, float f11, float f12, float f13, float f14, int i5) {
        if ((i5 & 1) != 0) {
            f11 = 0;
        }
        if ((i5 & 2) != 0) {
            f12 = 0;
        }
        if ((i5 & 4) != 0) {
            f13 = 0;
        }
        if ((i5 & 8) != 0) {
            f14 = 0;
        }
        return m(tVar, f11, f12, f13, f14);
    }
}
