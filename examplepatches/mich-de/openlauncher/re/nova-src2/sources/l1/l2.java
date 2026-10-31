package l1;

import android.content.res.Configuration;
import android.view.View;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public abstract class l2 {

    /* renamed from: a, reason: collision with root package name */
    public static final float f73578a = 16;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v1, types: [java.lang.Object, p1.o, p1.t] */
    /* JADX WARN: Type inference failed for: r5v10, types: [x1.e] */
    public static final void a(boolean z11, Function1 function1, b2.t tVar, x1.e eVar, p1.o oVar, int i5) {
        int i11;
        y3.c cVar;
        Object obj;
        int i12;
        View view;
        int i13;
        int i14;
        int i15;
        p1.e1 e1Var;
        boolean z12;
        x1.e eVar2;
        boolean z13 = z11;
        Function1 function12 = function1;
        ?? r14 = (p1.t) oVar;
        r14.d0(2067579792);
        if ((i5 & 6) == 0) {
            i11 = (r14.g(z13) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= r14.h(function12) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= r14.f(tVar) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= r14.h(eVar) ? 2048 : 1024;
        }
        if ((i11 & 1171) == 1170 && r14.E()) {
            r14.V();
            eVar2 = eVar;
        } else {
            Configuration configuration = (Configuration) r14.j(AndroidCompositionLocals_androidKt.f14165a);
            View view2 = (View) r14.j(AndroidCompositionLocals_androidKt.f14170f);
            y3.c cVar2 = (y3.c) r14.j(c3.z1.f19497h);
            int iMo96roundToPx0680j_4 = cVar2.mo96roundToPx0680j_4(k3.f73530a);
            Object objP = r14.P();
            Object obj2 = p1.n.f81514a;
            if (objP == obj2) {
                objP = androidx.compose.runtime.d.k(null);
                r14.m0(objP);
            }
            p1.e1 e1Var2 = (p1.e1) objP;
            Object objP2 = r14.P();
            if (objP2 == obj2) {
                objP2 = androidx.compose.runtime.d.g(0);
                r14.m0(objP2);
            }
            p1.o2 o2Var = (p1.o2) objP2;
            Object objP3 = r14.P();
            if (objP3 == obj2) {
                objP3 = androidx.compose.runtime.d.g(0);
                r14.m0(objP3);
            }
            p1.o2 o2Var2 = (p1.o2) objP3;
            Object objP4 = r14.P();
            if (objP4 == obj2) {
                objP4 = new g2.s();
                r14.m0(objP4);
            }
            g2.s sVar = (g2.s) objP4;
            c3.c3 c3Var = (c3.c3) r14.j(c3.z1.f19503p);
            String strW = t2.c.w(r14, 2132018165);
            String strW2 = t2.c.w(r14, 2132018164);
            int i16 = i11;
            String strW3 = t2.c.w(r14, 2132018166);
            Object objP5 = r14.P();
            if (objP5 == obj2) {
                objP5 = androidx.compose.runtime.d.k(new f3());
                r14.m0(objP5);
            }
            p1.e1 e1Var3 = (p1.e1) objP5;
            int i17 = i16 & 14;
            int i18 = i16 & 112;
            boolean zF = (i17 == 4) | (i18 == 32) | r14.f(configuration) | r14.f(view2) | r14.f(cVar2);
            Object objP6 = r14.P();
            if (zF || objP6 == obj2) {
                cVar = cVar2;
                obj = obj2;
                i12 = i18;
                view = view2;
                i13 = i16;
                i14 = i17;
                i15 = iMo96roundToPx0680j_4;
                objP6 = new j2(sVar, z13, strW, strW2, strW3, c3Var, e1Var3, function12, o2Var, o2Var2);
                sVar = sVar;
                z13 = z13;
                function12 = function12;
                r14.m0(objP6);
            } else {
                cVar = cVar2;
                obj = obj2;
                i14 = i17;
                i12 = i18;
                i13 = i16;
                i15 = iMo96roundToPx0680j_4;
                view = view2;
            }
            j2 j2Var = (j2) objP6;
            boolean zH = r14.h(view) | r14.d(i15);
            Object objP7 = r14.P();
            if (zH || objP7 == obj) {
                objP7 = new g2.c0(view, i15, e1Var2, o2Var, o2Var2);
                e1Var = e1Var2;
                r14.m0(objP7);
            } else {
                e1Var = e1Var2;
            }
            b2.t tVarB = androidx.compose.ui.layout.b.b(tVar, (Function1) objP7);
            z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
            int iHashCode = Long.hashCode(r14.T);
            p1.n1 n1VarL = r14.l();
            b2.t tVarI = fg.a.I(tVarB, r14);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            r14.f0();
            if (r14.S) {
                r14.k(function0);
            } else {
                r14.p0();
            }
            p1.a0.j(r0VarD, b3.k.f17275g, r14);
            p1.a0.j(n1VarL, b3.k.f17274f, r14);
            b3.i iVar = b3.k.f17278j;
            if (r14.S || !Intrinsics.b(r14.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, r14, iHashCode, iVar);
            }
            p1.a0.j(tVarI, b3.k.f17272d, r14);
            ?? r52 = eVar;
            r52.invoke(j2Var, r14, Integer.valueOf((i13 >> 6) & 112));
            r14.p(true);
            r14.b0(426363998);
            if (z13) {
                boolean zH2 = r14.h(view) | r14.d(i15);
                Object objP8 = r14.P();
                if (zH2 || objP8 == obj) {
                    objP8 = new g2(view, i15, e1Var, o2Var2);
                    r14.m0(objP8);
                }
                z12 = false;
                b(view, cVar, (Function0) objP8, r14, 0);
            } else {
                z12 = false;
            }
            r14.p(z12);
            int i19 = i14;
            boolean z14 = i19 == 4;
            Object objP9 = r14.P();
            if (z14 || objP9 == obj) {
                objP9 = new h.d(z13, sVar);
                r14.m0(objP9);
            }
            p1.o0.h((Function0) objP9, r14);
            boolean z15 = i12 == 32;
            Object objP10 = r14.P();
            if (z15 || objP10 == obj) {
                objP10 = new c3.c1(function12, 14);
                r14.m0(objP10);
            }
            mk.v.b(z13, (Function0) objP10, i19, r14, 0);
            eVar2 = r52;
        }
        p1.t1 t1VarU = r14.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1(z13, function12, tVar, eVar2, i5, 1);
        }
    }

    public static final void b(View view, y3.c cVar, Function0 function0, p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1319522472);
        int i11 = (tVar.h(view) ? 4 : 2) | i5 | (tVar.f(cVar) ? 32 : 16);
        if ((i5 & 384) == 0) {
            i11 |= tVar.h(function0) ? 256 : 128;
        }
        if ((i11 & 147) == 146 && tVar.E()) {
            tVar.V();
        } else {
            boolean zH = ((i11 & 896) == 256) | tVar.h(view);
            Object objP = tVar.P();
            if (zH || objP == p1.n.f81514a) {
                objP = new b0.e(8, view, function0);
                tVar.m0(objP);
            }
            p1.o0.a(view, cVar, (Function1) objP, tVar);
        }
        p1.t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new c4.c(view, cVar, function0, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0021  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final int c(int i5, h2.c cVar, h2.c cVar2) {
        int iB;
        float f11 = cVar.f59019b;
        float f12 = i5;
        float f13 = f11 + f12;
        float f14 = cVar.f59021d;
        float f15 = f14 - f12;
        float f16 = cVar2.f59019b;
        if (f16 <= f14) {
            float f17 = cVar2.f59021d;
            iB = f17 < f11 ? MathKt.b(f15 - f13) : MathKt.b(Math.max(f16 - f13, f15 - f17));
        }
        return Math.max(iB, 0);
    }
}
