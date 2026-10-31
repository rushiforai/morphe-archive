package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class tb2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final wy0 f9837a;

    public tb2(wy0 wy0Var) {
        this.f9837a = wy0Var;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        String str;
        Intrinsics.g(signals, "signals");
        wy0 wy0Var = this.f9837a;
        if (wy0Var == null || (str = wy0Var.f11513a) == null) {
            return;
        }
        long j11 = wy0Var.f11514b;
        if (j11 > 0) {
            long j12 = (j11 - 978307200000L) / 1000;
            ti.l lVar = signals.personallyIdentifiableInformation;
            lVar.perAppIdV1 = str;
            lVar.paidV1CreationTimeMilliseconds = Long.valueOf(j11);
            lVar.paidV1CreationTimeSeconds = j12 < 0 ? 0L : Long.valueOf(j12);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof tb2) && Intrinsics.b(this.f9837a, ((tb2) obj).f9837a);
    }

    public final int hashCode() {
        wy0 wy0Var = this.f9837a;
        if (wy0Var == null) {
            return 0;
        }
        return wy0Var.hashCode();
    }

    public final String toString() {
        return "PerAppIdV1Signal(paidV1Info=" + this.f9837a + ")";
    }
}
