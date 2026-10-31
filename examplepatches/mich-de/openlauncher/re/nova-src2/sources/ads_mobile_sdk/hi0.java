package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;
import ti.i;

/* loaded from: classes2.dex */
public final class hi0 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f4395a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f4396b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f4397c;

    public hi0(Integer num, Integer num2, Integer num3) {
        this.f4395a = num;
        this.f4396b = num2;
        this.f4397c = num3;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        i iVar = signals.deviceSignals.deviceTierSignals;
        iVar.advertisedMemoryTier = this.f4395a;
        iVar.availableMemoryTier = this.f4396b;
        iVar.availableProcessorsTier = this.f4397c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hi0)) {
            return false;
        }
        hi0 hi0Var = (hi0) obj;
        return Intrinsics.b(this.f4395a, hi0Var.f4395a) && Intrinsics.b(this.f4396b, hi0Var.f4396b) && Intrinsics.b(this.f4397c, hi0Var.f4397c);
    }

    public final int hashCode() {
        Integer num = this.f4395a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f4396b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f4397c;
        return iHashCode2 + (num3 != null ? num3.hashCode() : 0);
    }

    public final String toString() {
        return "DeviceTierSignal(advertisedMemoryTier=" + this.f4395a + ", availableMemoryTier=" + this.f4396b + ", availableProcessorsTier=" + this.f4397c + ")";
    }
}
