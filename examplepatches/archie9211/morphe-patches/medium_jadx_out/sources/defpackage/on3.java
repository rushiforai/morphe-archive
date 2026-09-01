package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class on3 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final boolean e;

    public on3(String str, String str2, String str3, String str4, boolean z) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof on3)) {
            return false;
        }
        on3 on3Var = (on3) obj;
        return g76.L(this.a, on3Var.a) && g76.L(this.b, on3Var.b) && g76.L(this.c, on3Var.c) && this.d.equals(on3Var.d) && this.e == on3Var.e;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.d) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        String strA = ax5.a(this.d);
        StringBuilder sbU = y30.u("Creator(name=", this.a, ", jobTitle=", this.b, ", company=");
        ka1.C(sbU, this.c, ", imageId=", strA, ", hideOnMediumScreen=");
        return lv8.t(sbU, this.e, ")");
    }
}
