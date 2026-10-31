package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class sw2 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final pa2 f9712a;

    public sw2(pa2 paidLifecycleWrapper) {
        Intrinsics.g(paidLifecycleWrapper, "paidLifecycleWrapper");
        this.f9712a = paidLifecycleWrapper;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        pa2 pa2Var = this.f9712a;
        pa2Var.a();
        pa2Var.b();
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 27;
    }
}
