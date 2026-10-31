package dv;

import f1.g5;
import f1.h5;
import f1.i5;
import k0.i2;
import k0.o1;
import k0.y1;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import p1.n1;
import p1.z2;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f49590b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f49591c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49592a;

    public /* synthetic */ a(int i5) {
        this.f49592a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0204  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f49592a) {
            case 0:
                y1 TextButton = (y1) obj;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                Intrinsics.g(TextButton, "$this$TextButton");
                if ((iIntValue & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g5.b(x7.f.Y(oVar, 2132020033), null, 0L, 0L, null, null, 0L, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                    }
                }
                break;
            default:
                o1 paddingValues = (o1) obj;
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                Intrinsics.g(paddingValues, "paddingValues");
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p1.t) oVar2).f(paddingValues) ? 4 : 2;
                }
                if ((iIntValue2 & 19) == 18) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        b2.t tVarI = androidx.compose.foundation.layout.d.i(androidx.compose.foundation.layout.e.f13973c, paddingValues);
                        k0.e eVar = k0.k.f70657c;
                        k0.x xVarA = k0.w.a(eVar, b2.d.f17009m, oVar2, 0);
                        p1.t tVar3 = (p1.t) oVar2;
                        int iHashCode = Long.hashCode(tVar3.T);
                        n1 n1VarL = tVar3.l();
                        b2.t tVarI2 = fg.a.I(tVarI, oVar2);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar3.f0();
                        if (tVar3.S) {
                            tVar3.k(function0);
                        } else {
                            tVar3.p0();
                        }
                        b3.i iVar = b3.k.f17275g;
                        p1.a0.j(xVarA, iVar, oVar2);
                        b3.i iVar2 = b3.k.f17274f;
                        p1.a0.j(n1VarL, iVar2, oVar2);
                        b3.i iVar3 = b3.k.f17278j;
                        if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar3, iHashCode, iVar3);
                        }
                        b3.i iVar4 = b3.k.f17272d;
                        p1.a0.j(tVarI2, iVar4, oVar2);
                        b2.r rVar = b2.r.f17024a;
                        i2.b(k0.y.a(rVar), oVar2);
                        b2.t tVarL = androidx.compose.foundation.layout.d.l(androidx.compose.foundation.layout.e.e(rVar, 1.0f), 0.0f, a.a.M(oVar2, 2131166481), 1);
                        hw.n nVar = hw.p.f60765a;
                        b2.t tVarI3 = androidx.compose.foundation.layout.d.i(tVarL, hw.r.j());
                        k0.x xVarA2 = k0.w.a(eVar, b2.d.n, oVar2, 48);
                        int iHashCode2 = Long.hashCode(tVar3.T);
                        n1 n1VarL2 = tVar3.l();
                        b2.t tVarI4 = fg.a.I(tVarI3, oVar2);
                        tVar3.f0();
                        if (tVar3.S) {
                            tVar3.k(function0);
                        } else {
                            tVar3.p0();
                        }
                        p1.a0.j(xVarA2, iVar, oVar2);
                        p1.a0.j(n1VarL2, iVar2, oVar2);
                        if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode2))) {
                            a2.c.u(iHashCode2, tVar3, iHashCode2, iVar3);
                        }
                        p1.a0.j(tVarI4, iVar4, oVar2);
                        bh.g.h(ul.b.V(2131232291, oVar2, 0), null, androidx.compose.foundation.layout.d.n(rVar, 0.0f, 0.0f, 0.0f, b0.f49596a, 7), null, null, 0.0f, null, oVar2, 432, 120);
                        String strY = x7.f.Y(oVar2, 2132020037);
                        z2 z2Var = i5.f53671b;
                        p1.t tVar4 = (p1.t) oVar2;
                        g5.b(strY, androidx.compose.foundation.layout.d.n(rVar, 0.0f, 0.0f, 0.0f, b0.f49597b, 7), 0L, 0L, null, null, 0L, new x3.k(3), 0L, 0, false, 0, 0, null, ((h5) tVar4.j(z2Var)).f53616d, oVar2, 48, 0, 65020);
                        String strY2 = x7.f.Y(oVar2, 2132020036);
                        x3.k kVar = new x3.k(3);
                        long j11 = ((h5) tVar4.j(z2Var)).f53621i.f75956a.f75884b;
                        w20.h.b(j11);
                        g5.b(strY2, null, 0L, 0L, null, null, 0L, kVar, w20.h.m(y3.p.c(j11) * 1.3f, 1095216660480L & j11), 0, false, 0, 0, null, null, oVar2, 0, 0, 129534);
                        tVar3.p(true);
                        i2.b(k0.y.a(rVar), oVar2);
                        tVar3.p(true);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
