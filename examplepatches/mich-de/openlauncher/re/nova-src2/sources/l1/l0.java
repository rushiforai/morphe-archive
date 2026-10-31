package l1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f73575a = new l0();

    /* renamed from: b, reason: collision with root package name */
    public static final float f73576b;

    static {
        float f11 = o1.y.f79189a;
        float f12 = o1.y.f79191c;
        f73576b = 640;
    }

    public final void a(b2.t tVar, float f11, float f12, i2.v0 v0Var, long j11, p1.o oVar, int i5) {
        float f13;
        float f14;
        b2.t tVar2;
        i2.v0 v0Var2;
        long j12;
        p1.t tVar3;
        float f15;
        float f16;
        b2.t tVar4;
        i2.v0 v0Var3;
        long j13;
        p1.t tVar5 = (p1.t) oVar;
        tVar5.d0(-1364277227);
        if (((i5 | 9654) & 9363) == 9362 && tVar5.E()) {
            tVar5.V();
            tVar4 = tVar;
            f15 = f11;
            f16 = f12;
            v0Var3 = v0Var;
            j13 = j11;
            tVar3 = tVar5;
        } else {
            tVar5.X();
            if ((i5 & 1) == 0 || tVar5.B()) {
                f13 = o1.y.f79190b;
                f14 = o1.y.f79189a;
                s0.a aVar = ((z5) tVar5.j(a6.f73027a)).f74368e;
                long jE = g1.e(tVar5, 19);
                tVar2 = b2.r.f17024a;
                v0Var2 = aVar;
                j12 = jE;
            } else {
                tVar5.V();
                tVar2 = tVar;
                f13 = f11;
                f14 = f12;
                v0Var2 = v0Var;
                j12 = j11;
            }
            tVar5.q();
            String strW = t2.c.w(tVar5, 2132018129);
            b2.t tVarL = androidx.compose.foundation.layout.d.l(tVar2, 0.0f, d6.f73190a, 1);
            boolean zF = tVar5.f(strW);
            Object objP = tVar5.P();
            if (zF || objP == p1.n.f81514a) {
                objP = new j3.o(strW, 2);
                tVar5.m0(objP);
            }
            tVar3 = tVar5;
            t7.a(j3.n.b(tVarL, false, (Function1) objP), v0Var2, j12, 0L, 0.0f, 0.0f, null, x1.f.d(-1039573072, new j0(f13, f14), tVar5), tVar3, 12582912, 120);
            f15 = f13;
            f16 = f14;
            tVar4 = tVar2;
            v0Var3 = v0Var2;
            j13 = j12;
        }
        p1.t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new k0(this, tVar4, f15, f16, v0Var3, j13, i5);
        }
    }
}
