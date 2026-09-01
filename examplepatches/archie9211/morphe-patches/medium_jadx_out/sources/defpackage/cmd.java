package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cmd implements Comparable {
    public final long a;

    public static long a(long j) {
        long jA = e38.a();
        mn3 mn3Var = mn3.NANOSECONDS;
        mn3Var.getClass();
        return (1 | (j - 1)) == Long.MAX_VALUE ? in3.l(xz5.Z(j)) : xz5.u0(jA, j, mn3Var);
    }

    public static final long b(long j, long j2) {
        int i = e38.b;
        mn3 mn3Var = mn3.NANOSECONDS;
        mn3Var.getClass();
        if (((j2 - 1) | 1) != Long.MAX_VALUE) {
            return (1 | (j - 1)) == Long.MAX_VALUE ? xz5.Z(j) : xz5.u0(j, j2, mn3Var);
        }
        if (j != j2) {
            return in3.l(xz5.Z(j2));
        }
        int i2 = in3.d;
        return 0L;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        cmd cmdVar = (cmd) obj;
        cmdVar.getClass();
        return in3.c(b(this.a, cmdVar.a), 0L);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof cmd) {
            return this.a == ((cmd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return "ValueTimeMark(reading=" + this.a + ')';
    }
}
