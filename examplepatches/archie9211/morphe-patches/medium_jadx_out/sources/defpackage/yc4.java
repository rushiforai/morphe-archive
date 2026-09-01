package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yc4 implements cd4 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final boolean e;

    public yc4(String str, String str2, String str3, boolean z, boolean z2) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yc4)) {
            return false;
        }
        yc4 yc4Var = (yc4) obj;
        return g76.L(this.a, yc4Var.a) && g76.L(this.b, yc4Var.b) && g76.L(this.c, yc4Var.c) && this.d == yc4Var.d && this.e == yc4Var.e;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        return ((((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Data(id=", this.a, ", title=", this.b, ", description=");
        ka1.D(sbU, this.c, ", isPrivate=", this.d, ", isPredefined=");
        return lv8.t(sbU, this.e, ")");
    }
}
