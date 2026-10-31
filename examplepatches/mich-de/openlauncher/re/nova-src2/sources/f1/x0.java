package f1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class x0 implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final x0 f54083b = new x0(0);

    /* renamed from: c, reason: collision with root package name */
    public static final x0 f54084c = new x0(1);

    /* renamed from: d, reason: collision with root package name */
    public static final x0 f54085d = new x0(2);

    /* renamed from: e, reason: collision with root package name */
    public static final x0 f54086e = new x0(3);

    /* renamed from: f, reason: collision with root package name */
    public static final x0 f54087f = new x0(4);

    /* renamed from: g, reason: collision with root package name */
    public static final x0 f54088g = new x0(5);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54089a;

    public /* synthetic */ x0(int i5) {
        this.f54089a = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f54089a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                int iIntValue = ((Number) obj2).intValue();
                p1.t tVar = (p1.t) oVar;
                if (!tVar.S(iIntValue & 1, (iIntValue & 3) != 2)) {
                    tVar.V();
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p1.t tVar2 = (p1.t) oVar2;
                if (!tVar2.S(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    tVar2.V();
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p1.t tVar3 = (p1.t) oVar3;
                if (!tVar3.S(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    tVar3.V();
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                int iIntValue4 = ((Number) obj2).intValue();
                p1.t tVar4 = (p1.t) oVar4;
                if (!tVar4.S(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    tVar4.V();
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                p1.t tVar5 = (p1.t) oVar5;
                if (!tVar5.S(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    tVar5.V();
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj;
                int iIntValue6 = ((Number) obj2).intValue();
                p1.t tVar6 = (p1.t) oVar6;
                if (!tVar6.S(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    tVar6.V();
                }
                break;
            default:
                p1.o oVar7 = (p1.o) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                p1.t tVar7 = (p1.t) oVar7;
                if (tVar7.S(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    x1.e eVar = z0.f54149a;
                    Intrinsics.d(null);
                    eVar.invoke(null, tVar7, 0);
                } else {
                    tVar7.V();
                }
                break;
        }
        return Unit.f71706a;
    }
}
