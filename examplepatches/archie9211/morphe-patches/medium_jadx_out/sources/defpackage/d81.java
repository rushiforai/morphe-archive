package defpackage;

import com.medium.android.core.models.CatalogName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d81 extends o81 {
    public final String t;
    public final CatalogName u;
    public final String v;

    public d81(String str, CatalogName catalogName, String str2) {
        str.getClass();
        catalogName.getClass();
        this.t = str;
        this.u = catalogName;
        this.v = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d81)) {
            return false;
        }
        d81 d81Var = (d81) obj;
        return g76.L(this.t, d81Var.t) && g76.L(this.u, d81Var.u) && this.v.equals(d81Var.v);
    }

    public final int hashCode() {
        return this.v.hashCode() + ((this.u.hashCode() + (this.t.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MakeCatalogPrivateSuccess(catalogId=");
        sb.append(this.t);
        sb.append(", catalogName=");
        sb.append(this.u);
        sb.append(", source=");
        return ka1.v(sb, this.v, ")");
    }
}
