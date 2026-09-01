package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wl0 extends vp7 {
    public final Object g;
    public final long h;

    public wl0(long j, Object obj) {
        this.g = obj;
        this.h = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wl0)) {
            return false;
        }
        wl0 wl0Var = (wl0) obj;
        return this.g.equals(wl0Var.g) && this.h == wl0Var.h;
    }

    public final int hashCode() {
        int iHashCode = this.g.hashCode() * 31;
        long j = this.h;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return "BackHandlerInfo(owner=" + this.g + ", compositeKey=" + this.h + ')';
    }
}
