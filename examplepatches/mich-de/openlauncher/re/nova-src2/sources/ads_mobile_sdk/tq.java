package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class tq {

    /* renamed from: a, reason: collision with root package name */
    public final bm1 f10036a;

    /* renamed from: b, reason: collision with root package name */
    public final se2 f10037b;

    public tq(bm1 bm1Var, se2 se2Var) {
        this.f10036a = bm1Var;
        this.f10037b = se2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tq)) {
            return false;
        }
        tq tqVar = (tq) obj;
        return Intrinsics.b(this.f10036a, tqVar.f10036a) && this.f10037b == tqVar.f10037b;
    }

    public final int hashCode() {
        bm1 bm1Var = this.f10036a;
        int iHashCode = (bm1Var == null ? 0 : bm1Var.hashCode()) * 31;
        se2 se2Var = this.f10037b;
        return iHashCode + (se2Var != null ? se2Var.hashCode() : 0);
    }

    public final String toString() {
        return "CacheLoadResult(loadedAd=" + this.f10036a + ", missReason=" + this.f10037b + ")";
    }
}
