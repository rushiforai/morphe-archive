package y3;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final long f96605a;

    public static long a(int i5, int i11, int i12, long j11) {
        if ((i12 & 1) != 0) {
            i5 = (int) (j11 >> 32);
        }
        if ((i12 & 2) != 0) {
            i11 = (int) (j11 & 4294967295L);
        }
        return (i11 & 4294967295L) | (i5 << 32);
    }

    public static final boolean b(long j11, long j12) {
        return j11 == j12;
    }

    public static final long c(long j11, long j12) {
        return ((((int) (j11 >> 32)) - ((int) (j12 >> 32))) << 32) | ((((int) (j11 & 4294967295L)) - ((int) (j12 & 4294967295L))) & 4294967295L);
    }

    public static final long d(long j11, long j12) {
        return ((((int) (j11 >> 32)) + ((int) (j12 >> 32))) << 32) | ((((int) (j11 & 4294967295L)) + ((int) (j12 & 4294967295L))) & 4294967295L);
    }

    public static String e(long j11) {
        StringBuilder sb2 = new StringBuilder("(");
        sb2.append((int) (j11 >> 32));
        sb2.append(", ");
        return a2.c.m(sb2, (int) (j11 & 4294967295L), ')');
    }

    public final boolean equals(Object obj) {
        if (obj instanceof k) {
            return this.f96605a == ((k) obj).f96605a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96605a);
    }

    public final String toString() {
        return e(this.f96605a);
    }
}
