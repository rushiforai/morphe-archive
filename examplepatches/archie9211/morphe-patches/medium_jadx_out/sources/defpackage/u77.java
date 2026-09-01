package defpackage;

import java.util.Map;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u77 {
    public static final String[] p = {"device", "os", "status", "service", "message", "date", "logger", "_dd", "usr", "account", "network", "error", "build_id", "build_version", "ddtags"};
    public final i77 a;
    public final l77 b;
    public final o77 c;
    public final String d;
    public final String e;
    public final String f;
    public final j77 g;
    public final f77 h;
    public final s77 i;
    public final k77 j;
    public final h77 k;
    public final String l;
    public final String m;
    public final String n;
    public final Map o;

    public u77(i77 i77Var, l77 l77Var, o77 o77Var, String str, String str2, String str3, j77 j77Var, f77 f77Var, s77 s77Var, rx0 rx0Var, k77 k77Var, h77 h77Var, String str4, String str5, String str6, Map map) {
        o77Var.getClass();
        str.getClass();
        str2.getClass();
        this.a = i77Var;
        this.b = l77Var;
        this.c = o77Var;
        this.d = str;
        this.e = str2;
        this.f = str3;
        this.g = j77Var;
        this.h = f77Var;
        this.i = s77Var;
        this.j = k77Var;
        this.k = h77Var;
        this.l = str4;
        this.m = str5;
        this.n = str6;
        this.o = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u77)) {
            return false;
        }
        u77 u77Var = (u77) obj;
        return this.a.equals(u77Var.a) && this.b.equals(u77Var.b) && this.c == u77Var.c && g76.L(this.d, u77Var.d) && g76.L(this.e, u77Var.e) && this.f.equals(u77Var.f) && this.g.equals(u77Var.g) && this.h.equals(u77Var.h) && g76.L(this.i, u77Var.i) && g76.L(null, null) && g76.L(this.j, u77Var.j) && g76.L(this.k, u77Var.k) && g76.L(this.l, u77Var.l) && g76.L(this.m, u77Var.m) && this.n.equals(u77Var.n) && this.o.equals(u77Var.o);
    }

    public final int hashCode() {
        int iHashCode = (this.h.hashCode() + ((this.g.hashCode() + wgd.o(wgd.o(wgd.o((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31, 31, this.d), 31, this.e), 31, this.f)) * 31)) * 31;
        s77 s77Var = this.i;
        int iHashCode2 = (iHashCode + (s77Var == null ? 0 : s77Var.hashCode())) * 961;
        k77 k77Var = this.j;
        int iHashCode3 = (iHashCode2 + (k77Var == null ? 0 : k77Var.a.hashCode())) * 31;
        h77 h77Var = this.k;
        int iHashCode4 = (iHashCode3 + (h77Var == null ? 0 : h77Var.hashCode())) * 31;
        String str = this.l;
        int iHashCode5 = (iHashCode4 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.m;
        return this.o.hashCode() + wgd.o((iHashCode5 + (str2 != null ? str2.hashCode() : 0)) * 31, 31, this.n);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LogEvent(device=");
        sb.append(this.a);
        sb.append(", os=");
        sb.append(this.b);
        sb.append(", status=");
        sb.append(this.c);
        sb.append(", service=");
        sb.append(this.d);
        sb.append(", message=");
        ka1.C(sb, this.e, ", date=", this.f, ", logger=");
        sb.append(this.g);
        sb.append(", dd=");
        sb.append(this.h);
        sb.append(", usr=");
        sb.append(this.i);
        sb.append(", account=");
        sb.append((Object) null);
        sb.append(", network=");
        sb.append(this.j);
        sb.append(", error=");
        sb.append(this.k);
        sb.append(eoLmc.LIcnPrnfS);
        ka1.C(sb, this.l, ", buildVersion=", this.m, ", ddtags=");
        sb.append(this.n);
        sb.append(", additionalProperties=");
        sb.append(this.o);
        sb.append(")");
        return sb.toString();
    }
}
