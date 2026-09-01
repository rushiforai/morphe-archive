package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eq8 extends vp7 {
    public final dq8 g;
    public final iy6 h;

    public eq8(iy6 iy6Var, dq8 dq8Var) {
        dq8Var.getClass();
        this.g = dq8Var;
        this.h = iy6Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eq8)) {
            return false;
        }
        eq8 eq8Var = (eq8) obj;
        return g76.L(this.g, eq8Var.g) && g76.L(this.h, eq8Var.h);
    }

    public final int hashCode() {
        int iHashCode = this.g.hashCode() * 31;
        iy6 iy6Var = this.h;
        return iHashCode + (iy6Var == null ? 0 : iy6Var.hashCode());
    }

    public final String toString() {
        return "OnBackPressedCallbackInfo(callback=" + this.g + ", owner=" + this.h + ')';
    }
}
