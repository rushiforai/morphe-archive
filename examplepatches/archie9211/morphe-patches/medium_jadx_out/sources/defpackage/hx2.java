package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hx2 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;

    public hx2(String str, String str2, String str3, String str4) {
        str3.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hx2)) {
            return false;
        }
        hx2 hx2Var = (hx2) obj;
        return this.a.equals(hx2Var.a) && this.b.equals(hx2Var.b) && g76.L(this.c, hx2Var.c) && g76.L(this.d, hx2Var.d);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
        String str = this.d;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return km4.C(y30.u("BillingFlowContext(productId=", this.a, ", source=", this.b, ", referrerSource="), this.c, ", location=", this.d, ")");
    }
}
