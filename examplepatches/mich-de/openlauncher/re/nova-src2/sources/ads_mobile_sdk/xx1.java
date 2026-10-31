package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class xx1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final y2 f11884a;

    public xx1(y2 adEventEmitter) {
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        this.f11884a = adEventEmitter;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        Object objQ = this.f11884a.q(continuation);
        return objQ == CoroutineSingletons.f71806a ? objQ : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 30;
    }
}
