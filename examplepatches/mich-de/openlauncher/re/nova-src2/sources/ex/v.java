package ex;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final oi.b f53112a;

    /* renamed from: b, reason: collision with root package name */
    public final long f53113b;

    public v(oi.b ad, long j11) {
        Intrinsics.g(ad, "ad");
        this.f53112a = ad;
        this.f53113b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return Intrinsics.b(this.f53112a, vVar.f53112a) && this.f53113b == vVar.f53113b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f53113b) + (this.f53112a.hashCode() * 31);
    }

    public final String toString() {
        return "Entry(ad=" + this.f53112a + ", loadedAtMs=" + this.f53113b + ")";
    }
}
