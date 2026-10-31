package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class xb2 {

    /* renamed from: a, reason: collision with root package name */
    public final wy0 f11660a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f11661b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f11662c;

    public xb2(wy0 wy0Var, boolean z11, boolean z12) {
        this.f11660a = wy0Var;
        this.f11661b = z11;
        this.f11662c = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xb2)) {
            return false;
        }
        xb2 xb2Var = (xb2) obj;
        return Intrinsics.b(this.f11660a, xb2Var.f11660a) && this.f11661b == xb2Var.f11661b && this.f11662c == xb2Var.f11662c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f11660a.hashCode() * 31;
        boolean z11 = this.f11661b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int i11 = (iHashCode + i5) * 31;
        boolean z12 = this.f11662c;
        return i11 + (z12 ? 1 : z12 ? 1 : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("PerAppIdV2(paidV2Info=");
        sb2.append(this.f11660a);
        sb2.append(", pubOption=");
        sb2.append(this.f11661b);
        sb2.append(", userOption=");
        return a80.m.k(sb2, this.f11662c, ")");
    }
}
