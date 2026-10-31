package t0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class b implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final b f87906b = new b(0);

    /* renamed from: c, reason: collision with root package name */
    public static final b f87907c = new b(1);

    /* renamed from: d, reason: collision with root package name */
    public static final b f87908d = new b(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87909a;

    public /* synthetic */ b(int i5) {
        this.f87909a = i5;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f87909a) {
            case 0:
                b2.t tVar = (b2.t) obj;
                ((Number) obj3).intValue();
                p1.t tVar2 = (p1.t) ((p1.o) obj2);
                tVar2.b0(-2126899193);
                long j11 = ((e1.g1) tVar2.j(e1.h1.f51306a)).f51304a;
                boolean zE = tVar2.e(j11);
                Object objP = tVar2.P();
                if (zE || objP == p1.n.f81514a) {
                    objP = new a(j11, 0);
                    tVar2.m0(objP);
                }
                b2.t tVarThen = tVar.then(androidx.compose.ui.draw.a.b(b2.r.f17024a, (Function1) objP));
                tVar2.p(false);
                break;
            case 1:
                Function2 function2 = (Function2) obj;
                p1.o oVar = (p1.o) obj2;
                int iIntValue = ((Number) obj3).intValue();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p1.t) oVar).h(function2) ? 4 : 2;
                }
                p1.t tVar3 = (p1.t) oVar;
                if (tVar3.S(iIntValue & 1, (iIntValue & 19) != 18)) {
                    function2.invoke(tVar3, Integer.valueOf(iIntValue & 14));
                } else {
                    tVar3.V();
                }
                break;
            default:
                Function2 function22 = (Function2) obj;
                p1.o oVar2 = (p1.o) obj2;
                int iIntValue2 = ((Number) obj3).intValue();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p1.t) oVar2).h(function22) ? 4 : 2;
                }
                p1.t tVar4 = (p1.t) oVar2;
                if (tVar4.S(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    function22.invoke(tVar4, Integer.valueOf(iIntValue2 & 14));
                } else {
                    tVar4.V();
                }
                break;
        }
        return Unit.f71706a;
    }
}
