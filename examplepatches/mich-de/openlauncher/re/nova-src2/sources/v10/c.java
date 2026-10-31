package v10;

import androidx.compose.foundation.layout.e;
import b2.r;
import b3.i;
import b3.k;
import b3.l;
import i2.s;
import k0.p;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.b3;
import l1.s1;
import p1.a0;
import p1.n1;
import p1.o;
import p1.t;
import x7.f;
import z2.r0;

/* loaded from: classes4.dex */
public final class c implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final c f91903b = new c(0);

    /* renamed from: c, reason: collision with root package name */
    public static final c f91904c = new c(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91905a;

    public /* synthetic */ c(int i5) {
        this.f91905a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0059  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f91905a) {
            case 0:
                o oVar = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        r rVar = r.f17024a;
                        b2.t tVarO = e.o(rVar, 80);
                        r0 r0VarD = p.d(b2.d.f17001e, false);
                        t tVar2 = (t) oVar;
                        int iHashCode = Long.hashCode(tVar2.T);
                        n1 n1VarL = tVar2.l();
                        b2.t tVarI = fg.a.I(tVarO, oVar);
                        l.Po.getClass();
                        Function0 function0 = k.f17270b;
                        tVar2.f0();
                        if (tVar2.S) {
                            tVar2.k(function0);
                        } else {
                            tVar2.p0();
                        }
                        a0.j(r0VarD, k.f17275g, oVar);
                        a0.j(n1VarL, k.f17274f, oVar);
                        i iVar = k.f17278j;
                        if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                        }
                        a0.j(tVarI, k.f17272d, oVar);
                        b3.a(ul.b.V(2131231456, oVar, 0), null, e.o(rVar, 48), ((s) tVar2.j(s1.f73932a)).f61148a, oVar, 432, 0);
                        tVar2.p(true);
                    }
                }
                break;
            default:
                o oVar2 = (o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    t tVar3 = (t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        b3.a(ul.b.V(2131231434, oVar2, 0), f.Y(oVar2, 2132019514), null, 0L, oVar2, 0, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
