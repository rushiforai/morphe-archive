package ads_mobile_sdk;

import b.c0;
import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m33 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7001a;

    public m33(String str) {
        this.f7001a = str;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.sessionId = this.f7001a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m33) && Intrinsics.b(this.f7001a, ((m33) obj).f7001a);
    }

    public final int hashCode() {
        String str = this.f7001a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return c0.l("SessionIdSignal(sessionId=", this.f7001a, ")");
    }
}
