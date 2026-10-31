package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m8 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7035a;

    public m8(String str) {
        this.f7035a = str;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.adShieldSignal = this.f7035a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m8) && Intrinsics.b(this.f7035a, ((m8) obj).f7035a);
    }

    public final int hashCode() {
        return this.f7035a.hashCode();
    }

    public final String toString() {
        return c0.l("AdSpamSignal(querySignal=", this.f7035a, ")");
    }
}
