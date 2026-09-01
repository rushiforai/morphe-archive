package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pb4 {
    public final String a;
    public final String b;
    public final String c;
    public final SourceParameter d;

    public pb4(SourceParameter sourceParameter, String str, String str2, String str3) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pb4)) {
            return false;
        }
        pb4 pb4Var = (pb4) obj;
        return g76.L(this.a, pb4Var.a) && g76.L(this.b, pb4Var.b) && g76.L(this.c, pb4Var.c) && this.d.equals(pb4Var.d);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return this.d.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ViewState(publicationId=", this.a, ", publicationName=", this.b, ", publicationImageId=");
        sbU.append(this.c);
        sbU.append(", sourceParameter=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
