package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f9c implements i9c {
    public final String a;
    public final boolean b;
    public final String c;
    public final String d;
    public final boolean e;
    public final String f;
    public final String g;
    public final boolean h;
    public final String i;

    public f9c(String str, boolean z, String str2, String str3, boolean z2, String str4, String str5, boolean z3, String str6) {
        str.getClass();
        str6.getClass();
        this.a = str;
        this.b = z;
        this.c = str2;
        this.d = str3;
        this.e = z2;
        this.f = str4;
        this.g = str5;
        this.h = z3;
        this.i = str6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f9c)) {
            return false;
        }
        f9c f9cVar = (f9c) obj;
        return g76.L(this.a, f9cVar.a) && this.b == f9cVar.b && this.c.equals(f9cVar.c) && this.d.equals(f9cVar.d) && this.e == f9cVar.e && g76.L(this.f, f9cVar.f) && g76.L(this.g, f9cVar.g) && this.h == f9cVar.h && g76.L(this.i, f9cVar.i);
    }

    public final int hashCode() {
        int iO = (wgd.o(wgd.o(((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31, 31, this.c), 31, this.d) + (this.e ? 1231 : 1237)) * 31;
        String str = this.f;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.g;
        return this.i.hashCode() + ((((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.h ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("Content(postId=", this.a, ", canMuteAuthor=", ", authorId=", this.b);
        ka1.C(sbD, this.c, ", authorName=", this.d, ", canMuteCollection=");
        sbD.append(this.e);
        sbD.append(", collectionId=");
        sbD.append(this.f);
        sbD.append(", collectionName=");
        ka1.D(sbD, this.g, ", isLoading=", this.h, ", source=");
        return ka1.v(sbD, this.i, ")");
    }
}
