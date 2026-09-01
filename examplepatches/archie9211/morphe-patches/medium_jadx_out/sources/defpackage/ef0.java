package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ef0 extends vv2 {
    public final long u;

    public ef0(long j) {
        this.u = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ef0) && this.u == ((ef0) obj).u;
    }

    public final int hashCode() {
        long j = this.u;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return b09.x("Published(firstPublishedAt=", ")", this.u);
    }
}
