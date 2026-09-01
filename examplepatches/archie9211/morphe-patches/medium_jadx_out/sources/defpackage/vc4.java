package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vc4 {
    public final String a;
    public final String b;
    public final String c;

    public vc4(String str, String str2, String str3) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vc4)) {
            return false;
        }
        vc4 vc4Var = (vc4) obj;
        return g76.L(this.a, vc4Var.a) && this.b.equals(vc4Var.b) && this.c.equals(vc4Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("FeaturedUser(id=", this.a, ", name=", this.b, ", imageId="), this.c, ")");
    }
}
