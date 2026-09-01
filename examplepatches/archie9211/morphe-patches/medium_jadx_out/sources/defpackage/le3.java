package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class le3 implements me3 {
    public final String a;
    public final String b;
    public final SourceParameter c;
    public final String d;

    public le3(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = sourceParameter;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof le3)) {
            return false;
        }
        le3 le3Var = (le3) obj;
        return g76.L(this.a, le3Var.a) && g76.L(this.b, le3Var.b) && g76.L(this.c, le3Var.c) && g76.L(this.d, le3Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ev6.o(this.c, wgd.o(this.a.hashCode() * 31, 31, this.b), 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NoDigest(selectedDigestId=", this.a, ", referrerSource=", this.b, ", sourceParameter=");
        sbU.append(this.c);
        sbU.append(", location=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
