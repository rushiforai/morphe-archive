package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class jl0 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f5296a;

    public jl0(String experimentIds) {
        Intrinsics.g(experimentIds, "experimentIds");
        this.f5296a = experimentIds;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        String str = this.f5296a;
        if (r70.k.U0(str)) {
            return;
        }
        signals.experimentIds = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jl0) && Intrinsics.b(this.f5296a, ((jl0) obj).f5296a);
    }

    public final int hashCode() {
        return this.f5296a.hashCode();
    }

    public final String toString() {
        return c0.l("ExperimentIdsSignal(experimentIds=", this.f5296a, ")");
    }
}
