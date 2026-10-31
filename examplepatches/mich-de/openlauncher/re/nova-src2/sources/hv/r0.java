package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f60536a;

    /* renamed from: b, reason: collision with root package name */
    public final int f60537b;

    /* renamed from: c, reason: collision with root package name */
    public final q0 f60538c;

    /* renamed from: d, reason: collision with root package name */
    public final l f60539d;

    public r0(y0 y0Var, int i5, q0 q0Var, l lVar) {
        this.f60536a = y0Var;
        this.f60537b = i5;
        this.f60538c = q0Var;
        this.f60539d = lVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r0)) {
            return false;
        }
        r0 r0Var = (r0) obj;
        return Intrinsics.b(this.f60536a, r0Var.f60536a) && this.f60537b == r0Var.f60537b && Intrinsics.b(this.f60538c, r0Var.f60538c) && Intrinsics.b(this.f60539d, r0Var.f60539d);
    }

    public final int hashCode() {
        int iA = b.u4.a(this.f60537b, this.f60536a.hashCode() * 31, 31);
        q0 q0Var = this.f60538c;
        int iHashCode = (iA + (q0Var == null ? 0 : q0Var.hashCode())) * 31;
        l lVar = this.f60539d;
        return iHashCode + (lVar != null ? lVar.hashCode() : 0);
    }

    public final String toString() {
        return "State(payload=" + this.f60536a + ", paymentMethodIcon=" + this.f60537b + ", cardDetailsState=" + this.f60538c + ", billingDetailsForm=" + this.f60539d + ")";
    }
}
