package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m81 extends k81 {
    public final String t;
    public final Throwable u;
    public final String v;

    public m81(String str, String str2, Throwable th) {
        str.getClass();
        str2.getClass();
        this.t = str;
        this.u = th;
        this.v = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m81)) {
            return false;
        }
        m81 m81Var = (m81) obj;
        return g76.L(this.t, m81Var.t) && this.u.equals(m81Var.u) && g76.L(this.v, m81Var.v);
    }

    public final int hashCode() {
        return this.v.hashCode() + ((this.u.hashCode() + (this.t.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("UnfollowCatalogFailure(catalogId=");
        sb.append(this.t);
        sb.append(", exception=");
        sb.append(this.u);
        sb.append(", source=");
        return ka1.v(sb, this.v, ")");
    }
}
