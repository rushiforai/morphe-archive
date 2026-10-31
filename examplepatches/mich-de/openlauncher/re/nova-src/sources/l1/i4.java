package l1;

/* loaded from: classes2.dex */
public final class i4 {

    /* renamed from: a, reason: collision with root package name */
    public final c4.h0 f73442a = c4.h0.f19604a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f73443b = true;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i4) {
            return this.f73442a == ((i4) obj).f73442a;
        }
        return false;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f73443b) + (this.f73442a.hashCode() * 31);
    }
}
