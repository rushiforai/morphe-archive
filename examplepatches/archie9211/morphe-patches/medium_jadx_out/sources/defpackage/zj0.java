package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zj0 {
    public static final /* synthetic */ int h = 0;
    public final String a;
    public final g89 b;
    public final String c;
    public final String d;
    public final long e;
    public final long f;
    public final String g;

    static {
        yj0 yj0Var = new yj0();
        yj0Var.f = 0L;
        yj0Var.h = (byte) (yj0Var.h | 2);
        yj0Var.b(g89.ATTEMPT_MIGRATION);
        yj0Var.e = 0L;
        yj0Var.h = (byte) (yj0Var.h | 1);
        yj0Var.a();
    }

    public zj0(String str, g89 g89Var, String str2, String str3, long j, long j2, String str4) {
        this.a = str;
        this.b = g89Var;
        this.c = str2;
        this.d = str3;
        this.e = j;
        this.f = j2;
        this.g = str4;
    }

    public final yj0 a() {
        yj0 yj0Var = new yj0();
        yj0Var.a = this.a;
        yj0Var.b = this.b;
        yj0Var.c = this.c;
        yj0Var.d = this.d;
        yj0Var.e = this.e;
        yj0Var.f = this.f;
        yj0Var.g = this.g;
        yj0Var.h = (byte) 3;
        return yj0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zj0) {
            zj0 zj0Var = (zj0) obj;
            String str = zj0Var.a;
            String str2 = this.a;
            if (str2 != null ? str2.equals(str) : str == null) {
                if (this.b.equals(zj0Var.b)) {
                    String str3 = zj0Var.c;
                    String str4 = this.c;
                    if (str4 != null ? str4.equals(str3) : str3 == null) {
                        String str5 = zj0Var.d;
                        String str6 = this.d;
                        if (str6 != null ? str6.equals(str5) : str5 == null) {
                            if (this.e == zj0Var.e && this.f == zj0Var.f) {
                                String str7 = zj0Var.g;
                                String str8 = this.g;
                                if (str8 != null ? str8.equals(str7) : str7 == null) {
                                    return true;
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
        String str = this.a;
        int iHashCode = ((((str == null ? 0 : str.hashCode()) ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003;
        String str2 = this.c;
        int iHashCode2 = (iHashCode ^ (str2 == null ? 0 : str2.hashCode())) * 1000003;
        String str3 = this.d;
        int iHashCode3 = (iHashCode2 ^ (str3 == null ? 0 : str3.hashCode())) * 1000003;
        long j = this.e;
        int i = (iHashCode3 ^ ((int) (j ^ (j >>> 32)))) * 1000003;
        long j2 = this.f;
        int i2 = (i ^ ((int) (j2 ^ (j2 >>> 32)))) * 1000003;
        String str4 = this.g;
        return i2 ^ (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("PersistedInstallationEntry{firebaseInstallationId=");
        sb.append(this.a);
        sb.append(", registrationStatus=");
        sb.append(this.b);
        sb.append(", authToken=");
        sb.append(this.c);
        sb.append(ZVsviyDAr.cjMbPJRCTg);
        sb.append(this.d);
        sb.append(", expiresInSecs=");
        sb.append(this.e);
        sb.append(", tokenCreationEpochInSecs=");
        sb.append(this.f);
        sb.append(", fisError=");
        return ka1.v(sb, this.g, "}");
    }
}
