package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xj0 {
    public final long a;
    public final kk0 b;
    public final ij0 c;

    public xj0(long j, kk0 kk0Var, ij0 ij0Var) {
        this.a = j;
        this.b = kk0Var;
        this.c = ij0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof xj0)) {
            return false;
        }
        xj0 xj0Var = (xj0) obj;
        return this.a == xj0Var.a && this.b.equals(xj0Var.b) && this.c.equals(xj0Var.c);
    }

    public final int hashCode() {
        long j = this.a;
        return this.c.hashCode() ^ ((((((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003);
    }

    public final String toString() {
        return "PersistedEvent{id=" + this.a + ", transportContext=" + this.b + ", event=" + this.c + "}";
    }
}
