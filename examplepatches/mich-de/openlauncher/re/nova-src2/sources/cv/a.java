package cv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f47995a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.b f47996b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f47997c;

    public a(String lastFour, ft.b cardBrand, boolean z11) {
        Intrinsics.g(lastFour, "lastFour");
        Intrinsics.g(cardBrand, "cardBrand");
        this.f47995a = lastFour;
        this.f47996b = cardBrand;
        this.f47997c = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f47995a, aVar.f47995a) && this.f47996b == aVar.f47996b && this.f47997c == aVar.f47997c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f47997c) + ((this.f47996b.hashCode() + (this.f47995a.hashCode() * 31)) * 961);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Args(lastFour=");
        sb2.append(this.f47995a);
        sb2.append(", cardBrand=");
        sb2.append(this.f47996b);
        sb2.append(", cvc=, isTestMode=");
        return a80.m.k(sb2, this.f47997c, ")");
    }
}
