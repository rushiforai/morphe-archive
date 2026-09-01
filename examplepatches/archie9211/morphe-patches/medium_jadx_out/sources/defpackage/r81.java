package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r81 {
    public final q81 a;
    public final pg1 b;

    public r81(q81 q81Var, pg1 pg1Var) {
        q81Var.getClass();
        this.a = q81Var;
        this.b = pg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r81)) {
            return false;
        }
        r81 r81Var = (r81) obj;
        return g76.L(this.a, r81Var.a) && g76.L(this.b, r81Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        pg1 pg1Var = this.b;
        return iHashCode + (pg1Var == null ? 0 : pg1Var.hashCode());
    }

    public final String toString() {
        return "CatalogDetailAndDownloadStatus(catalogDetail=" + this.a + ", downloadStatus=" + this.b + ")";
    }
}
