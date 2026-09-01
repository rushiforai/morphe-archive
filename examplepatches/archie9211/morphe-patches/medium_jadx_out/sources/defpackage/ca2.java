package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ca2 {
    public final String a;
    public final String b;
    public final String c;

    public ca2(String str, String str2, String str3) {
        b09.I(str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ca2)) {
            return false;
        }
        ca2 ca2Var = (ca2) obj;
        return g76.L(this.a, ca2Var.a) && g76.L(this.b, ca2Var.b) && g76.L(this.c, ca2Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return ka1.v(y30.u("CookieKey(domain=", this.a, ", path=", this.b, ", name="), this.c, ")");
    }
}
