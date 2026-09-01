package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vn6 {
    public final long a;
    public final Long b;

    public vn6(long j, Long l) {
        this.a = j;
        this.b = l;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vn6)) {
            return false;
        }
        vn6 vn6Var = (vn6) obj;
        return this.a == vn6Var.a && g76.L(this.b, vn6Var.b);
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        Long l = this.b;
        return i + (l != null ? l.hashCode() : 0);
    }

    public final String toString() {
        return "KronosTime(posixTimeMs=" + this.a + ", timeSinceLastNtpSyncMs=" + this.b + ")";
    }
}
