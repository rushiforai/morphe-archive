package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tf9 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final SourceParameter e;

    public tf9(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        ho2.O(sourceParameter, str, str2);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tf9)) {
            return false;
        }
        tf9 tf9Var = (tf9) obj;
        return g76.L(this.a, tf9Var.a) && g76.L(this.b, tf9Var.b) && this.c.equals(tf9Var.c) && g76.L(this.d, tf9Var.d) && g76.L(this.e, tf9Var.e);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        String str = this.d;
        return this.e.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostFeaturedInPublicationChipUiModel(postId=", this.a, ", publicationId=", this.b, ", publicationName=");
        ka1.C(sbU, this.c, ", publicationImage=", this.d, ", sourceParameter=");
        return y30.r(sbU, this.e, ")");
    }
}
