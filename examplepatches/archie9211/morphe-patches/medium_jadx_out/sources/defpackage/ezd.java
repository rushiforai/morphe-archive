package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ezd implements Comparable {
    public final long a;

    public /* synthetic */ ezd(long j) {
        this.a = j;
    }

    public static final boolean a(long j, long j2) {
        return j == j2;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return g76.R(this.a ^ Long.MIN_VALUE, ((ezd) obj).a ^ Long.MIN_VALUE);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ezd) {
            return this.a == ((ezd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return ev6.n(this.a);
    }

    public final String toString() {
        return wo7.y(10, this.a);
    }
}
