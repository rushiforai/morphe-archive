package defpackage;

import com.medium.android.core.models.CatalogName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jf1 {
    public final String a;
    public final CatalogName b;
    public final String c;
    public final String d;
    public final String e;

    public jf1(String str, CatalogName catalogName, String str2, String str3, String str4) {
        str.getClass();
        catalogName.getClass();
        str2.getClass();
        str4.getClass();
        this.a = str;
        this.b = catalogName;
        this.c = str2;
        this.d = str3;
        this.e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jf1)) {
            return false;
        }
        jf1 jf1Var = (jf1) obj;
        return g76.L(this.a, jf1Var.a) && g76.L(this.b, jf1Var.b) && g76.L(this.c, jf1Var.c) && g76.L(this.d, jf1Var.d) && g76.L(this.e, jf1Var.e);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.e.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CatalogRecircHeaderUiModel(catalogId=");
        sb.append(this.a);
        sb.append(", catalogName=");
        sb.append(this.b);
        sb.append(", authorId=");
        ka1.C(sb, this.c, ", authorName=", this.d, ", source=");
        return ka1.v(sb, this.e, ")");
    }
}
