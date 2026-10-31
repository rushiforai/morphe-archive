package cv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t implements u {

    /* renamed from: a, reason: collision with root package name */
    public final String f48038a;

    public t(String cvc) {
        Intrinsics.g(cvc, "cvc");
        this.f48038a = cvc;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t) && Intrinsics.b(this.f48038a, ((t) obj).f48038a);
    }

    public final int hashCode() {
        return this.f48038a.hashCode();
    }

    public final String toString() {
        return c0.l("OnCvcChanged(cvc=", this.f48038a, ")");
    }
}
