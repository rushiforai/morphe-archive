package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h77 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final ArrayList e;

    public h77(String str, String str2, String str3, String str4, ArrayList arrayList) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h77)) {
            return false;
        }
        h77 h77Var = (h77) obj;
        return this.a.equals(h77Var.a) && g76.L(this.b, h77Var.b) && this.c.equals(h77Var.c) && g76.L(this.d, h77Var.d) && g76.L(this.e, h77Var.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 961, this.c);
        String str2 = this.d;
        int iHashCode2 = (iO + (str2 == null ? 0 : str2.hashCode())) * 31;
        ArrayList arrayList = this.e;
        return iHashCode2 + (arrayList != null ? arrayList.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Error(kind=", this.a, ", message=", this.b, ", stack=");
        ka1.C(sbU, this.c, ", sourceType=null, fingerprint=", this.d, ", threads=");
        sbU.append(this.e);
        sbU.append(")");
        return sbU.toString();
    }
}
