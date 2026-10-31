package m00;

import com.google.android.gms.internal.measurement.k2;
import e10.z2;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import p1.n1;
import z2.r0;

/* loaded from: classes4.dex */
public final class n implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f75605b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f75606c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ List f75607d;

    public /* synthetic */ n(List list, Function2 function2, boolean z11, int i5) {
        this.f75604a = i5;
        this.f75607d = list;
        this.f75605b = function2;
        this.f75606c = z11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int i5;
        int i11;
        switch (this.f75604a) {
            case 0:
                m0.b bVar = (m0.b) obj;
                int iIntValue = ((Number) obj2).intValue();
                p1.o oVar = (p1.o) obj3;
                int iIntValue2 = ((Number) obj4).intValue();
                if ((iIntValue2 & 6) == 0) {
                    i5 = (((p1.t) oVar).f(bVar) ? 4 : 2) | iIntValue2;
                } else {
                    i5 = iIntValue2;
                }
                if ((iIntValue2 & 48) == 0) {
                    i5 |= ((p1.t) oVar).d(iIntValue) ? 32 : 16;
                }
                p1.t tVar = (p1.t) oVar;
                if (tVar.S(i5 & 1, (i5 & 147) != 146)) {
                    m mVar = (m) ((ArrayList) this.f75607d).get(iIntValue);
                    tVar.b0(1787536745);
                    boolean z11 = mVar instanceof e;
                    b2.r rVar = b2.r.f17024a;
                    if (z11) {
                        tVar.b0(-1604904423);
                        l0.b(androidx.compose.foundation.layout.d.l(rVar, 8, 0.0f, 2), (e) mVar, this.f75605b, this.f75606c, tVar, 6, 0);
                        tVar.p(false);
                    } else if (mVar instanceof f) {
                        tVar.b0(-1604893948);
                        b2.t tVarG = androidx.compose.foundation.layout.e.g(rVar, 40);
                        r0 r0VarD = k0.p.d(b2.d.f17000d, false);
                        int iHashCode = Long.hashCode(tVar.T);
                        n1 n1VarL = tVar.l();
                        b2.t tVarI = fg.a.I(tVarG, tVar);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar.f0();
                        if (tVar.S) {
                            tVar.k(function0);
                        } else {
                            tVar.p0();
                        }
                        p1.a0.j(r0VarD, b3.k.f17275g, tVar);
                        p1.a0.j(n1VarL, b3.k.f17274f, tVar);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, tVar);
                        z2.c(0, 2, null, ((f) mVar).f75541a, tVar);
                        tVar.p(true);
                        tVar.p(false);
                    } else {
                        if (!(mVar instanceof t)) {
                            throw k2.q(-1604905510, tVar, false);
                        }
                        tVar.b0(-1604887145);
                        b2.t tVarL = androidx.compose.foundation.layout.d.l(rVar, 24, 0.0f, 2);
                        t tVar2 = (t) mVar;
                        y20.d dVar = tVar2.f75639b;
                        String strJ = p6.f.J(tVar2.f75638a, tVar);
                        String str = tVar2.f75640c;
                        tVar.b0(-1604878652);
                        Function2 function2 = this.f75605b;
                        boolean zF = tVar.f(mVar) | tVar.f(function2);
                        Object objP = tVar.P();
                        if (zF || objP == p1.n.f81514a) {
                            objP = new c9.h(3, function2, tVar2);
                            tVar.m0(objP);
                        }
                        tVar.p(false);
                        l.c(tVarL, dVar, strJ, str, (Function1) objP, tVar2.f75641d, this.f75606c, tVar2.f75642e, tVar, 6, 0);
                        tVar = tVar;
                        tVar.p(false);
                    }
                    tVar.p(false);
                } else {
                    tVar.V();
                }
                return Unit.f71706a;
            default:
                m0.b bVar2 = (m0.b) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p1.o oVar2 = (p1.o) obj3;
                int iIntValue4 = ((Number) obj4).intValue();
                if ((iIntValue4 & 6) == 0) {
                    i11 = (((p1.t) oVar2).f(bVar2) ? 4 : 2) | iIntValue4;
                } else {
                    i11 = iIntValue4;
                }
                if ((iIntValue4 & 48) == 0) {
                    i11 |= ((p1.t) oVar2).d(iIntValue3) ? 32 : 16;
                }
                p1.t tVar3 = (p1.t) oVar2;
                if (tVar3.S(i11 & 1, (i11 & 147) != 146)) {
                    e eVar = (e) this.f75607d.get(iIntValue3);
                    tVar3.b0(-1477692082);
                    l0.b(null, eVar, this.f75605b, this.f75606c, tVar3, 0, 1);
                    tVar3.p(false);
                } else {
                    tVar3.V();
                }
                return Unit.f71706a;
        }
    }
}
