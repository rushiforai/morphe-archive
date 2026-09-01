package defpackage;

import com.medium.android.core.models.CatalogName;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ucd {
    public final String a;
    public final CatalogName b;
    public final String c;
    public final String d;
    public final ArrayList e;
    public final String f;

    public ucd(String str, CatalogName catalogName, String str2, String str3, ArrayList arrayList, String str4) {
        str.getClass();
        catalogName.getClass();
        str2.getClass();
        this.a = str;
        this.b = catalogName;
        this.c = str2;
        this.d = str3;
        this.e = arrayList;
        this.f = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ucd)) {
            return false;
        }
        ucd ucdVar = (ucd) obj;
        return g76.L(this.a, ucdVar.a) && g76.L(this.b, ucdVar.b) && g76.L(this.c, ucdVar.c) && g76.L(this.d, ucdVar.d) && this.e.equals(ucdVar.e) && this.f.equals(ucdVar.f);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.f.hashCode() + b09.p(this.e, (iO + (str == null ? 0 : str.hashCode())) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CuratedListSection(curatedListId=");
        sb.append(this.a);
        sb.append(", curatedListName=");
        sb.append(this.b);
        sb.append(", curatedListAuthorId=");
        ka1.C(sb, this.c, ", curatedListAuthorName=", this.d, ", posts=");
        sb.append(this.e);
        sb.append(", seeFullListSource=");
        sb.append(this.f);
        sb.append(")");
        return sb.toString();
    }
}
