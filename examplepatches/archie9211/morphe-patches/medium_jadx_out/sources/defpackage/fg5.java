package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fg5 {
    public final long a;

    public final boolean equals(Object obj) {
        if (obj instanceof fg5) {
            return this.a == ((fg5) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return "GridItemSpan(packedValue=" + this.a + ')';
    }
}
