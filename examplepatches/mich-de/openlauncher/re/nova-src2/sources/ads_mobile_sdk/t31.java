package ads_mobile_sdk;

import b.u1;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class t31 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f9772a;

    public t31(Map inMemorySdkCoreData) {
        Intrinsics.g(inMemorySdkCoreData, "inMemorySdkCoreData");
        this.f9772a = inMemorySdkCoreData;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        Map<String, String> map = this.f9772a;
        if (map.isEmpty()) {
            return;
        }
        signals.inMemorySdkCoreData = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t31) && Intrinsics.b(this.f9772a, ((t31) obj).f9772a);
    }

    public final int hashCode() {
        return this.f9772a.hashCode();
    }

    public final String toString() {
        return "InMemorySdkCoreDataSignal(inMemorySdkCoreData=" + this.f9772a + ")";
    }
}
