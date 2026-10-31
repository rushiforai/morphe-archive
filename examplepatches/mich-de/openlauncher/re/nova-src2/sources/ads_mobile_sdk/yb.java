package ads_mobile_sdk;

import b.u1;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class yb implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f11990a;

    public yb(Map adapterNameToVersionsMap) {
        Intrinsics.g(adapterNameToVersionsMap, "adapterNameToVersionsMap");
        this.f11990a = adapterNameToVersionsMap;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.adapterVersionData.putAll(this.f11990a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yb) && Intrinsics.b(this.f11990a, ((yb) obj).f11990a);
    }

    public final int hashCode() {
        return this.f11990a.hashCode();
    }

    public final String toString() {
        return "AdapterVersionsSignal(adapterNameToVersionsMap=" + this.f11990a + ")";
    }
}
