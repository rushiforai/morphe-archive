package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gk0 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final int e;
    public final lig f;

    public gk0(String str, String str2, String str3, String str4, int i, lig ligVar) {
        if (str == null) {
            z72.c("Null appIdentifier");
            throw null;
        }
        this.a = str;
        if (str2 == null) {
            z72.c("Null versionCode");
            throw null;
        }
        this.b = str2;
        if (str3 == null) {
            z72.c("Null versionName");
            throw null;
        }
        this.c = str3;
        if (str4 == null) {
            z72.c("Null installUuid");
            throw null;
        }
        this.d = str4;
        this.e = i;
        this.f = ligVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof gk0) {
            gk0 gk0Var = (gk0) obj;
            return this.a.equals(gk0Var.a) && this.b.equals(gk0Var.b) && this.c.equals(gk0Var.c) && this.d.equals(gk0Var.d) && this.e == gk0Var.e && this.f == gk0Var.f;
        }
        return false;
    }

    public final int hashCode() {
        return this.f.hashCode() ^ ((((((((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003) ^ this.c.hashCode()) * 1000003) ^ this.d.hashCode()) * 1000003) ^ this.e) * 1000003);
    }

    public final String toString() {
        return "AppData{appIdentifier=" + this.a + ", versionCode=" + this.b + ", versionName=" + this.c + ", installUuid=" + this.d + ", deliveryMechanism=" + this.e + ", developmentPlatformProvider=" + this.f + "}";
    }
}
