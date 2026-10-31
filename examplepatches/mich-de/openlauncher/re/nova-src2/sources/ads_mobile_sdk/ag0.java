package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ag0 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final xj f980a;

    public ag0(xj appState) {
        Intrinsics.g(appState, "appState");
        this.f980a = appState;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.DEBUG_SIGNAL;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        xj xjVar = this.f980a;
        Object obj = xjVar.f11738g.get();
        Intrinsics.f(obj, "get(...)");
        return new xu0(new zf0((String) obj, xjVar.f11739h.get()));
    }
}
