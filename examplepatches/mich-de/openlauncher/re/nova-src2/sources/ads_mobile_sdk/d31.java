package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;
import oi.d;
import oi.f;
import oi.h;

/* loaded from: classes.dex */
public final class d31 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final h f2164a;

    public d31(h iconRequest) {
        Intrinsics.g(iconRequest, "iconRequest");
        this.f2164a = iconRequest;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.isIconAdRequest = Boolean.TRUE;
        f fVar = (f) this.f2164a;
        signals.correlator = fVar.m();
        d dVarN = fVar.n();
        if (dVarN != null) {
            signals.iconAdPlacement = Integer.valueOf(dVarN.a());
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d31) && Intrinsics.b(this.f2164a, ((d31) obj).f2164a);
    }

    public final int hashCode() {
        return this.f2164a.hashCode();
    }

    public final String toString() {
        return "IconAdSignal(iconRequest=" + this.f2164a + ")";
    }
}
