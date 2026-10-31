package p1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class i implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final i f81449b = new i(0);

    /* renamed from: c, reason: collision with root package name */
    public static final i f81450c = new i(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81451a;

    public /* synthetic */ i(int i5) {
        this.f81451a = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f81451a) {
            case 0:
                o oVar = (o) obj;
                int iIntValue = ((Number) obj2).intValue();
                t tVar = (t) oVar;
                if (!tVar.S(iIntValue & 1, (iIntValue & 3) != 2)) {
                    tVar.V();
                }
                break;
            default:
                o oVar2 = (o) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                t tVar2 = (t) oVar2;
                if (!tVar2.S(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    tVar2.V();
                }
                break;
        }
        return Unit.f71706a;
    }
}
