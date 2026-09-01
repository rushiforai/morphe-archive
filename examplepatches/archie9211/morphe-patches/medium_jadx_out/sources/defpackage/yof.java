package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yof {
    public final String a;
    public final String b;

    public yof(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof yof) {
            yof yofVar = (yof) obj;
            String str = yofVar.a;
            String str2 = this.a;
            if (str2 != null ? str2.equals(str) : str == null) {
                String str3 = yofVar.b;
                String str4 = this.b;
                if (str4 != null ? str4.equals(str3) : str3 == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = ((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003;
        String str2 = this.b;
        return iHashCode ^ (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return ev6.y("RecaptchaEnforcementState{provider=", this.a, ", enforcementState=", this.b, "}");
    }
}
