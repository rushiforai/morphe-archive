package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i3 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f4629a;

    public i3(boolean z11) {
        this.f4629a = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.adIdPermission = this.f4629a ? "1" : "0";
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i3) && this.f4629a == ((i3) obj).f4629a;
    }

    public final int hashCode() {
        boolean z11 = this.f4629a;
        if (z11) {
            return 1;
        }
        return z11 ? 1 : 0;
    }

    public final String toString() {
        return a80.m.i("AdIdPermissionSignal(adIdPermissionStatus=", ")", this.f4629a);
    }
}
