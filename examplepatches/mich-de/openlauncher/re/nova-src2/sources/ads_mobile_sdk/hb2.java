package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class hb2 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final ts2 f4277a;

    public hb2(ts2 recursiveAdData) {
        Intrinsics.g(recursiveAdData, "recursiveAdData");
        this.f4277a = recursiveAdData;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        ts2 ts2Var = this.f4277a;
        signals.parentAdConfig = ts2Var.f10057a;
        signals.parentCommonConfig = ts2Var.f10058b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof hb2) && Intrinsics.b(this.f4277a, ((hb2) obj).f4277a);
    }

    public final int hashCode() {
        return this.f4277a.hashCode();
    }

    public final String toString() {
        return "ParentAdConfigSignal(recursiveAdData=" + this.f4277a + ")";
    }
}
