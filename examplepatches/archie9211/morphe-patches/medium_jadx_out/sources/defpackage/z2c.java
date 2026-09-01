package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z2c {
    public final zw7 a;
    public final String b;
    public final boolean c;
    public final String d;

    public z2c(zw7 zw7Var, String str, boolean z, String str2) {
        zw7Var.getClass();
        this.a = zw7Var;
        this.b = str;
        this.c = z;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z2c)) {
            return false;
        }
        z2c z2cVar = (z2c) obj;
        return this.a == z2cVar.a && this.b.equals(z2cVar.b) && this.c == z2cVar.c && g76.L(this.d, z2cVar.d);
    }

    public final int hashCode() {
        int iO = (wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31;
        String str = this.d;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "ResubscribeMembershipUiModel(membershipType=" + this.a + ", expiresDate=" + this.b + ", isGooglePaymentProvider=" + this.c + ", productId=" + this.d + ")";
    }
}
