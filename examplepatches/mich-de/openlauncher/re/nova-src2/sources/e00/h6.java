package e00;

import android.content.Context;
import android.graphics.Color;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import kotlin.UInt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class h6 {

    /* renamed from: a, reason: collision with root package name */
    public static final com.google.android.gms.internal.consent_sdk.w f50482a = new com.google.android.gms.internal.consent_sdk.w("SurfaceColor", "prefKey", 2);

    /* renamed from: b, reason: collision with root package name */
    public static final String f50483b = "Dynamic";

    /* renamed from: c, reason: collision with root package name */
    public static final String f50484c = "Custom";

    public static final void a(p6.t tVar, cw.r3 r3Var, tz.u uVar, x1.e eVar, p1.o oVar, int i5) {
        tz.o oVar2;
        int i11;
        float f11;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1538337945);
        if (((i5 | (tVar2.f(uVar) ? 256 : 128)) & 1153) == 1152 && tVar2.E()) {
            tVar2.V();
        } else {
            g30.b bVar = (g30.b) g30.b.f57016l.h((Context) tVar2.j(AndroidCompositionLocals_androidKt.f14166b));
            int i12 = bVar.f57020d;
            tVar2.b0(-1029602406);
            Object objP = tVar2.P();
            p1.g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = androidx.compose.runtime.d.k(Integer.valueOf(tz.n.b(uVar.f90171b)));
                tVar2.m0(objP);
            }
            p1.e1 e1Var = (p1.e1) objP;
            Object objF = a2.c.f(-1029599997, tVar2, false);
            if (objF == g1Var) {
                objF = androidx.compose.runtime.d.k(new tz.n(tz.n.i(255, uVar.f90171b)));
                tVar2.m0(objF);
            }
            p1.e1 e1Var2 = (p1.e1) objF;
            Object objF2 = a2.c.f(-1029597228, tVar2, false);
            if (objF2 == g1Var) {
                objF2 = androidx.compose.runtime.d.k(new tz.n(uVar.f90172c));
                tVar2.m0(objF2);
            }
            p1.e1 e1Var3 = (p1.e1) objF2;
            Object objF3 = a2.c.f(-1029594891, tVar2, false);
            if (objF3 == g1Var) {
                objF3 = androidx.compose.runtime.d.k(new tz.n(uVar.f90173d));
                tVar2.m0(objF3);
            }
            p1.e1 e1Var4 = (p1.e1) objF3;
            Object objF4 = a2.c.f(-1029592581, tVar2, false);
            if (objF4 == g1Var) {
                objF4 = androidx.compose.runtime.d.k(Integer.valueOf(uVar.f90175f));
                tVar2.m0(objF4);
            }
            p1.e1 e1Var5 = (p1.e1) objF4;
            Object objF5 = a2.c.f(-1029589985, tVar2, false);
            if (objF5 == g1Var) {
                objF5 = androidx.compose.runtime.d.k(Integer.valueOf(uVar.f90176g));
                tVar2.m0(objF5);
            }
            p1.e1 e1Var6 = (p1.e1) objF5;
            Object objF6 = a2.c.f(-1029587481, tVar2, false);
            if (objF6 == g1Var) {
                objF6 = androidx.compose.runtime.d.k(0);
                tVar2.m0(objF6);
            }
            p1.e1 e1Var7 = (p1.e1) objF6;
            Object objF7 = a2.c.f(-1029585823, tVar2, false);
            if (objF7 == g1Var) {
                int i13 = uVar.f90170a;
                tz.r.Companion.getClass();
                if (tz.c.a(i13, 0)) {
                    f11 = 200.0f;
                } else {
                    float[] fArr = new float[3];
                    Color.colorToHSV(uVar.f90170a, fArr);
                    f11 = fArr[0];
                }
                objF7 = androidx.compose.runtime.d.k(Float.valueOf(f11));
                tVar2.m0(objF7);
            }
            p1.e1 e1Var8 = (p1.e1) objF7;
            Object objF8 = a2.c.f(-1029579317, tVar2, false);
            if (objF8 == g1Var) {
                int i14 = uVar.f90170a;
                tz.r.Companion.getClass();
                objF8 = androidx.compose.runtime.d.k(Float.valueOf(tz.c.a(i14, 0) ? 248.0f : vz.a.a(uVar.f90170a).f93388a));
                tVar2.m0(objF8);
            }
            p1.e1 e1Var9 = (p1.e1) objF8;
            Object objF9 = a2.c.f(-1029572107, tVar2, false);
            String str = f50483b;
            if (objF9 == g1Var) {
                int i15 = uVar.f90170a;
                tz.r.Companion.getClass();
                objF9 = androidx.compose.runtime.d.k(new gy.t(tz.c.a(i15, 0) ? str : f50484c));
                tVar2.m0(objF9);
            }
            p1.e1 e1Var10 = (p1.e1) objF9;
            tVar2.p(false);
            tVar2.b0(-1029565859);
            if (Intrinsics.b(((gy.t) e1Var10.getValue()).f58542a, str)) {
                oVar2 = bVar.f57023g;
            } else {
                float fFloatValue = ((Number) e1Var9.getValue()).floatValue();
                float fFloatValue2 = ((Number) e1Var8.getValue()).floatValue();
                tVar2.b0(-1029562536);
                boolean zC = tVar2.c(fFloatValue) | tVar2.c(fFloatValue2);
                Object objP2 = tVar2.P();
                if (zC || objP2 == g1Var) {
                    tz.o oVar3 = tz.o.f90164b;
                    int i16 = i2.s.n;
                    int iR = i2.r0.r(lm.e.r(((Number) e1Var8.getValue()).floatValue(), 1.0f, 0.8f));
                    UInt.Companion companion = UInt.f71696b;
                    objP2 = x7.f.z(iR);
                    tVar2.m0(objP2);
                }
                oVar2 = (tz.o) objP2;
                tVar2.p(false);
            }
            tVar2.p(false);
            if (Intrinsics.b(((gy.t) e1Var10.getValue()).f58542a, str)) {
                tz.r.Companion.getClass();
                i11 = 0;
            } else {
                int i17 = i2.s.n;
                int iR2 = i2.r0.r(lm.e.r(((Number) e1Var8.getValue()).floatValue(), 1.0f, 0.8f));
                UInt.Companion companion2 = UInt.f71696b;
                i11 = iR2;
            }
            eVar.invoke(new tz.u(i11, tz.n.i(((Number) e1Var.getValue()).intValue(), ((tz.n) e1Var2.getValue()).f90163a), ((tz.n) e1Var3.getValue()).f90163a, ((tz.n) e1Var4.getValue()).f90163a, 112), tVar2, 48);
            int iF = tz.n.f(((tz.n) e1Var2.getValue()).f90163a, oVar2);
            long jB = i2.r0.b(iF);
            int iJ = r4.a.j(iF, i12);
            UInt.Companion companion3 = UInt.f71696b;
            tz.o oVar4 = oVar2;
            long jB2 = i2.r0.b(tz.n.d(((tz.n) e1Var3.getValue()).f90163a, oVar4, iF, iJ, ((Number) e1Var5.getValue()).intValue()));
            long jB3 = i2.r0.b(tz.n.d(((tz.n) e1Var4.getValue()).f90163a, oVar4, iF, iJ, ((Number) e1Var6.getValue()).intValue()));
            float f12 = vz.a.a(iF).f93390c;
            boolean z11 = (f12 > 30.0f && f12 > vz.a.a(i2.r0.r(jB2)).f93390c) || f12 > 80.0f;
            float f13 = 0;
            tVar2.b0(-1029514016);
            Object objP3 = tVar2.P();
            if (objP3 == g1Var) {
                tz.n.Companion.getClass();
                objP3 = androidx.compose.runtime.d.k(new tz.n(tz.n.f90140b));
                tVar2.m0(objP3);
            }
            p1.e1 e1Var11 = (p1.e1) objP3;
            Object objF10 = a2.c.f(-1029511232, tVar2, false);
            if (objF10 == g1Var) {
                tz.n.Companion.getClass();
                objF10 = androidx.compose.runtime.d.k(new tz.n(tz.n.f90140b));
                tVar2.m0(objF10);
            }
            p1.e1 e1Var12 = (p1.e1) objF10;
            Object objF11 = a2.c.f(-1029508373, tVar2, false);
            if (objF11 == g1Var) {
                objF11 = androidx.compose.runtime.d.k(Boolean.FALSE);
                tVar2.m0(objF11);
            }
            p1.e1 e1Var13 = (p1.e1) objF11;
            tVar2.p(false);
            boolean z12 = ((Number) e1Var7.getValue()).intValue() != 0;
            tVar2.b0(-1029506071);
            Object objP4 = tVar2.P();
            if (objP4 == g1Var) {
                objP4 = new u5(e1Var7, 6);
                tVar2.m0(objP4);
            }
            tVar2.p(false);
            mk.v.b(z12, (Function0) objP4, 48, tVar2, 0);
            mk.v.f(z11, jB, jB3, jB2, x1.f.d(511629015, new g6(jB, e1Var13, e1Var7, f13, iJ, f13, e1Var5, e1Var11, e1Var3, e1Var12, e1Var4, iF, i12, oVar4, e1Var, e1Var6, e1Var2, jB3, e1Var10, e1Var8, e1Var9), tVar2), tVar2, 24576);
        }
        p1.t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b20.g(i5, 4, tVar, r3Var, uVar, eVar);
        }
    }

    public static final void b(p1.e1 e1Var, int i5) {
        e1Var.setValue(Integer.valueOf(i5));
    }
}
