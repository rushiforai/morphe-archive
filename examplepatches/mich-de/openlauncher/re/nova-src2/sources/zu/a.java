package zu;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f98598a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f98599b;

    public a(String promoText, boolean z11) {
        Intrinsics.g(promoText, "promoText");
        this.f98598a = promoText;
        this.f98599b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f98598a, aVar.f98598a) && this.f98599b == aVar.f98599b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f98599b) + (this.f98598a.hashCode() * 31);
    }

    public final String toString() {
        return "PromoBadgeState(promoText=" + this.f98598a + ", eligible=" + this.f98599b + ")";
    }
}
