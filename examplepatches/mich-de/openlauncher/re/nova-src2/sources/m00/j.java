package m00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kw.v3;

/* loaded from: classes4.dex */
public final class j implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f75573a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function2 f75574b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ List f75575c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f75576d;

    public j(List list, Function2 function2, List list2, boolean z11) {
        this.f75573a = list;
        this.f75574b = function2;
        this.f75575c = list2;
        this.f75576d = z11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int i5;
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
        boolean z11 = true;
        p1.t tVar = (p1.t) oVar;
        if (tVar.S(i5 & 1, (i5 & 147) != 146)) {
            t tVar2 = (t) this.f75573a.get(iIntValue);
            tVar.b0(-334348790);
            y20.d dVar = tVar2.f75639b;
            String strJ = p6.f.J(tVar2.f75638a, tVar);
            String str = tVar2.f75640c;
            tVar.b0(2067429807);
            Function2 function2 = this.f75574b;
            boolean zF = tVar.f(function2);
            List list = this.f75575c;
            boolean zH = zF | tVar.h(list);
            if ((((i5 & 112) ^ 48) <= 32 || !tVar.d(iIntValue)) && (i5 & 48) != 32) {
                z11 = false;
            }
            boolean z12 = zH | z11;
            Object objP = tVar.P();
            if (z12 || objP == p1.n.f81514a) {
                objP = new v3(function2, list, iIntValue, 1);
                tVar.m0(objP);
            }
            tVar.p(false);
            l.c(null, dVar, strJ, str, (Function1) objP, tVar2.f75641d, this.f75576d, tVar2.f75642e, tVar, 0, 1);
            tVar.p(false);
        } else {
            tVar.V();
        }
        return Unit.f71706a;
    }
}
