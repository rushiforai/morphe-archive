package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zv7 {
    public final String a;
    public final String b;
    public final aw7 c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;

    public zv7(String str, String str2, aw7 aw7Var, String str3, String str4, String str5, String str6, String str7) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = aw7Var;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = str6;
        this.h = str7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zv7)) {
            return false;
        }
        zv7 zv7Var = (zv7) obj;
        return g76.L(this.a, zv7Var.a) && g76.L(this.b, zv7Var.b) && this.c == zv7Var.c && g76.L(this.d, zv7Var.d) && g76.L(this.e, zv7Var.e) && g76.L(this.f, zv7Var.f) && g76.L(this.g, zv7Var.g) && g76.L(this.h, zv7Var.h);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        aw7 aw7Var = this.c;
        int iHashCode3 = (iHashCode2 + (aw7Var == null ? 0 : aw7Var.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.e;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.g;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.h;
        return iHashCode7 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MembershipOffer(id=", this.a, ", pill=", this.b, ", colorScheme=");
        sbU.append(this.c);
        sbU.append(", cta=");
        sbU.append(this.d);
        sbU.append(", plansPageTagline=");
        ka1.C(sbU, this.e, ", tagline=", this.f, ", valueProposition=");
        return km4.C(sbU, this.g, ", couponCode=", this.h, ")");
    }
}
