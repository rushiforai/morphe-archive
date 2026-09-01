package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ozc {
    public final String a;
    public final String b;
    public final aw7 c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;

    public ozc(String str, String str2, aw7 aw7Var, String str3, String str4, String str5, String str6) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = aw7Var;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = str6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ozc)) {
            return false;
        }
        ozc ozcVar = (ozc) obj;
        return g76.L(this.a, ozcVar.a) && g76.L(this.b, ozcVar.b) && this.c == ozcVar.c && g76.L(this.d, ozcVar.d) && g76.L(this.e, ozcVar.e) && g76.L(this.f, ozcVar.f) && g76.L(this.g, ozcVar.g);
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
        return iHashCode6 + (str5 != null ? str5.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MembershipOffer(id=", this.a, ", pill=", this.b, ", colorScheme=");
        sbU.append(this.c);
        sbU.append(", cta=");
        sbU.append(this.d);
        sbU.append(", plansPageTagline=");
        ka1.C(sbU, this.e, ", tagline=", this.f, ", valueProposition=");
        return ka1.v(sbU, this.g, ")");
    }
}
