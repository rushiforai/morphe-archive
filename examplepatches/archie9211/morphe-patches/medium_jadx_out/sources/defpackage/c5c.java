package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c5c {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final sw5 f;

    public c5c(String str, String str2, String str3, String str4, String str5, sw5 sw5Var) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = str5;
        this.f = sw5Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c5c)) {
            return false;
        }
        c5c c5cVar = (c5c) obj;
        return g76.L(this.a, c5cVar.a) && g76.L(this.b, c5cVar.b) && g76.L(this.c, c5cVar.c) && g76.L(this.d, c5cVar.d) && this.e.equals(c5cVar.e) && g76.L(this.f, c5cVar.f);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.d;
        int iO = wgd.o((iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31, 31, this.e);
        sw5 sw5Var = this.f;
        return iO + (sw5Var != null ? sw5Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ShareHighlightUiModel(text=", this.a, ", postTitle=", this.b, ", authorName=");
        ka1.C(sbU, this.c, ", authorImageId=", this.d, ", authorUrl=");
        sbU.append(this.e);
        sbU.append(", backgroundPreviewImage=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
