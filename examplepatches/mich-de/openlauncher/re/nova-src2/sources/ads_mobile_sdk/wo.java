package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class wo implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final double f11338a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f11339b;

    public wo(double d5, boolean z11) {
        this.f11338a = d5;
        this.f11339b = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        ti.e eVar = signals.deviceSignals.batterySignals;
        eVar.isCharging = this.f11339b;
        eVar.batteryLevel = this.f11338a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wo)) {
            return false;
        }
        wo woVar = (wo) obj;
        return Double.compare(this.f11338a, woVar.f11338a) == 0 && this.f11339b == woVar.f11339b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = Double.hashCode(this.f11338a) * 31;
        boolean z11 = this.f11339b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        return "BatterySignal(batteryLevel=" + this.f11338a + ", isCharging=" + this.f11339b + ")";
    }
}
