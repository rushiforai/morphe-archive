package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bge {
    public final String a;
    public final String b;
    public final ArrayList c;
    public final ArrayList d;
    public final Long e;
    public final List f;

    public bge(String str, String str2, ArrayList arrayList, ArrayList arrayList2, Long l, List list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = arrayList;
        this.d = arrayList2;
        this.e = l;
        this.f = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bge)) {
            return false;
        }
        bge bgeVar = (bge) obj;
        return g76.L(this.a, bgeVar.a) && g76.L(this.b, bgeVar.b) && this.c.equals(bgeVar.c) && this.d.equals(bgeVar.d) && g76.L(this.e, bgeVar.e) && g76.L(this.f, bgeVar.f);
    }

    public final int hashCode() {
        int iP = b09.p(this.d, b09.p(this.c, wgd.o(this.a.hashCode() * 31, 31, this.b), 31), 31);
        Long l = this.e;
        return this.f.hashCode() + ((iP + (l == null ? 0 : l.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Book(title=", this.a, ", coverImageId=", this.b, ", authors=");
        sbU.append(this.c);
        sbU.append(", links=");
        sbU.append(this.d);
        sbU.append(", publicationDate=");
        sbU.append(this.e);
        sbU.append(", isbns=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
