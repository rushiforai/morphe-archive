package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class zh implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f12539a;

    public zh(boolean z11) {
        this.f12539a = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.appSwitched = Boolean.valueOf(this.f12539a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zh) && this.f12539a == ((zh) obj).f12539a;
    }

    public final int hashCode() {
        boolean z11 = this.f12539a;
        if (z11) {
            return 1;
        }
        return z11 ? 1 : 0;
    }

    public final String toString() {
        return a80.m.i("AppOpenSignal(hasBeenForegrounded=", ")", this.f12539a);
    }
}
