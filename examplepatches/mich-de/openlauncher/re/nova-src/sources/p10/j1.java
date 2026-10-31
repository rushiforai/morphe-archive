package p10;

/* loaded from: classes4.dex */
public final class j1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81798a;

    public j1(long j11) {
        this.f81798a = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j1) && this.f81798a == ((j1) obj).f81798a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81798a);
    }

    public final String toString() {
        return h6.c1.o(this.f81798a, "CheckedIn(coins=", ")");
    }
}
