package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wl6 extends ql6 {
    public final long a;

    public wl6(long j) {
        this.a = j;
    }

    @Override // defpackage.ql6
    public final Object a() {
        return new ezd(this.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wl6) && this.a == ((wl6) obj).a;
    }

    public final int hashCode() {
        return ev6.n(this.a);
    }
}
