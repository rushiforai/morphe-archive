package b10;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class d1 implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16627a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f16628b;

    public /* synthetic */ d1(int i5, List list) {
        this.f16627a = i5;
        this.f16628b = list;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        switch (this.f16627a) {
            case 0:
                int iIntValue = ((Number) obj2).intValue();
                ((Number) obj4).intValue();
                ((Function2) this.f16628b.get(iIntValue)).invoke((p1.o) obj3, 0);
                break;
            default:
                int iIntValue2 = ((Number) obj2).intValue();
                ((Number) obj4).intValue();
                ((Function2) this.f16628b.get(iIntValue2)).invoke((p1.o) obj3, 0);
                break;
        }
        return Unit.f71706a;
    }
}
