package defpackage;

import com.medium.android.core.models.CatalogName;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d8d {
    public final String a;
    public final CatalogName b;
    public final String c;
    public final String d;
    public final ArrayList e;

    public d8d(String str, CatalogName catalogName, String str2, String str3, ArrayList arrayList) {
        str.getClass();
        catalogName.getClass();
        str2.getClass();
        this.a = str;
        this.b = catalogName;
        this.c = str2;
        this.d = str3;
        this.e = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d8d)) {
            return false;
        }
        d8d d8dVar = (d8d) obj;
        return g76.L(this.a, d8dVar.a) && g76.L(this.b, d8dVar.b) && g76.L(this.c, d8dVar.c) && g76.L(this.d, d8dVar.d) && this.e.equals(d8dVar.e);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.e.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TagCuratedCatalog(catalogId=");
        sb.append(this.a);
        sb.append(", catalogName=");
        sb.append(this.b);
        sb.append(", authorId=");
        ka1.C(sb, this.c, ", authorName=", this.d, ", posts=");
        sb.append(this.e);
        sb.append(")");
        return sb.toString();
    }
}
