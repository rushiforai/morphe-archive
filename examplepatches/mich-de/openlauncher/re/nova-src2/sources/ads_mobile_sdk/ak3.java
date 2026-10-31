package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ak3 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f1035a;

    public ak3(String str) {
        this.f1035a = str;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        String str = this.f1035a;
        if (str != null) {
            if (str.length() <= 0) {
                str = null;
            }
            if (str != null) {
                signals.personallyIdentifiableInformation.adsId = str;
            }
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ak3) && Intrinsics.b(this.f1035a, ((ak3) obj).f1035a);
    }

    public final int hashCode() {
        String str = this.f1035a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return c0.l("TrustlessTokenSignal(trustlessToken=", this.f1035a, ")");
    }
}
