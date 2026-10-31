package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ib2 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final ts2 f4721a;

    public ib2(ts2 recursiveAdData) {
        Intrinsics.g(recursiveAdData, "recursiveAdData");
        this.f4721a = recursiveAdData;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.PARENT_AD_CONFIG;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        return new xu0(new hb2(this.f4721a));
    }
}
