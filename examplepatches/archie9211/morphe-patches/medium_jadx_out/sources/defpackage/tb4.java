package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tb4 {
    public final String a;
    public final String b;
    public final jda c;

    public tb4(String str, String str2, jda jdaVar) {
        str.getClass();
        str2.getClass();
        jdaVar.getClass();
        this.a = str;
        this.b = str2;
        this.c = jdaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tb4)) {
            return false;
        }
        tb4 tb4Var = (tb4) obj;
        return g76.L(this.a, tb4Var.a) && g76.L(this.b, tb4Var.b) && g76.L(this.c, tb4Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FeaturedPostsData(publicationId=", this.a, ", publicationName=", this.b, ", publicationFeaturingTokenBalance=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
