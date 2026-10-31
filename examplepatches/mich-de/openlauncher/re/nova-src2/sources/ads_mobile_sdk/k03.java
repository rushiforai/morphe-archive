package ads_mobile_sdk;

import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class k03 implements b.w5 {

    /* renamed from: a, reason: collision with root package name */
    public final y2 f5463a;

    /* renamed from: b, reason: collision with root package name */
    public final z1 f5464b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f5465c;

    public k03(y2 adEventEmitter, z1 adConfiguration) {
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(adConfiguration, "adConfiguration");
        this.f5463a = adEventEmitter;
        this.f5464b = adConfiguration;
        this.f5465c = new AtomicBoolean(false);
    }

    @Override // b.w5
    public final Object a(boolean z11, Continuation continuation) {
        if (!z11 || !this.f5465c.compareAndSet(false, true)) {
            return Unit.f71706a;
        }
        y1 y1Var = this.f5464b.f12396p0;
        y1 y1Var2 = y1.f11910g;
        y2 y2Var = this.f5463a;
        if (y1Var == y1Var2) {
            Object objJ = y2Var.j(continuation);
            return objJ == CoroutineSingletons.f71806a ? objJ : Unit.f71706a;
        }
        Object objQ = y2Var.q(continuation);
        return objQ == CoroutineSingletons.f71806a ? objQ : Unit.f71706a;
    }
}
