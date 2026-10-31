package m1;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import p1.y2;

/* loaded from: classes2.dex */
public final class o0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f75736j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ y2 f75737k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o0(y2 y2Var, int i5) {
        super(0);
        this.f75736j = i5;
        this.f75737k = y2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f75736j) {
            case 0:
                return Boolean.valueOf(((Number) this.f75737k.getValue()).floatValue() > 0.0f);
            case 1:
                return Boolean.valueOf(((Number) this.f75737k.getValue()).floatValue() > 0.0f);
            default:
                List list = (List) this.f75737k.getValue();
                ArrayList arrayList = new ArrayList();
                for (Object obj : list) {
                    if (Intrinsics.b(((p6.n) obj).f82192b.f82152a, "composable")) {
                        arrayList.add(obj);
                    }
                }
                return arrayList;
        }
    }
}
