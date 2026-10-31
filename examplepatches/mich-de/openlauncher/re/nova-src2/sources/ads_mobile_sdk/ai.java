package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ai implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f988a;

    public ai(g0 activityTracker) {
        Intrinsics.g(activityTracker, "activityTracker");
        this.f988a = activityTracker;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.APP_OPEN;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        boolean z11;
        g0 g0Var = this.f988a;
        synchronized (g0Var) {
            z11 = g0Var.n;
        }
        return new xu0(new zh(z11));
    }
}
