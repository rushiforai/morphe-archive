package t00;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import l1.s1;
import m3.p0;

/* loaded from: classes4.dex */
public final class b implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f88323b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f88324c = new b(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88325a;

    public /* synthetic */ b(int i5) {
        this.f88325a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0040  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f88325a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                ((Number) obj3).intValue();
                b2.t tVarE = androidx.compose.foundation.layout.e.e(androidx.compose.foundation.layout.d.j(b2.r.f17024a, 16), 1.0f);
                String strY = x7.f.Y(oVar, 2132018015);
                p1.t tVar = (p1.t) oVar;
                tVar.b0(1754805648);
                long jB = ((p0) tVar.j(g9.f73360a)).b();
                if (jB == 16) {
                    jB = ((i2.s) tVar.j(s1.f73932a)).f61148a;
                }
                tVar.p(false);
                g9.b(strY, tVarE, i2.s.b(0.7f, jB), 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 48, 0, 131064);
                break;
            default:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar2).g(zBooleanValue) ? 4 : 2;
                }
                if ((iIntValue & 19) == 18) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        a.a.n(zBooleanValue, oVar2, iIntValue & 14);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
