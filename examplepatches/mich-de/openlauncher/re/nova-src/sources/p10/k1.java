package p10;

/* loaded from: classes4.dex */
public final class k1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81808a;

    public k1(long j11) {
        this.f81808a = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k1) && this.f81808a == ((k1) obj).f81808a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81808a);
    }

    public final String toString() {
        return h6.c1.o(this.f81808a, "Earned(coins=", ")");
    }
}
