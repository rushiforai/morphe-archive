package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class dy0 {
    public static final f78 a = b(true);
    public static final f78 b = b(false);
    public static final id c = id.f;

    public static final void a(r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-211209833);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            r28 r28VarR = gx1.R(p65Var, r28Var);
            i89 i89VarL = p65Var.l();
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, c);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i, 3);
        }
    }

    public static final f78 b(boolean z) {
        f78 f78Var = new f78(9);
        ar0 ar0Var = z46.d;
        f78Var.m(ar0Var, new gy0(ar0Var, z));
        ar0 ar0Var2 = z46.e;
        f78Var.m(ar0Var2, new gy0(ar0Var2, z));
        ar0 ar0Var3 = z46.f;
        f78Var.m(ar0Var3, new gy0(ar0Var3, z));
        ar0 ar0Var4 = z46.g;
        f78Var.m(ar0Var4, new gy0(ar0Var4, z));
        ar0 ar0Var5 = z46.h;
        f78Var.m(ar0Var5, new gy0(ar0Var5, z));
        ar0 ar0Var6 = z46.i;
        f78Var.m(ar0Var6, new gy0(ar0Var6, z));
        ar0 ar0Var7 = z46.j;
        f78Var.m(ar0Var7, new gy0(ar0Var7, z));
        ar0 ar0Var8 = z46.k;
        f78Var.m(ar0Var8, new gy0(ar0Var8, z));
        ar0 ar0Var9 = z46.l;
        f78Var.m(ar0Var9, new gy0(ar0Var9, z));
        return f78Var;
    }

    public static final zk7 c(xd xdVar, boolean z) {
        zk7 zk7Var = (zk7) (z ? a : b).g(xdVar);
        return zk7Var == null ? new gy0(xdVar, z) : zk7Var;
    }

    public static final void d(s99 s99Var, t99 t99Var, tk7 tk7Var, ip6 ip6Var, int i, int i2, xd xdVar) {
        ar0 ar0Var;
        Object objW = tk7Var.w();
        cy0 cy0Var = objW instanceof cy0 ? (cy0) objW : null;
        s99.i(s99Var, t99Var, ((cy0Var == null || (ar0Var = cy0Var.o) == null) ? xdVar : ar0Var).a((((long) t99Var.a) << 32) | (((long) t99Var.b) & 4294967295L), (((long) i) << 32) | (((long) i2) & 4294967295L), ip6Var));
    }
}
