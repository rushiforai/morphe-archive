package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vi5 {
    public static final h21 d;
    public static final h21 e;
    public static final h21 f;
    public static final h21 g;
    public static final h21 h;
    public static final h21 i;
    public final h21 a;
    public final h21 b;
    public final int c;

    static {
        h21 h21Var = h21.d;
        d = dq1.o(":");
        e = dq1.o(":status");
        f = dq1.o(":method");
        g = dq1.o(":path");
        h = dq1.o(":scheme");
        i = dq1.o(":authority");
    }

    public vi5(h21 h21Var, h21 h21Var2) {
        h21Var.getClass();
        h21Var2.getClass();
        this.a = h21Var;
        this.b = h21Var2;
        this.c = h21Var2.e() + h21Var.e() + 32;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vi5)) {
            return false;
        }
        vi5 vi5Var = (vi5) obj;
        return g76.L(this.a, vi5Var.a) && g76.L(this.b, vi5Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return this.a.t() + ": " + this.b.t();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public vi5(String str, String str2) {
        this(dq1.o(str), dq1.o(str2));
        h21 h21Var = h21.d;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public vi5(String str, h21 h21Var) {
        this(h21Var, dq1.o(str));
        h21Var.getClass();
        str.getClass();
        h21 h21Var2 = h21.d;
    }
}
