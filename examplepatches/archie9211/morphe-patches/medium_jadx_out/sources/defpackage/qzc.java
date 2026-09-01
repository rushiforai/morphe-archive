package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qzc implements rzc {
    public final String a;
    public final int b;
    public final String c;
    public final String d;

    public qzc(int i, String str, String str2, String str3) {
        this.a = str;
        this.b = i;
        this.c = str2;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qzc)) {
            return false;
        }
        qzc qzcVar = (qzc) obj;
        return this.a.equals(qzcVar.a) && this.b == qzcVar.b && this.c.equals(qzcVar.c) && g76.L(this.d, qzcVar.d);
    }

    public final int hashCode() {
        int iO = wgd.o(((this.a.hashCode() * 31) + this.b) * 31, 31, this.c);
        String str = this.d;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return km4.C(y30.t(this.b, "Introductory(period=", this.a, ", billingCycleCount=", ", regularPrice="), this.c, ", discountCode=", this.d, ")");
    }
}
