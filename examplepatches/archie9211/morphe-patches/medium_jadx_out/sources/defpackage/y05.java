package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y05 {
    public static final y05 c = new y05("");
    public final z05 a;
    public transient y05 b;

    public y05(String str) {
        str.getClass();
        this.a = new z05(this, str);
    }

    public final y05 a(n98 n98Var) {
        n98Var.getClass();
        return new y05(this.a.a(n98Var), this);
    }

    public final y05 b() {
        y05 y05Var = this.b;
        if (y05Var != null) {
            return y05Var;
        }
        z05 z05Var = this.a;
        if (z05Var.c()) {
            ygf.f("root");
            return null;
        }
        y05 y05Var2 = new y05(z05Var.e());
        this.b = y05Var2;
        return y05Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof y05) {
            return g76.L(this.a, ((y05) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.a.hashCode();
    }

    public final String toString() {
        return this.a.toString();
    }

    public y05(z05 z05Var) {
        this.a = z05Var;
    }

    public y05(z05 z05Var, y05 y05Var) {
        this.a = z05Var;
        this.b = y05Var;
    }
}
