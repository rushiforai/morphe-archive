package p10;

/* loaded from: classes4.dex */
public final class p0 implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81870a;

    public p0(long j11) {
        this.f81870a = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof p0) && this.f81870a == ((p0) obj).f81870a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81870a);
    }

    public final String toString() {
        return h6.c1.o(this.f81870a, "Granted(expiresAtMs=", ")");
    }
}
