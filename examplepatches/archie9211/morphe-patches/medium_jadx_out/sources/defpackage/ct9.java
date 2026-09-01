package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ct9 implements ou9 {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final String e;

    public ct9(String str, String str2, String str3, String str4, boolean z) {
        b09.I(str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ct9)) {
            return false;
        }
        ct9 ct9Var = (ct9) obj;
        return g76.L(this.a, ct9Var.a) && g76.L(this.b, ct9Var.b) && g76.L(this.c, ct9Var.c) && this.d == ct9Var.d && this.e.equals(ct9Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("NavigateToReportResponse(responseId=", this.a, ", authorId=", this.b, ", rootPostId=");
        ka1.D(sbU, this.c, ", canHideResponse=", this.d, ", source=");
        return ka1.v(sbU, this.e, ")");
    }
}
