package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class wv2 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f11488a;

    public wv2(String requestId) {
        Intrinsics.g(requestId, "requestId");
        this.f11488a = requestId;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.REQUEST_ID;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        return new xu0(new vv2(this.f11488a));
    }
}
