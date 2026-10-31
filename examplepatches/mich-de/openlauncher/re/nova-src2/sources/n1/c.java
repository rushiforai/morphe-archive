package n1;

import b2.t;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import l1.d1;
import l1.g1;
import p1.a0;
import p1.n1;
import p1.t1;
import p1.z2;
import z2.r0;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f77627a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final s0.g f77628b = s0.h.f86511a;

    /* renamed from: c, reason: collision with root package name */
    public static final float f77629c = 80;

    /* renamed from: d, reason: collision with root package name */
    public static final float f77630d = o1.g.f79062c;

    public final void a(o oVar, boolean z11, t tVar, long j11, long j12, float f11, p1.o oVar2, int i5) {
        float f12;
        long j13;
        int i11;
        long j14;
        long j15;
        float f13;
        long j16;
        p1.t tVar2 = (p1.t) oVar2;
        tVar2.d0(-1076870256);
        int i12 = i5 | (tVar2.f(oVar) ? 4 : 2) | (tVar2.g(z11) ? 32 : 16) | (tVar2.f(tVar) ? 256 : 128) | 74752;
        if ((599187 & i12) == 599186 && tVar2.E()) {
            tVar2.V();
            j15 = j11;
            j16 = j12;
            f13 = f11;
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                z2 z2Var = g1.f73330a;
                long j17 = ((d1) tVar2.j(z2Var)).G;
                long j18 = ((d1) tVar2.j(z2Var)).f73164s;
                f12 = f77629c;
                j13 = j18;
                i11 = i12 & (-523265);
                j14 = j17;
            } else {
                tVar2.V();
                j13 = j12;
                f12 = f11;
                i11 = i12 & (-523265);
                j14 = j11;
            }
            tVar2.q();
            float f14 = h.f77643a;
            t tVarC = androidx.compose.ui.draw.a.c(androidx.compose.foundation.layout.e.o(tVar, h.f77646d), e.f77635k);
            float f15 = f77630d;
            s0.g gVar = f77628b;
            float f16 = f12;
            t tVarB = androidx.compose.foundation.a.b(androidx.compose.ui.graphics.a.a(tVarC, new f(oVar, z11, f16, f15, gVar)), j14, gVar);
            r0 r0VarD = k0.p.d(b2.d.f17001e, false);
            int iHashCode = Long.hashCode(tVar2.T);
            n1 n1VarL = tVar2.l();
            t tVarI = fg.a.I(tVarB, tVar2);
            b3.l.Po.getClass();
            Function0 function0 = b3.k.f17270b;
            tVar2.f0();
            if (tVar2.S) {
                tVar2.k(function0);
            } else {
                tVar2.p0();
            }
            a0.j(r0VarD, b3.k.f17275g, tVar2);
            a0.j(n1VarL, b3.k.f17274f, tVar2);
            b3.i iVar = b3.k.f17278j;
            if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                a2.c.u(iHashCode, tVar2, iHashCode, iVar);
            }
            a0.j(tVarI, b3.k.f17272d, tVar2);
            a.a.j(Boolean.valueOf(z11), null, c0.f.i(100, 0, null, 6), null, x1.f.d(167807595, new a(j13, oVar), tVar2), tVar2, ((i11 >> 3) & 14) | 24960, 10);
            tVar2.p(true);
            j15 = j14;
            f13 = f16;
            j16 = j13;
        }
        t1 t1VarU = tVar2.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b(this, oVar, z11, tVar, j15, j16, f13, i5);
        }
    }
}
