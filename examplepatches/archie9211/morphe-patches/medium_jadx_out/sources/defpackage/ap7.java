package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ap7 {
    public static final zo7 a;
    public static final zo7 b;

    static {
        long j = xo7.a;
        long j2 = xo7.c;
        long j3 = xo7.b;
        long j4 = xo7.i;
        long j5 = xo7.r;
        long j6 = xo7.s;
        long j7 = xo7.t;
        long j8 = xo7.o;
        long j9 = xo7.n;
        long j10 = xo7.m;
        long j11 = xo7.x;
        a = new zo7(j, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, xo7.y, xo7.F, j4, xo7.g, j, j, j5, j6, j7, j11, j2, j4, xo7.d, j5, j6, j7, j11);
        long j12 = xo7.l;
        long j13 = xo7.k;
        long j14 = xo7.e;
        long j15 = uu1.h;
        long j16 = xo7.u;
        long j17 = xo7.v;
        long j18 = xo7.w;
        b = new zo7(j12, j4, j13, j14, j5, j15, j15, j7, j16, j17, j18, xo7.E, xo7.J, j14, xo7.f, j12, j, xo7.q, j15, j15, j18, xo7.j, j14, xo7.h, j5, j15, j15, j18);
    }

    public static final void a(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1091213480);
        int i2 = i | 6;
        boolean z = false;
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            float f = 1.0f;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            p65Var.Y(1891162426);
            for (f09 f09Var : ((zo7) p65Var.j(kt7.b)).a()) {
                String str = (String) f09Var.a;
                long j2 = ((uu1) f09Var.b).a;
                p65 p65Var2 = p65Var;
                kjd.b(str, w2g.E(flb.a0(jfc.d(o28Var, f), j2, rv8.r), 0.0f, 2.0f, i3), op8.f0(j2) > 0.5f ? uu1.b : uu1.d, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, dl7.m((mkd) p65Var.j(kjd.a)), p65Var2, 0, 0, 65016);
                z = z;
                p65Var = p65Var2;
                f = f;
                o28Var = o28Var;
                i3 = 1;
            }
            p65Var.p(z);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 19);
        }
    }

    public static final long b(long j, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-639970922);
        float f = (i & 1) != 0 ? 0.0f : 6.0f;
        if (!yi2.N(p65Var)) {
            p65Var.p(false);
            return j;
        }
        long jM = op8.M(uu1.b(((((vj3) p65Var.j(nw3.b)).a + f) - 1.0f) / 100.0f, ((zo7) p65Var.j(kt7.b)).d), j);
        p65Var.p(false);
        return jM;
    }
}
