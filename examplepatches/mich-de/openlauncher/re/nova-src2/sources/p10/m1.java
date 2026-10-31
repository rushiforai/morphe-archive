package p10;

/* loaded from: classes4.dex */
public final class m1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81845a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81846b;

    public m1(long j11, long j12) {
        this.f81845a = j11;
        this.f81846b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m1)) {
            return false;
        }
        m1 m1Var = (m1) obj;
        return this.f81845a == m1Var.f81845a && this.f81846b == m1Var.f81846b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f81846b) + (Long.hashCode(this.f81845a) * 31);
    }

    public final String toString() {
        return a2.c.i(this.f81846b, ")", b.c0.u(this.f81845a, "RedeemFailed(have=", ", need="));
    }
}
