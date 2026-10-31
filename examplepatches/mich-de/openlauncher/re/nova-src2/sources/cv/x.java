package cv;

import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kw.c3;

/* loaded from: classes4.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final String f48046a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.b f48047b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f48048c;

    /* renamed from: d, reason: collision with root package name */
    public final int f48049d;

    /* renamed from: e, reason: collision with root package name */
    public final c3 f48050e;

    public x(String cvc, ft.b cardBrand) {
        Intrinsics.g(cvc, "cvc");
        Intrinsics.g(cardBrand, "cardBrand");
        this.f48046a = cvc;
        this.f48047b = cardBrand;
        this.f48048c = new bh.k(2).g(cardBrand, EmptyList.f71733a, cvc, cardBrand.a()).isValid();
        this.f48049d = cardBrand == ft.b.f55887q ? 2132019760 : 2132019763;
        this.f48050e = new c3(cardBrand.f55900d, false, (n0.w) null, 10);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Intrinsics.b(this.f48046a, xVar.f48046a) && this.f48047b == xVar.f48047b;
    }

    public final int hashCode() {
        return this.f48047b.hashCode() + (this.f48046a.hashCode() * 31);
    }

    public final String toString() {
        return "CvcState(cvc=" + this.f48046a + ", cardBrand=" + this.f48047b + ")";
    }
}
