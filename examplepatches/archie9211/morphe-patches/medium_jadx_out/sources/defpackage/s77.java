package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s77 {
    public static final String[] f = {"anonymous_id", "id", "name", "email"};
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final Map e;

    public s77(String str, String str2, String str3, String str4, Map map) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s77)) {
            return false;
        }
        s77 s77Var = (s77) obj;
        return g76.L(this.a, s77Var.a) && g76.L(this.b, s77Var.b) && g76.L(this.c, s77Var.c) && g76.L(this.d, s77Var.d) && this.e.equals(s77Var.e);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.d;
        return this.e.hashCode() + ((iHashCode3 + (str4 != null ? str4.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Usr(anonymousId=", this.a, ", id=", this.b, ", name=");
        ka1.C(sbU, this.c, ", email=", this.d, ", additionalProperties=");
        sbU.append(this.e);
        sbU.append(")");
        return sbU.toString();
    }
}
