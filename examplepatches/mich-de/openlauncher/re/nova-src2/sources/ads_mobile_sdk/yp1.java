package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class yp1 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final rr1 f12237a;

    public yp1(rr1 mraidResizeHandler) {
        Intrinsics.g(mraidResizeHandler, "mraidResizeHandler");
        this.f12237a = mraidResizeHandler;
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        this.f12237a.a(true);
        return Unit.f71706a;
    }
}
