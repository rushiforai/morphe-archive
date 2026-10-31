package z2;

import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class o extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f98122j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ p[] f98123k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o(p[] pVarArr, int i5) {
        super(2);
        this.f98122j = i5;
        this.f98123k = pVarArr;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f98122j) {
            case 0:
                return Float.valueOf(o1.a((h1) obj, true, this.f98123k, ((Number) obj2).floatValue()));
            default:
                return Float.valueOf(o1.a((h1) obj, false, this.f98123k, ((Number) obj2).floatValue()));
        }
    }
}
