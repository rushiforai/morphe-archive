package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zib {
    public final zw7 a;
    public final String b;
    public final boolean c;
    public final String d;
    public final boolean e;

    public zib(zw7 zw7Var, String str, boolean z, String str2, boolean z2) {
        zw7Var.getClass();
        this.a = zw7Var;
        this.b = str;
        this.c = z;
        this.d = str2;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zib)) {
            return false;
        }
        zib zibVar = (zib) obj;
        return this.a == zibVar.a && this.b.equals(zibVar.b) && this.c == zibVar.c && g76.L(this.d, zibVar.d) && this.e == zibVar.e;
    }

    public final int hashCode() {
        int iO = (wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31;
        String str = this.d;
        return ((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ResubscribeBannerUiModel(membershipType=");
        sb.append(this.a);
        sb.append(", expiresDate=");
        sb.append(this.b);
        sb.append(", isGooglePaymentProvider=");
        sb.append(this.c);
        sb.append(", productId=");
        sb.append(this.d);
        sb.append(", isCloseable=");
        return lv8.t(sb, this.e, ")");
    }
}
