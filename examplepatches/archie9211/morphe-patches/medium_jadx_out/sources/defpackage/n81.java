package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n81 extends k81 {
    public final String t;
    public final String u;

    public n81(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.t = str;
        this.u = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n81)) {
            return false;
        }
        n81 n81Var = (n81) obj;
        return g76.L(this.t, n81Var.t) && g76.L(this.u, n81Var.u);
    }

    public final int hashCode() {
        return this.u.hashCode() + (this.t.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("UnfollowCatalogSuccess(catalogId=", this.t, ", source=", this.u, ")");
    }
}
