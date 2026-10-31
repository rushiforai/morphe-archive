package y3;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final long f96611a;

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static String b(long j11) {
        return ((int) (j11 >> 32)) + " x " + ((int) (j11 & 4294967295L));
    }

    public final boolean equals(Object obj) {
        if (obj instanceof m) {
            return this.f96611a == ((m) obj).f96611a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96611a);
    }

    public final String toString() {
        return b(this.f96611a);
    }
}
