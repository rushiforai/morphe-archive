package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class n43 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f7429a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n43(int i5) {
        super(1);
        this.f7429a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        s43 update = (s43) obj;
        Intrinsics.g(update, "$this$update");
        b.q4 q4Var = update.f9413a;
        q4Var.b();
        k43 k43Var = (k43) q4Var.f1095b;
        k43Var.bitField0_ |= 2;
        k43Var.totalInflightAdLimit_ = this.f7429a;
        return Unit.f71706a;
    }
}
