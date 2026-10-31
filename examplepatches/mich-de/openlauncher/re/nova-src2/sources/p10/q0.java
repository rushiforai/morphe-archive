package p10;

/* loaded from: classes4.dex */
public final class q0 implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81877a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81878b;

    public q0(long j11, long j12) {
        this.f81877a = j11;
        this.f81878b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return this.f81877a == q0Var.f81877a && this.f81878b == q0Var.f81878b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81878b) + (Long.hashCode(this.f81877a) * 31);
    }

    public final String toString() {
        return a2.c.i(this.f81878b, ")", b.c0.u(this.f81877a, "InsufficientCoins(have=", ", need="));
    }
}
