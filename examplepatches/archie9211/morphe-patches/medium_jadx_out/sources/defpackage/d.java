package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class d {
    public static final h21 a;
    public static final h21 b;
    public static final h21 c;
    public static final h21 d;
    public static final h21 e;

    static {
        h21 h21Var = h21.d;
        a = dq1.o("/");
        b = dq1.o("\\");
        c = dq1.o("/\\");
        d = dq1.o(".");
        e = dq1.o("..");
    }

    public static final g59 a(g59 g59Var, g59 g59Var2, boolean z) {
        g59Var2.getClass();
        if (c(g59Var2) != -1 || g59Var2.f() != null) {
            return g59Var2;
        }
        h21 h21VarB = b(g59Var);
        if (h21VarB == null && (h21VarB = b(g59Var2)) == null) {
            h21VarB = f(g59.b);
        }
        kz0 kz0Var = new kz0();
        kz0Var.J0(g59Var.a);
        if (kz0Var.b > 0) {
            kz0Var.J0(h21VarB);
        }
        kz0Var.J0(g59Var2.a);
        return d(kz0Var, z);
    }

    public static final h21 b(g59 g59Var) {
        h21 h21Var = g59Var.a;
        h21 h21Var2 = a;
        if (h21.h(h21Var, h21Var2) != -1) {
            return h21Var2;
        }
        h21 h21Var3 = g59Var.a;
        h21 h21Var4 = b;
        if (h21.h(h21Var3, h21Var4) != -1) {
            return h21Var4;
        }
        return null;
    }

    public static final int c(g59 g59Var) {
        h21 h21Var = g59Var.a;
        if (h21Var.e() != 0) {
            if (h21Var.j(0) != 47) {
                if (h21Var.j(0) == 92) {
                    if (h21Var.e() > 2 && h21Var.j(1) == 92) {
                        h21 h21Var2 = b;
                        h21Var2.getClass();
                        int iG = h21Var.g(2, h21Var2.i());
                        return iG == -1 ? h21Var.e() : iG;
                    }
                } else if (h21Var.e() > 2 && h21Var.j(1) == 58 && h21Var.j(2) == 92) {
                    char cJ = (char) h21Var.j(0);
                    if ('a' <= cJ && cJ < '{') {
                        return 3;
                    }
                    if ('A' <= cJ && cJ < '[') {
                        return 3;
                    }
                }
            }
            return 1;
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0110 A[EDGE_INSN: B:98:0x0110->B:81:0x0110 BREAK  A[LOOP:1: B:53:0x00ab->B:112:0x00ab], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.g59 d(defpackage.kz0 r17, boolean r18) throws java.io.EOFException {
        /*
            Method dump skipped, instruction units count: 331
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d.d(kz0, boolean):g59");
    }

    public static final h21 e(byte b2) {
        if (b2 == 47) {
            return a;
        }
        if (b2 == 92) {
            return b;
        }
        ay0.e(b09.w(b2, "not a directory separator: "));
        return null;
    }

    public static final h21 f(String str) {
        if (g76.L(str, "/")) {
            return a;
        }
        if (g76.L(str, "\\")) {
            return b;
        }
        ay0.e(ka1.r("not a directory separator: ", str));
        return null;
    }
}
