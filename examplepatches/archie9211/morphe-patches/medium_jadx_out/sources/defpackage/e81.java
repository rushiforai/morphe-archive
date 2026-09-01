package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e81 extends o81 {
    public final String t;
    public final String u;
    public final Throwable v;

    public e81(String str, String str2, Throwable th) {
        str.getClass();
        this.t = str;
        this.u = str2;
        this.v = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e81)) {
            return false;
        }
        e81 e81Var = (e81) obj;
        return g76.L(this.t, e81Var.t) && this.u.equals(e81Var.u) && g76.L(this.v, e81Var.v);
    }

    public final int hashCode() {
        int iO = wgd.o(this.t.hashCode() * 31, 31, this.u);
        Throwable th = this.v;
        return iO + (th == null ? 0 : th.hashCode());
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MakeCatalogPublicFailure(catalogId=", this.t, ", source=", this.u, ", exception=");
        sbU.append(this.v);
        sbU.append(")");
        return sbU.toString();
    }
}
