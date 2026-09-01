package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vu2 {
    public final kv2 a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final int f;
    public final String g;
    public final String h;
    public final String i;
    public final amd j;
    public final y1a k;
    public final fe8 l;
    public final va3 m;
    public final zae n;
    public final tqd o;
    public final String p;
    public final Map q;

    public vu2(kv2 kv2Var, String str, String str2, String str3, String str4, int i, String str5, String str6, String str7, amd amdVar, y1a y1aVar, fe8 fe8Var, va3 va3Var, zae zaeVar, tqd tqdVar, String str8, Map map) {
        kv2Var.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        str4.getClass();
        str5.getClass();
        str6.getClass();
        str7.getClass();
        fe8Var.getClass();
        zaeVar.getClass();
        tqdVar.getClass();
        this.a = kv2Var;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = i;
        this.g = str5;
        this.h = str6;
        this.i = str7;
        this.j = amdVar;
        this.k = y1aVar;
        this.l = fe8Var;
        this.m = va3Var;
        this.n = zaeVar;
        this.o = tqdVar;
        this.p = str8;
        this.q = map;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vu2)) {
            return false;
        }
        vu2 vu2Var = (vu2) obj;
        return this.a == vu2Var.a && g76.L(this.b, vu2Var.b) && g76.L(this.c, vu2Var.c) && g76.L(this.d, vu2Var.d) && g76.L(this.e, vu2Var.e) && this.f == vu2Var.f && g76.L(this.g, vu2Var.g) && g76.L(this.h, vu2Var.h) && g76.L(this.i, vu2Var.i) && this.j.equals(vu2Var.j) && this.k.equals(vu2Var.k) && g76.L(this.l, vu2Var.l) && this.m.equals(vu2Var.m) && g76.L(this.n, vu2Var.n) && this.o == vu2Var.o && g76.L(this.p, vu2Var.p) && this.q.equals(vu2Var.q);
    }

    public final int hashCode() {
        int iHashCode = (this.o.hashCode() + ((this.n.a.hashCode() + ((this.m.hashCode() + ((this.l.hashCode() + ((this.k.hashCode() + ((this.j.hashCode() + wgd.o(wgd.o(wgd.o((wgd.o(wgd.o(wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e) + this.f) * 31, 31, this.g), 31, this.h), 31, this.i)) * 31)) * 31)) * 31)) * 31)) * 961)) * 31;
        String str = this.p;
        return this.q.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DatadogContext(site=");
        sb.append(this.a);
        sb.append(", clientToken=");
        sb.append(this.b);
        sb.append(", service=");
        ka1.C(sb, this.c, ", env=", this.d, ", version=");
        sb.append(this.e);
        sb.append(", versionCode=");
        sb.append(this.f);
        sb.append(", variant=");
        ka1.C(sb, this.g, ", source=", this.h, ", sdkVersion=");
        sb.append(this.i);
        sb.append(", time=");
        sb.append(this.j);
        sb.append(", processInfo=");
        sb.append(this.k);
        sb.append(", networkInfo=");
        sb.append(this.l);
        sb.append(", deviceInfo=");
        sb.append(this.m);
        sb.append(", userInfo=");
        sb.append(this.n);
        sb.append(", accountInfo=null, trackingConsent=");
        sb.append(this.o);
        sb.append(", appBuildId=");
        sb.append(this.p);
        sb.append(", featuresContext=");
        sb.append(this.q);
        sb.append(")");
        return sb.toString();
    }
}
