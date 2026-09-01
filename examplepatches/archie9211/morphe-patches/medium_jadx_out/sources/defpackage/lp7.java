package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lp7 {
    public final long a;
    public final Object b;

    public lp7(long j, Object obj) {
        this.a = j;
        this.b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lp7)) {
            return false;
        }
        lp7 lp7Var = (lp7) obj;
        return this.a == lp7Var.a && g76.L(this.b, lp7Var.b);
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        Object obj = this.b;
        return i + (obj == null ? 0 : obj.hashCode());
    }

    public final String toString() {
        return "Entry{createdAt=" + this.a + ", value=" + this.b + "}";
    }
}
