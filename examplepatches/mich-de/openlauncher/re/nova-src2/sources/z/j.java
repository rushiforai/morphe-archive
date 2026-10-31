package z;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final long f97781a;

    public /* synthetic */ j(long j11) {
        this.f97781a = j11;
    }

    public static long a(int i5, int i11) {
        return (i11 & 4294967295L) | (i5 << 32);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof j) {
            return this.f97781a == ((j) obj).f97781a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f97781a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("(");
        long j11 = this.f97781a;
        sb2.append((int) (j11 >> 32));
        sb2.append(", ");
        return a2.c.m(sb2, (int) (j11 & 4294967295L), ')');
    }
}
