package hv;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p implements kw.u2 {

    /* renamed from: a, reason: collision with root package name */
    public final ft.b f60464a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60465b;

    public p(ft.b brand, boolean z11) {
        Intrinsics.g(brand, "brand");
        this.f60464a = brand;
        this.f60465b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return this.f60464a == pVar.f60464a && this.f60465b == pVar.f60465b;
    }

    @Override // kw.u2
    public final boolean getEnabled() {
        return this.f60465b;
    }

    @Override // kw.u2
    public final Integer getIcon() {
        return Integer.valueOf(this.f60464a.f55899c);
    }

    @Override // kw.u2
    public final ResolvableString getLabel() {
        boolean z11 = this.f60465b;
        ft.b bVar = this.f60464a;
        return z11 ? zg.a.H(bVar.f55898b) : zg.a.U(2132019738, new Object[]{bVar.f55898b}, EmptyList.f71733a);
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f60465b) + (this.f60464a.hashCode() * 31);
    }

    public final String toString() {
        return "CardBrandChoice(brand=" + this.f60464a + ", enabled=" + this.f60465b + ")";
    }
}
