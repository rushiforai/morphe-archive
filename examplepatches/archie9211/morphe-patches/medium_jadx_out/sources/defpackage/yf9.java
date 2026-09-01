package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yf9 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final String e;
    public final String f;
    public final String g;
    public final boolean h;
    public final jda i;

    public yf9(String str, String str2, String str3, boolean z, String str4, String str5, String str6, boolean z2, jda jdaVar) {
        jdaVar.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = str4;
        this.f = str5;
        this.g = str6;
        this.h = z2;
        this.i = jdaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yf9)) {
            return false;
        }
        yf9 yf9Var = (yf9) obj;
        return this.a.equals(yf9Var.a) && this.b.equals(yf9Var.b) && this.c.equals(yf9Var.c) && this.d == yf9Var.d && this.e.equals(yf9Var.e) && this.f.equals(yf9Var.f) && g76.L(this.g, yf9Var.g) && this.h == yf9Var.h && g76.L(this.i, yf9Var.i);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o((wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237)) * 31, 31, this.e), 31, this.f);
        String str = this.g;
        return this.i.hashCode() + ((((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.h ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostFeaturingData(postTitle=", this.a, ", authorId=", this.b, ", authorName=");
        ka1.D(sbU, this.c, ", isAuthorABookAuthor=", this.d, ", publicationId=");
        ka1.C(sbU, this.e, ", publicationName=", this.f, ", publicationAvatar=");
        ka1.D(sbU, this.g, ", isPostFeatured=", this.h, ", publicationFeaturingTokenBalance=");
        sbU.append(this.i);
        sbU.append(")");
        return sbU.toString();
    }
}
