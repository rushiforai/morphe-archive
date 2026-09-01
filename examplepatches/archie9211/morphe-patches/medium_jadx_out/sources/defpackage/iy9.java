package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iy9 extends vp7 {
    public final Object g;
    public final long h;

    public iy9(long j, Object obj) {
        this.g = obj;
        this.h = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof iy9)) {
            return false;
        }
        iy9 iy9Var = (iy9) obj;
        return this.g.equals(iy9Var.g) && this.h == iy9Var.h;
    }

    public final int hashCode() {
        int iHashCode = this.g.hashCode() * 31;
        long j = this.h;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return "PredictiveBackHandlerInfo(owner=" + this.g + ", compositeKey=" + this.h + ')';
    }
}
