package hv;

import b.c9;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f60505a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60506b;

    /* renamed from: c, reason: collision with root package name */
    public final List f60507c;

    /* renamed from: d, reason: collision with root package name */
    public final a1 f60508d;

    public q0(p pVar, boolean z11, List availableNetworks, a1 a1Var) {
        Intrinsics.g(availableNetworks, "availableNetworks");
        this.f60505a = pVar;
        this.f60506b = z11;
        this.f60507c = availableNetworks;
        this.f60508d = a1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return Intrinsics.b(this.f60505a, q0Var.f60505a) && this.f60506b == q0Var.f60506b && Intrinsics.b(this.f60507c, q0Var.f60507c) && Intrinsics.b(this.f60508d, q0Var.f60508d);
    }

    public final int hashCode() {
        return this.f60508d.hashCode() + b.u4.c(c9.f(this.f60505a.hashCode() * 31, 31, this.f60506b), 31, this.f60507c);
    }

    public final String toString() {
        return "CardDetailsState(selectedCardBrand=" + this.f60505a + ", shouldShowCardBrandDropdown=" + this.f60506b + ", availableNetworks=" + this.f60507c + ", expiryDateState=" + this.f60508d + ")";
    }
}
