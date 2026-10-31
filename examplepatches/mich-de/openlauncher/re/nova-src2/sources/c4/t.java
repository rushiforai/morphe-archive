package c4;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class t extends Lambda implements Function2 {

    /* renamed from: k, reason: collision with root package name */
    public static final t f19630k;

    /* renamed from: l, reason: collision with root package name */
    public static final t f19631l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19632j;

    static {
        int i5 = 2;
        f19630k = new t(i5, 0);
        f19631l = new t(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t(int i5, int i11) {
        super(i5);
        this.f19632j = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f19632j) {
            case 0:
                p1.o oVar = (p1.o) obj;
                int iIntValue = ((Number) obj2).intValue();
                p1.t tVar = (p1.t) oVar;
                if (!tVar.S(iIntValue & 1, (iIntValue & 3) != 2)) {
                    tVar.V();
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p1.t tVar2 = (p1.t) oVar2;
                if (!tVar2.S(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    tVar2.V();
                }
                break;
        }
        return Unit.f71706a;
    }
}
