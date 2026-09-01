package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g83 {
    public static final g83 c = new g83(0, 0);
    public final long a;
    public final long b;

    public g83(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof g83) {
            g83 g83Var = (g83) obj;
            return s46.a(this.a, g83Var.a) && this.b == g83Var.b;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return ((int) ((j2 >>> 32) ^ j2)) + i;
    }
}
