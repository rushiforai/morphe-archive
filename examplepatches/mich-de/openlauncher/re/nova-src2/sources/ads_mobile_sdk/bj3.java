package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class bj3 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final x12 f1439a;

    public bj3(x12 nativeVideoViewabilityMonitor) {
        Intrinsics.g(nativeVideoViewabilityMonitor, "nativeVideoViewabilityMonitor");
        this.f1439a = nativeVideoViewabilityMonitor;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        x12 x12Var = this.f1439a;
        x12Var.f11544g.getAndSet(true);
        Object objA = x12Var.a(continuation);
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (objA != coroutineSingletons) {
            objA = Unit.f71706a;
        }
        return objA == coroutineSingletons ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 31;
    }
}
