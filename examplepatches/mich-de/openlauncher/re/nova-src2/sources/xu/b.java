package xu;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f96328a;

    /* renamed from: b, reason: collision with root package name */
    public final a f96329b;

    public b(boolean z11, a aVar) {
        this.f96328a = z11;
        this.f96329b = aVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f96328a == bVar.f96328a && Intrinsics.b(this.f96329b, bVar.f96329b);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f96328a) * 31;
        a aVar = this.f96329b;
        return iHashCode + (aVar == null ? 0 : aVar.hashCode());
    }

    public final String toString() {
        return "BuyButtonState(visible=" + this.f96328a + ", buyButtonOverride=" + this.f96329b + ")";
    }
}
