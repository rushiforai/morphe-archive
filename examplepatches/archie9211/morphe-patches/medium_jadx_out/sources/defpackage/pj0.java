package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pj0 {
    public final String a;
    public final String b;
    public final String c;
    public final jk0 d;
    public final t36 e;

    public pj0(String str, String str2, String str3, jk0 jk0Var, t36 t36Var) {
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = jk0Var;
        this.e = t36Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof pj0) {
            pj0 pj0Var = (pj0) obj;
            String str = pj0Var.a;
            String str2 = this.a;
            if (str2 != null ? str2.equals(str) : str == null) {
                String str3 = pj0Var.b;
                String str4 = this.b;
                if (str4 != null ? str4.equals(str3) : str3 == null) {
                    String str5 = pj0Var.c;
                    String str6 = this.c;
                    if (str6 != null ? str6.equals(str5) : str5 == null) {
                        jk0 jk0Var = pj0Var.d;
                        jk0 jk0Var2 = this.d;
                        if (jk0Var2 != null ? jk0Var2.equals(jk0Var) : jk0Var == null) {
                            t36 t36Var = pj0Var.e;
                            t36 t36Var2 = this.e;
                            if (t36Var2 != null ? t36Var2.equals(t36Var) : t36Var == null) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = ((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003;
        String str2 = this.b;
        int iHashCode2 = (iHashCode ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.c;
        int iHashCode3 = (iHashCode2 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        jk0 jk0Var = this.d;
        int iHashCode4 = (iHashCode3 ^ (jk0Var == null ? 0 : jk0Var.hashCode())) * 1000003;
        t36 t36Var = this.e;
        return iHashCode4 ^ (t36Var != null ? t36Var.hashCode() : 0);
    }

    public final String toString() {
        return "InstallationResponse{uri=" + this.a + ", fid=" + this.b + ", refreshToken=" + this.c + ", authToken=" + this.d + ", responseCode=" + this.e + "}";
    }
}
