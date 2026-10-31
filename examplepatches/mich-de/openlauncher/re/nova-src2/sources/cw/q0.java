package cw;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final List f48269a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.b f48270b;

    public q0(List preferredBrands, ft.b bVar) {
        Intrinsics.g(preferredBrands, "preferredBrands");
        this.f48269a = preferredBrands;
        this.f48270b = bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return Intrinsics.b(this.f48269a, q0Var.f48269a) && this.f48270b == q0Var.f48270b;
    }

    public final int hashCode() {
        int iHashCode = this.f48269a.hashCode() * 31;
        ft.b bVar = this.f48270b;
        return iHashCode + (bVar == null ? 0 : bVar.hashCode());
    }

    public final String toString() {
        return "Eligible(preferredBrands=" + this.f48269a + ", initialBrand=" + this.f48270b + ")";
    }
}
