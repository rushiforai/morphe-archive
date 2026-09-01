package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zyd implements Comparable {
    public final int a;

    public /* synthetic */ zyd(int i) {
        this.a = i;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return g76.Q(this.a ^ Integer.MIN_VALUE, ((zyd) obj).a ^ Integer.MIN_VALUE);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zyd) {
            return this.a == ((zyd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return String.valueOf(((long) this.a) & 4294967295L);
    }
}
