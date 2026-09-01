package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q32 {
    public static final o32 i;
    public final o32 a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final boolean f;
    public final Map g;
    public final String h;

    static {
        fm0 fm0Var = new fm0(em0.IGNORE_NEWEST);
        i = new o32(false, fy3.a, aq0.MEDIUM, v5e.AVERAGE, wz7.c, kv2.US1, zp0.MEDIUM, fm0Var);
    }

    public q32(o32 o32Var, String str, String str2, String str3, String str4, boolean z, Map map, String str5) {
        o32Var.getClass();
        this.a = o32Var;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = z;
        this.g = map;
        this.h = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q32)) {
            return false;
        }
        q32 q32Var = (q32) obj;
        return g76.L(this.a, q32Var.a) && this.b.equals(q32Var.b) && this.c.equals(q32Var.c) && this.d.equals(q32Var.d) && g76.L(this.e, q32Var.e) && this.f == q32Var.f && this.g.equals(q32Var.g) && g76.L(this.h, q32Var.h);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d);
        String str = this.e;
        int iHashCode = (this.g.hashCode() + ((((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.f ? 1231 : 1237)) * 31)) * 31;
        String str2 = this.h;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Configuration(coreConfig=");
        sb.append(this.a);
        sb.append(", clientToken=");
        sb.append(this.b);
        sb.append(", env=");
        ka1.C(sb, this.c, ", variant=", this.d, ", service=");
        ka1.D(sb, this.e, ", crashReportsEnabled=", this.f, ", additionalConfig=");
        sb.append(this.g);
        sb.append(", version=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}
