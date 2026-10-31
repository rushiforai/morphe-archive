package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class wl implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f11318a;

    public wl(boolean z11) {
        this.f11318a = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.isBannerRefreshRequest = Boolean.valueOf(this.f11318a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wl) && this.f11318a == ((wl) obj).f11318a;
    }

    public final int hashCode() {
        boolean z11 = this.f11318a;
        if (z11) {
            return 1;
        }
        return z11 ? 1 : 0;
    }

    public final String toString() {
        return a80.m.i("BannerRefreshSignal(isRefreshRequest=", ")", this.f11318a);
    }
}
