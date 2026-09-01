package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pk6 {
    public static final pk6 g;
    public final x45 a;
    public final x45 b;
    public final x45 c;
    public final x45 d;
    public final x45 e;
    public final x45 f;

    static {
        x45 x45Var = null;
        g = new pk6(x45Var, x45Var, x45Var, 63);
    }

    public /* synthetic */ pk6(x45 x45Var, x45 x45Var2, x45 x45Var3, int i) {
        this((i & 1) != 0 ? null : x45Var, null, (i & 4) != 0 ? null : x45Var2, null, (i & 16) != 0 ? null : x45Var3, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pk6)) {
            return false;
        }
        pk6 pk6Var = (pk6) obj;
        return this.a == pk6Var.a && this.b == pk6Var.b && this.c == pk6Var.c && this.d == pk6Var.d && this.e == pk6Var.e && this.f == pk6Var.f;
    }

    public final int hashCode() {
        x45 x45Var = this.a;
        int iHashCode = (x45Var != null ? x45Var.hashCode() : 0) * 31;
        x45 x45Var2 = this.b;
        int iHashCode2 = (iHashCode + (x45Var2 != null ? x45Var2.hashCode() : 0)) * 31;
        x45 x45Var3 = this.c;
        int iHashCode3 = (iHashCode2 + (x45Var3 != null ? x45Var3.hashCode() : 0)) * 31;
        x45 x45Var4 = this.d;
        int iHashCode4 = (iHashCode3 + (x45Var4 != null ? x45Var4.hashCode() : 0)) * 31;
        x45 x45Var5 = this.e;
        int iHashCode5 = (iHashCode4 + (x45Var5 != null ? x45Var5.hashCode() : 0)) * 31;
        x45 x45Var6 = this.f;
        return iHashCode5 + (x45Var6 != null ? x45Var6.hashCode() : 0);
    }

    public pk6(x45 x45Var, x45 x45Var2, x45 x45Var3, x45 x45Var4, x45 x45Var5, x45 x45Var6) {
        this.a = x45Var;
        this.b = x45Var2;
        this.c = x45Var3;
        this.d = x45Var4;
        this.e = x45Var5;
        this.f = x45Var6;
    }
}
