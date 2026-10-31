package ads_mobile_sdk;

import android.os.Bundle;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f43 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final Bundle f3157a;

    public f43(Bundle sharedPreferences) {
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        this.f3157a = sharedPreferences;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.sharedPreferenceSignals = this.f3157a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f43) && Intrinsics.b(this.f3157a, ((f43) obj).f3157a);
    }

    public final int hashCode() {
        return this.f3157a.hashCode();
    }

    public final String toString() {
        return "SharedPreferenceSignal(sharedPreferences=" + this.f3157a + ")";
    }
}
