package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a81 extends x71 {
    public final String t;
    public final String u;

    public a81(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.t = str;
        this.u = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a81)) {
            return false;
        }
        a81 a81Var = (a81) obj;
        return g76.L(this.t, a81Var.t) && g76.L(this.u, a81Var.u);
    }

    public final int hashCode() {
        return this.u.hashCode() + (this.t.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("FollowCatalogSuccess(catalogId=", this.t, ", source=", this.u, ")");
    }
}
