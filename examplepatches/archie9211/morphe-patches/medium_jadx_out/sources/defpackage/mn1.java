package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mn1 {
    public final y05 a;
    public final y05 b;
    public final boolean c;

    public mn1(y05 y05Var, y05 y05Var2, boolean z) {
        y05Var.getClass();
        y05Var2.getClass();
        this.a = y05Var;
        this.b = y05Var2;
        this.c = z;
        y05Var2.a.c();
    }

    public static final String c(y05 y05Var) {
        String str = y05Var.a.a;
        return muc.R(str, '/') ? wgd.t('`', "`", str) : str;
    }

    public final y05 a() {
        y05 y05Var = this.a;
        boolean zC = y05Var.a.c();
        y05 y05Var2 = this.b;
        if (zC) {
            return y05Var2;
        }
        return new y05(y05Var.a.a + '.' + y05Var2.a.a);
    }

    public final String b() {
        y05 y05Var = this.a;
        boolean zC = y05Var.a.c();
        y05 y05Var2 = this.b;
        if (zC) {
            return c(y05Var2);
        }
        return tuc.K(y05Var.a.a, '.', '/') + "/" + c(y05Var2);
    }

    public final mn1 d(n98 n98Var) {
        n98Var.getClass();
        return new mn1(this.a, this.b.a(n98Var), this.c);
    }

    public final mn1 e() {
        y05 y05VarB = this.b.b();
        if (y05VarB.a.c()) {
            return null;
        }
        return new mn1(this.a, y05VarB, this.c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mn1)) {
            return false;
        }
        mn1 mn1Var = (mn1) obj;
        return g76.L(this.a, mn1Var.a) && g76.L(this.b, mn1Var.b) && this.c == mn1Var.c;
    }

    public final n98 f() {
        return this.b.a.g();
    }

    public final boolean g() {
        return !this.b.b().a.c();
    }

    public final int hashCode() {
        return ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        boolean zC = this.a.a.c();
        String strB = b();
        return zC ? "/".concat(strB) : strB;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public mn1(y05 y05Var, n98 n98Var) {
        this(y05Var, sgg.b0(n98Var), false);
        y05Var.getClass();
        n98Var.getClass();
        y05 y05Var2 = y05.c;
    }
}
