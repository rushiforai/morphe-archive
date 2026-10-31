package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class qm3 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final x12 f8746a;

    public qm3(x12 nativeVideoViewabilityMonitor) {
        Intrinsics.g(nativeVideoViewabilityMonitor, "nativeVideoViewabilityMonitor");
        this.f8746a = nativeVideoViewabilityMonitor;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        this.f8746a.f11544g.getAndSet(false);
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 32;
    }
}
