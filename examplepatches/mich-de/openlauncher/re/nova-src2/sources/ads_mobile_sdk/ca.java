package ads_mobile_sdk;

import b.b0;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ca implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final y2 f1745a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f1746b;

    public ca(y2 adEventEmitter) {
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        this.f1745a = adEventEmitter;
        this.f1746b = new AtomicBoolean(false);
    }

    @Override // b.b0
    public final Object a(qo3 qo3Var, Continuation continuation) {
        if (!qo3Var.f8763b || !this.f1746b.compareAndSet(false, true)) {
            return Unit.f71706a;
        }
        Object objQ = this.f1745a.q(continuation);
        return objQ == CoroutineSingletons.f71806a ? objQ : Unit.f71706a;
    }
}
