package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a79 extends b79 {
    public final zw7 a;
    public final zw7 b;
    public final String c;
    public final Boolean d;
    public final String e;
    public final boolean f;
    public final gcb g;
    public final Set h;

    public a79(zw7 zw7Var, zw7 zw7Var2, String str, Boolean bool, String str2, boolean z, gcb gcbVar, Set set) {
        this.a = zw7Var;
        this.b = zw7Var2;
        this.c = str;
        this.d = bool;
        this.e = str2;
        this.f = z;
        this.g = gcbVar;
        this.h = set;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a79)) {
            return false;
        }
        a79 a79Var = (a79) obj;
        return this.a == a79Var.a && this.b == a79Var.b && g76.L(this.c, a79Var.c) && g76.L(this.d, a79Var.d) && g76.L(this.e, a79Var.e) && this.f == a79Var.f && this.g.equals(a79Var.g) && g76.L(this.h, a79Var.h);
    }

    public final int hashCode() {
        zw7 zw7Var = this.a;
        int iHashCode = (zw7Var == null ? 0 : zw7Var.hashCode()) * 31;
        zw7 zw7Var2 = this.b;
        int iHashCode2 = (iHashCode + (zw7Var2 == null ? 0 : zw7Var2.hashCode())) * 31;
        String str = this.c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.d;
        int iHashCode4 = (iHashCode3 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str2 = this.e;
        int iHashCode5 = (this.g.hashCode() + ((((iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31) + (this.f ? 1231 : 1237)) * 31)) * 31;
        Set set = this.h;
        return iHashCode5 + (set != null ? set.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Main(membershipType=");
        sb.append(this.a);
        sb.append(", membershipProductType=");
        sb.append(this.b);
        sb.append(", paymentProvider=");
        sb.append(this.c);
        sb.append(", isCancelled=");
        sb.append(this.d);
        sb.append(", expiresDate=");
        ka1.D(sb, this.e, ", canUpgradeDowngradeTier=", this.f, ", config=");
        sb.append(this.g);
        sb.append(", orders=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}
