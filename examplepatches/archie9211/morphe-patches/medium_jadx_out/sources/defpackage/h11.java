package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class h11 {
    public static final jy8 a;
    public static final float b;
    public static final float c;
    public static final float d;

    static {
        float f = f49.t;
        float f2 = f49.u;
        z3c z3cVar = p11.a;
        new jy8(f, 8.0f, f2, 8.0f);
        if (!(f2 >= 0.0f)) {
            z16.a("Padding must be non-negative");
        }
        a = new jy8(12.0f, 8.0f, 12.0f, 8.0f);
        if (!((8.0f >= 0.0f) & (8.0f >= 0.0f))) {
            z16.a("Padding must be non-negative");
        }
        b = 58.0f;
        c = 40.0f;
        d = 18.0f;
    }

    public static g11 a(long j, long j2, long j3, long j4, x12 x12Var, int i) {
        return b((fv1) ((p65) x12Var).j(iv1.a)).a(j, j2, (i & 4) != 0 ? uu1.h : j3, (i & 8) != 0 ? uu1.h : j4);
    }

    public static g11 b(fv1 fv1Var) {
        g11 g11Var = fv1Var.W;
        if (g11Var != null) {
            return g11Var;
        }
        g11 g11Var2 = new g11(iv1.c(fv1Var, uh4.a), iv1.c(fv1Var, uh4.f), uu1.b(uh4.c, iv1.c(fv1Var, uh4.b)), uu1.b(uh4.e, iv1.c(fv1Var, uh4.d)));
        fv1Var.W = g11Var2;
        return g11Var2;
    }

    public static g11 c(fv1 fv1Var) {
        g11 g11Var = fv1Var.Y;
        if (g11Var != null) {
            return g11Var;
        }
        long j = uu1.g;
        g11 g11Var2 = new g11(j, iv1.c(fv1Var, gv1.Primary), j, uu1.b(rgd.b, iv1.c(fv1Var, rgd.a)));
        fv1Var.Y = g11Var2;
        return g11Var2;
    }

    public static g11 d(long j, long j2, long j3, long j4, x12 x12Var, int i) {
        g11 g11Var;
        long j5 = (i & 2) != 0 ? uu1.h : j2;
        long j6 = (i & 4) != 0 ? uu1.h : j3;
        long j7 = (i & 8) != 0 ? uu1.h : j4;
        fv1 fv1Var = (fv1) ((p65) x12Var).j(iv1.a);
        g11 g11Var2 = fv1Var.X;
        if (g11Var2 == null) {
            long j8 = uu1.g;
            g11 g11Var3 = new g11(j8, iv1.c(fv1Var, qw8.c), j8, uu1.b(qw8.b, iv1.c(fv1Var, qw8.a)));
            fv1Var.X = g11Var3;
            g11Var = g11Var3;
        } else {
            g11Var = g11Var2;
        }
        return g11Var.a(j, j5, j6, j7);
    }
}
