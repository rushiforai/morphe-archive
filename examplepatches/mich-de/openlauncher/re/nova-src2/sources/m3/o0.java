package m3;

import e10.z2;

/* loaded from: classes.dex */
public final class o0 {

    /* renamed from: b, reason: collision with root package name */
    public static final long f75944b = z2.u(0, 0);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f75945c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final long f75946a;

    public static boolean a(long j11, Object obj) {
        return (obj instanceof o0) && j11 == ((o0) obj).f75946a;
    }

    public static final boolean b(long j11, long j12) {
        return j11 == j12;
    }

    public static final boolean c(long j11) {
        return ((int) (j11 >> 32)) == ((int) (j11 & 4294967295L));
    }

    public static final int d(long j11) {
        return e(j11) - f(j11);
    }

    public static final int e(long j11) {
        return Math.max((int) (j11 >> 32), (int) (j11 & 4294967295L));
    }

    public static final int f(long j11) {
        return Math.min((int) (j11 >> 32), (int) (j11 & 4294967295L));
    }

    public static final boolean g(long j11) {
        return ((int) (j11 >> 32)) > ((int) (j11 & 4294967295L));
    }

    public static String h(long j11) {
        StringBuilder sb2 = new StringBuilder("TextRange(");
        sb2.append((int) (j11 >> 32));
        sb2.append(", ");
        return a2.c.m(sb2, (int) (j11 & 4294967295L), ')');
    }

    public final boolean equals(Object obj) {
        return a(this.f75946a, obj);
    }

    public final int hashCode() {
        return Long.hashCode(this.f75946a);
    }

    public final String toString() {
        return h(this.f75946a);
    }
}
