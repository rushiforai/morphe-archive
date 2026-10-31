package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d33 {

    /* renamed from: a, reason: collision with root package name */
    public final v23 f2165a;

    /* renamed from: b, reason: collision with root package name */
    public final z23 f2166b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f2167c;

    /* renamed from: d, reason: collision with root package name */
    public final ue2 f2168d;

    public d33(v23 v23Var, z23 serverResponse, boolean z11, ue2 ue2Var) {
        Intrinsics.g(serverResponse, "serverResponse");
        this.f2165a = v23Var;
        this.f2166b = serverResponse;
        this.f2167c = z11;
        this.f2168d = ue2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d33)) {
            return false;
        }
        d33 d33Var = (d33) obj;
        return Intrinsics.b(this.f2165a, d33Var.f2165a) && Intrinsics.b(this.f2166b, d33Var.f2166b) && this.f2167c == d33Var.f2167c && Intrinsics.b(this.f2168d, d33Var.f2168d);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = (this.f2166b.hashCode() + (this.f2165a.f10559a.hashCode() * 31)) * 31;
        boolean z11 = this.f2167c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        ue2 ue2Var = this.f2168d;
        return i11 + (ue2Var == null ? 0 : ue2Var.hashCode());
    }

    public final String toString() {
        return "ServerTransaction(serverRequest=" + this.f2165a + ", serverResponse=" + this.f2166b + ", isFromPersistentCache=" + this.f2167c + ", persistentCacheToken=" + this.f2168d + ")";
    }
}
