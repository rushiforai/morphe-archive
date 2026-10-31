package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class yb2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final xb2 f12002a;

    public yb2(xb2 xb2Var) {
        this.f12002a = xb2Var;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        wy0 wy0Var;
        String str;
        Intrinsics.g(signals, "signals");
        xb2 xb2Var = this.f12002a;
        if (xb2Var == null || (wy0Var = xb2Var.f11660a) == null || (str = wy0Var.f11513a) == null) {
            return;
        }
        long j11 = wy0Var.f11514b;
        if (j11 > 0) {
            ti.l lVar = signals.personallyIdentifiableInformation;
            lVar.perAppIdV2 = str;
            lVar.paidV2CreationTimeMilliseconds = Long.valueOf(j11);
            lVar.paidV2PubOption = Boolean.valueOf(xb2Var.f11661b);
            lVar.paidV2UserOption = Boolean.valueOf(xb2Var.f11662c);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yb2) && Intrinsics.b(this.f12002a, ((yb2) obj).f12002a);
    }

    public final int hashCode() {
        xb2 xb2Var = this.f12002a;
        if (xb2Var == null) {
            return 0;
        }
        return xb2Var.hashCode();
    }

    public final String toString() {
        return "PerAppIdV2Signal(paidV2=" + this.f12002a + ")";
    }
}
