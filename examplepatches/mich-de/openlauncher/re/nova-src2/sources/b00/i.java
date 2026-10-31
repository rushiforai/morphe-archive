package b00;

import e10.z2;
import k0.v1;
import k0.x1;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.b3;
import l1.g9;

/* loaded from: classes.dex */
public final class i implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final i f16364b = new i(0);

    /* renamed from: c, reason: collision with root package name */
    public static final i f16365c = new i(1);

    /* renamed from: d, reason: collision with root package name */
    public static final i f16366d = new i(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16367a;

    public /* synthetic */ i(int i5) {
        this.f16367a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0187  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16367a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        b3.b(z2.f0(), x7.f.Y(oVar, 2132018243), null, ((l1.d1) ((p1.t) oVar).j(l1.g1.f73330a)).f73162q, oVar, 0, 4);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    }
                }
                break;
            default:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        b2.r rVar = b2.r.f17024a;
                        b2.t tVarE = androidx.compose.foundation.layout.e.e(rVar, 1.0f);
                        float f11 = 16;
                        x1 x1VarA = v1.a(k0.k.g(f11), b2.d.f17007k, oVar3, 54);
                        p1.t tVar4 = (p1.t) oVar3;
                        int iHashCode = Long.hashCode(tVar4.T);
                        p1.n1 n1VarL = tVar4.l();
                        b2.t tVarI = fg.a.I(tVarE, oVar3);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar4.f0();
                        if (tVar4.S) {
                            tVar4.k(function0);
                        } else {
                            tVar4.p0();
                        }
                        p1.a0.j(x1VarA, b3.k.f17275g, oVar3);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar3);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar4.S || !Intrinsics.b(tVar4.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar4, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar3);
                        bh.g.h(ul.b.V(2131231665, oVar3, 0), null, androidx.compose.foundation.layout.e.o(rVar, 28), null, null, 0.0f, new i2.n(u90.b.l(oVar3, 2131100662), 5), oVar3, 432, 56);
                        g9.b(x7.f.Y(oVar3, 2132020390), androidx.compose.foundation.layout.d.n(rVar, 0.0f, 0.0f, f11, 0.0f, 11), 0L, w20.h.j(24), null, q3.b0.f83532f, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 199728, 0, 131028);
                        tVar4.p(true);
                        float f12 = 12;
                        g9.b(x7.f.Y(oVar3, 2132020353), androidx.compose.foundation.layout.d.n(z2.z(rVar, 0.75f), 0.0f, f12, f11, f12, 1), 0L, w20.h.j(14), null, null, null, 0L, null, null, w20.h.j(16), 0, false, 0, 0, null, null, oVar3, 3072, 6, 130036);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
