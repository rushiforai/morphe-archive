package sr;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f87698a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87699b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87700c;

    public b(String successUrl, String cancelUrl, String str) {
        Intrinsics.g(successUrl, "successUrl");
        Intrinsics.g(cancelUrl, "cancelUrl");
        this.f87698a = successUrl;
        this.f87699b = cancelUrl;
        this.f87700c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f87698a, bVar.f87698a) && Intrinsics.b(this.f87699b, bVar.f87699b) && Intrinsics.b(this.f87700c, bVar.f87700c);
    }

    public final int hashCode() {
        return this.f87700c.hashCode() + c0.e(this.f87698a.hashCode() * 31, 31, this.f87699b);
    }

    public final String toString() {
        return c0.q(c0.w("State(successUrl=", this.f87698a, ", cancelUrl=", this.f87699b, ", hostedAuthUrl="), this.f87700c, ")");
    }
}
