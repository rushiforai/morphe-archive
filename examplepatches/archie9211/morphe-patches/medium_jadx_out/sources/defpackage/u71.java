package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u71 extends s71 {
    public final String t;
    public final String u;

    public u71(String str, String str2) {
        str.getClass();
        this.t = str;
        this.u = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u71)) {
            return false;
        }
        u71 u71Var = (u71) obj;
        return g76.L(this.t, u71Var.t) && this.u.equals(u71Var.u);
    }

    public final int hashCode() {
        return this.u.hashCode() + (this.t.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("DeleteCatalogConfirmation(catalogId=", this.t, ", source=", this.u, ")");
    }
}
