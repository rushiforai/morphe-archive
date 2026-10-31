package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class bm1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f1459a;

    /* renamed from: b, reason: collision with root package name */
    public final ue2 f1460b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f1461c;

    /* renamed from: d, reason: collision with root package name */
    public final long f1462d;

    public bm1(String ad, ue2 token, boolean z11, long j11) {
        Intrinsics.g(ad, "ad");
        Intrinsics.g(token, "token");
        this.f1459a = ad;
        this.f1460b = token;
        this.f1461c = z11;
        this.f1462d = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bm1)) {
            return false;
        }
        bm1 bm1Var = (bm1) obj;
        return Intrinsics.b(this.f1459a, bm1Var.f1459a) && Intrinsics.b(this.f1460b, bm1Var.f1460b) && this.f1461c == bm1Var.f1461c && this.f1462d == bm1Var.f1462d;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f1460b.hashCode() + (this.f1459a.hashCode() * 31)) * 31;
        boolean z11 = this.f1461c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return Long.hashCode(this.f1462d) + ((iHashCode + i5) * 31);
    }

    public final String toString() {
        return "LoadedAd(ad=" + this.f1459a + ", token=" + this.f1460b + ", isFromPreviousSession=" + this.f1461c + ", timeInCacheMs=" + this.f1462d + ")";
    }
}
