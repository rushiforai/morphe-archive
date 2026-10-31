package p10;

/* loaded from: classes4.dex */
public final class z implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81978a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81979b;

    public z(long j11, long j12) {
        this.f81978a = j11;
        this.f81979b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return this.f81978a == zVar.f81978a && this.f81979b == zVar.f81979b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81979b) + (Long.hashCode(this.f81978a) * 31);
    }

    public final String toString() {
        return a2.c.i(this.f81979b, ")", b.c0.u(this.f81978a, "InsufficientFunds(balance=", ", requested="));
    }
}
