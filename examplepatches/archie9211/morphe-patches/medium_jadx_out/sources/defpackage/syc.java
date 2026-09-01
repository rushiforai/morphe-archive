package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class syc implements vyc {
    public final String a;
    public final String b;
    public final String c;
    public final String d;

    public syc(String str, String str2, String str3, String str4) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof syc)) {
            return false;
        }
        syc sycVar = (syc) obj;
        return this.a.equals(sycVar.a) && this.b.equals(sycVar.b) && g76.L(this.c, sycVar.c) && g76.L(this.d, sycVar.d);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return km4.C(y30.u("LaunchBillingFlow(productId=", this.a, ", offerToken=", this.b, ", oldProductId="), this.c, ", oldPurchaseToken=", this.d, ")");
    }
}
