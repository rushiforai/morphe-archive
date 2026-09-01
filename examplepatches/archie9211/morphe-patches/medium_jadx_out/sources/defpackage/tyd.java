package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tyd implements Comparable {
    public final byte a;

    @Override // java.lang.Comparable
    public final /* synthetic */ int compareTo(Object obj) {
        return g76.Q(this.a & 255, ((tyd) obj).a & 255);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof tyd) {
            return this.a == ((tyd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return String.valueOf(this.a & 255);
    }
}
