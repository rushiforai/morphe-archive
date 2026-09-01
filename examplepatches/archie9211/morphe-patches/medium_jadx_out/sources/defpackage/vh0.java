package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vh0 extends pd2 {
    public final String b;
    public final String c;
    public final int d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final String i;
    public final String j;
    public final od2 k;
    public final uc2 l;
    public final rc2 m;

    public vh0(String str, String str2, int i, String str3, String str4, String str5, String str6, String str7, String str8, od2 od2Var, uc2 uc2Var, rc2 rc2Var) {
        this.b = str;
        this.c = str2;
        this.d = i;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = str7;
        this.j = str8;
        this.k = od2Var;
        this.l = uc2Var;
        this.m = rc2Var;
    }

    public final uh0 a() {
        uh0 uh0Var = new uh0();
        uh0Var.a = this.b;
        uh0Var.b = this.c;
        uh0Var.c = this.d;
        uh0Var.d = this.e;
        uh0Var.e = this.f;
        uh0Var.f = this.g;
        uh0Var.g = this.h;
        uh0Var.h = this.i;
        uh0Var.i = this.j;
        uh0Var.j = this.k;
        uh0Var.k = this.l;
        uh0Var.l = this.m;
        uh0Var.m = (byte) 1;
        return uh0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof pd2) {
            vh0 vh0Var = (vh0) ((pd2) obj);
            if (this.b.equals(vh0Var.b) && this.c.equals(vh0Var.c) && this.d == vh0Var.d && this.e.equals(vh0Var.e)) {
                String str = vh0Var.f;
                String str2 = this.f;
                if (str2 != null ? str2.equals(str) : str == null) {
                    String str3 = vh0Var.g;
                    String str4 = this.g;
                    if (str4 != null ? str4.equals(str3) : str3 == null) {
                        String str5 = vh0Var.h;
                        String str6 = this.h;
                        if (str6 != null ? str6.equals(str5) : str5 == null) {
                            if (this.i.equals(vh0Var.i) && this.j.equals(vh0Var.j)) {
                                od2 od2Var = vh0Var.k;
                                od2 od2Var2 = this.k;
                                if (od2Var2 != null ? od2Var2.equals(od2Var) : od2Var == null) {
                                    uc2 uc2Var = vh0Var.l;
                                    uc2 uc2Var2 = this.l;
                                    if (uc2Var2 != null ? uc2Var2.equals(uc2Var) : uc2Var == null) {
                                        rc2 rc2Var = vh0Var.m;
                                        rc2 rc2Var2 = this.m;
                                        if (rc2Var2 != null ? rc2Var2.equals(rc2Var) : rc2Var == null) {
                                            return true;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (((((((this.b.hashCode() ^ 1000003) * 1000003) ^ this.c.hashCode()) * 1000003) ^ this.d) * 1000003) ^ this.e.hashCode()) * 1000003;
        String str = this.f;
        int iHashCode2 = (iHashCode ^ (str == null ? 0 : str.hashCode())) * 1000003;
        String str2 = this.g;
        int iHashCode3 = (iHashCode2 ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.h;
        int iHashCode4 = (((((iHashCode3 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003) ^ this.i.hashCode()) * 1000003) ^ this.j.hashCode()) * 1000003;
        od2 od2Var = this.k;
        int iHashCode5 = (iHashCode4 ^ (od2Var == null ? 0 : od2Var.hashCode())) * 1000003;
        uc2 uc2Var = this.l;
        int iHashCode6 = (iHashCode5 ^ (uc2Var == null ? 0 : uc2Var.hashCode())) * 1000003;
        rc2 rc2Var = this.m;
        return iHashCode6 ^ (rc2Var != null ? rc2Var.hashCode() : 0);
    }

    public final String toString() {
        return "CrashlyticsReport{sdkVersion=" + this.b + ", gmpAppId=" + this.c + ", platform=" + this.d + ", installationUuid=" + this.e + ", firebaseInstallationId=" + this.f + ", firebaseAuthenticationToken=" + this.g + ", appQualitySessionId=" + this.h + ", buildVersion=" + this.i + ", displayVersion=" + this.j + ", session=" + this.k + ", ndkPayload=" + this.l + ", appExitInfo=" + this.m + "}";
    }
}
