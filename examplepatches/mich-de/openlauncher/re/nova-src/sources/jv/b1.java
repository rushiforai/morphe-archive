package jv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b1 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f69993a;

    /* renamed from: b, reason: collision with root package name */
    public final z2.y f69994b;

    public b1(String itemCode, z2.y coordinates) {
        Intrinsics.g(itemCode, "itemCode");
        Intrinsics.g(coordinates, "coordinates");
        this.f69993a = itemCode;
        this.f69994b = coordinates;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b1)) {
            return false;
        }
        b1 b1Var = (b1) obj;
        return Intrinsics.b(this.f69993a, b1Var.f69993a) && Intrinsics.b(this.f69994b, b1Var.f69994b);
    }

    public final int hashCode() {
        return this.f69994b.hashCode() + (this.f69993a.hashCode() * 31);
    }

    public final String toString() {
        return "UpdatePaymentMethodVisibility(itemCode=" + this.f69993a + ", coordinates=" + this.f69994b + ")";
    }
}
