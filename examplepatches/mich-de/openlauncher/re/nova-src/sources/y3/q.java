package y3;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final long f96619a;

    public static final boolean a(long j11, long j12) {
        return j11 == j12;
    }

    public static String b(long j11) {
        return a(j11, 0L) ? "Unspecified" : a(j11, 4294967296L) ? "Sp" : a(j11, 8589934592L) ? "Em" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof q) {
            return this.f96619a == ((q) obj).f96619a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96619a);
    }

    public final String toString() {
        return b(this.f96619a);
    }
}
