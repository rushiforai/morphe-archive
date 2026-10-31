package cv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f48004a;

    public d(String cvc) {
        Intrinsics.g(cvc, "cvc");
        this.f48004a = cvc;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f48004a, ((d) obj).f48004a);
    }

    public final int hashCode() {
        return this.f48004a.hashCode();
    }

    public final String toString() {
        return c0.l("Completed(cvc=", this.f48004a, ")");
    }
}
