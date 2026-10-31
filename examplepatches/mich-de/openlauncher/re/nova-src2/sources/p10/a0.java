package p10;

/* loaded from: classes4.dex */
public final class a0 implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81692a;

    public a0(long j11) {
        this.f81692a = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a0) && this.f81692a == ((a0) obj).f81692a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81692a);
    }

    public final String toString() {
        return h6.c1.o(this.f81692a, "Success(balance=", ")");
    }
}
