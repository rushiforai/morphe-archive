package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class vv2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f10917a;

    public vv2(String requestId) {
        Intrinsics.g(requestId, "requestId");
        this.f10917a = requestId;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.requestId = this.f10917a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof vv2) && Intrinsics.b(this.f10917a, ((vv2) obj).f10917a);
    }

    public final int hashCode() {
        return this.f10917a.hashCode();
    }

    public final String toString() {
        return c0.l("RequestIdSignal(requestId=", this.f10917a, ")");
    }
}
