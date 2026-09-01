package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cg9 implements dg9 {
    public final String a;
    public final String b;

    public cg9(String str, String str2) {
        str.getClass();
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cg9)) {
            return false;
        }
        cg9 cg9Var = (cg9) obj;
        return g76.L(this.a, cg9Var.a) && this.b.equals(cg9Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("NotFeatured(postId=", this.a, ", publicationName=", this.b, ")");
    }
}
