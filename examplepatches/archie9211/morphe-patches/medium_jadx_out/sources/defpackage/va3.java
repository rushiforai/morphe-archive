package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class va3 {
    public final String a;
    public final String b;
    public final String c;
    public final ya3 d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final String i;
    public final Integer j;
    public final g67 k;
    public final int l;
    public final Integer m;
    public final Boolean n;

    public va3(String str, String str2, String str3, ya3 ya3Var, String str4, String str5, String str6, String str7, String str8, Integer num, g67 g67Var, int i, Integer num2, Boolean bool) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        ya3Var.getClass();
        str4.getClass();
        ho2.Q(str5, str6, str7, str8);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = ya3Var;
        this.e = str4;
        this.f = str5;
        this.g = str6;
        this.h = str7;
        this.i = str8;
        this.j = num;
        this.k = g67Var;
        this.l = i;
        this.m = num2;
        this.n = bool;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof va3)) {
            return false;
        }
        va3 va3Var = (va3) obj;
        return g76.L(this.a, va3Var.a) && g76.L(this.b, va3Var.b) && g76.L(this.c, va3Var.c) && this.d == va3Var.d && g76.L(this.e, va3Var.e) && g76.L(this.f, va3Var.f) && g76.L(this.g, va3Var.g) && g76.L(this.h, va3Var.h) && g76.L(this.i, va3Var.i) && g76.L(this.j, va3Var.j) && this.k.equals(va3Var.k) && this.l == va3Var.l && g76.L(this.m, va3Var.m) && g76.L(this.n, va3Var.n);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(wgd.o(wgd.o(wgd.o((this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c)) * 31, 31, this.e), 31, this.f), 31, this.g), 31, this.h), 31, this.i);
        Integer num = this.j;
        int iHashCode = (((this.k.hashCode() + ((iO + (num == null ? 0 : num.hashCode())) * 31)) * 31) + this.l) * 31;
        Integer num2 = this.m;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Boolean bool = this.n;
        return iHashCode2 + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("DeviceInfo(deviceName=", this.a, ", deviceBrand=", this.b, ", deviceModel=");
        sbU.append(this.c);
        sbU.append(", deviceType=");
        sbU.append(this.d);
        sbU.append(", deviceBuildId=");
        ka1.C(sbU, this.e, ", osName=", this.f, ", osMajorVersion=");
        ka1.C(sbU, this.g, ", osVersion=", this.h, ", architecture=");
        sbU.append(this.i);
        sbU.append(", numberOfDisplays=");
        sbU.append(this.j);
        sbU.append(", localeInfo=");
        sbU.append(this.k);
        sbU.append(", logicalCpuCount=");
        sbU.append(this.l);
        sbU.append(", totalRam=");
        sbU.append(this.m);
        sbU.append(", isLowRam=");
        sbU.append(this.n);
        sbU.append(")");
        return sbU.toString();
    }
}
