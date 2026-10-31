package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class j70 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final com.google.gson.r f5147a;

    public j70(com.google.gson.r consentStateJson) {
        Intrinsics.g(consentStateJson, "consentStateJson");
        this.f5147a = consentStateJson;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.csrbEcoData = this.f5147a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j70) && Intrinsics.b(this.f5147a, ((j70) obj).f5147a);
    }

    public final int hashCode() {
        return this.f5147a.f34795a.hashCode();
    }

    public final String toString() {
        return "CsrbEcoDataSignal(consentStateJson=" + this.f5147a + ")";
    }
}
