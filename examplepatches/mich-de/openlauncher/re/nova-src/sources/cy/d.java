package cy;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f48440a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f48441b;

    public /* synthetic */ d() {
        this(false, false);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f48440a == dVar.f48440a && this.f48441b == dVar.f48441b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f48441b) + (Boolean.hashCode(this.f48440a) * 31);
    }

    public final String toString() {
        return "EntitlementState(hasPrime=" + this.f48440a + ", hasPlus=" + this.f48441b + ")";
    }

    public d(boolean z11, boolean z12) {
        this.f48440a = z11;
        this.f48441b = z12;
    }
}
