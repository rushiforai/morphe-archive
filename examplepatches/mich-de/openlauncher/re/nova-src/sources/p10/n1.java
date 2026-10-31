package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f81854a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81855b;

    public n1(String str, long j11) {
        this.f81854a = str;
        this.f81855b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n1)) {
            return false;
        }
        n1 n1Var = (n1) obj;
        return Intrinsics.b(this.f81854a, n1Var.f81854a) && this.f81855b == n1Var.f81855b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81855b) + (this.f81854a.hashCode() * 31);
    }

    public final String toString() {
        return "Redeemed(rewardId=" + this.f81854a + ", expiresAtMs=" + this.f81855b + ")";
    }
}
