package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u82 extends q28 implements xl3, sp6, xxb {
    public xd o;
    public w82 p;
    public float q;
    public bs0 r;
    public boolean s;
    public String t;
    public j72 u;
    public final g90 v;

    public u82(g90 g90Var, xd xdVar, w82 w82Var, float f, bs0 bs0Var, boolean z, String str, j72 j72Var) {
        this.o = xdVar;
        this.p = w82Var;
        this.q = f;
        this.r = bs0Var;
        this.s = z;
        this.t = str;
        this.u = j72Var;
        this.v = g90Var;
    }

    @Override // defpackage.q28
    public final void A0() {
        this.v.c();
    }

    @Override // defpackage.q28
    public final void C0() {
        this.v.k(null);
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final long I0(long j) {
        if (dfc.e(j)) {
            return 0L;
        }
        long jH = this.v.h();
        if (jH != 9205357640488583168L) {
            float fIntBitsToFloat = Float.intBitsToFloat((int) (jH >> 32));
            if (Math.abs(fIntBitsToFloat) > Float.MAX_VALUE) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
            }
            float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jH & 4294967295L));
            if (Math.abs(fIntBitsToFloat2) > Float.MAX_VALUE) {
                fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
            }
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
            long jG = this.p.g(jFloatToRawIntBits, j);
            if (Math.abs(Float.intBitsToFloat((int) (jG >> 32))) <= Float.MAX_VALUE && Math.abs(Float.intBitsToFloat((int) (4294967295L & jG))) <= Float.MAX_VALUE) {
                return hp7.H(jFloatToRawIntBits, jG);
            }
        }
        return j;
    }

    public final long J0(long j) {
        float fJ;
        int i;
        float fU;
        boolean zF = f72.f(j);
        boolean zE = f72.e(j);
        if (!zF || !zE) {
            boolean z = f72.d(j) && f72.c(j);
            g90 g90Var = this.v;
            long jH = g90Var.h();
            if (jH != 9205357640488583168L) {
                if (z && (zF || zE)) {
                    fJ = f72.h(j);
                    i = f72.g(j);
                } else {
                    float fIntBitsToFloat = Float.intBitsToFloat((int) (jH >> 32));
                    float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jH & 4294967295L));
                    if (Math.abs(fIntBitsToFloat) <= Float.MAX_VALUE) {
                        int i2 = ppe.b;
                        fJ = iq7.u(fIntBitsToFloat, f72.j(j), f72.h(j));
                    } else {
                        fJ = f72.j(j);
                    }
                    if (Math.abs(fIntBitsToFloat2) <= Float.MAX_VALUE) {
                        int i3 = ppe.b;
                        fU = iq7.u(fIntBitsToFloat2, f72.i(j), f72.g(j));
                        long jI0 = I0((((long) Float.floatToRawIntBits(fU)) & 4294967295L) | (((long) Float.floatToRawIntBits(fJ)) << 32));
                        return f72.a(j, h72.g(nk7.w0(Float.intBitsToFloat((int) (jI0 >> 32))), j), 0, h72.f(nk7.w0(Float.intBitsToFloat((int) (jI0 & 4294967295L))), j), 0, 10);
                    }
                    i = f72.i(j);
                }
                fU = i;
                long jI02 = I0((((long) Float.floatToRawIntBits(fU)) & 4294967295L) | (((long) Float.floatToRawIntBits(fJ)) << 32));
                return f72.a(j, h72.g(nk7.w0(Float.intBitsToFloat((int) (jI02 >> 32))), j), 0, h72.f(nk7.w0(Float.intBitsToFloat((int) (jI02 & 4294967295L))), j), 0, 10);
            }
            if (z && ((f90) g90Var.u.a.getValue()).a() != null) {
                return f72.a(j, f72.h(j), 0, f72.g(j), 0, 10);
            }
        }
        return j;
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        long jB = h72.b(0, 0, 0, i, 7);
        j72 j72Var = this.u;
        if (j72Var != null) {
            j72Var.l(jB);
        }
        if (this.v.h() == 9205357640488583168L) {
            return tk7Var.n(i);
        }
        long jJ0 = J0(jB);
        return Math.max(f72.j(jJ0), tk7Var.n(i));
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        j72 j72Var = this.u;
        if (j72Var != null) {
            j72Var.l(j);
        }
        t99 t99VarS = tk7Var.s(J0(j));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 0));
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        long jB = h72.b(0, i, 0, 0, 13);
        j72 j72Var = this.u;
        if (j72Var != null) {
            j72Var.l(jB);
        }
        if (this.v.h() == 9205357640488583168L) {
            return tk7Var.a(i);
        }
        long jJ0 = J0(jB);
        return Math.max(f72.i(jJ0), tk7Var.a(i));
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        long jB = h72.b(0, i, 0, 0, 13);
        j72 j72Var = this.u;
        if (j72Var != null) {
            j72Var.l(jB);
        }
        if (this.v.h() == 9205357640488583168L) {
            return tk7Var.L(i);
        }
        long jJ0 = J0(jB);
        return Math.max(f72.i(jJ0), tk7Var.L(i));
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        g61 g61Var = cq6Var.a;
        long jI0 = I0(g61Var.b.B());
        long jA = this.o.a(ppe.d(jI0), ppe.d(g61Var.b.B()), cq6Var.getLayoutDirection());
        int i = (int) (jA >> 32);
        int i2 = (int) (jA & 4294967295L);
        m50 m50Var = g61Var.b;
        long jB = m50Var.B();
        m50Var.x().h();
        try {
            md5 md5Var = (md5) m50Var.b;
            if (this.s) {
                ho2.i(md5Var, 0.0f, 0.0f, 31);
            }
            md5Var.C(i, i2);
            this.v.g(cq6Var, jI0, this.q, this.r);
            m50Var.x().q();
            m50Var.Q(jB);
            cq6Var.a();
        } catch (Throwable th) {
            y30.x(m50Var, jB);
            throw th;
        }
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        long jB = h72.b(0, 0, 0, i, 7);
        j72 j72Var = this.u;
        if (j72Var != null) {
            j72Var.l(jB);
        }
        if (this.v.h() == 9205357640488583168L) {
            return tk7Var.k(i);
        }
        long jJ0 = J0(jB);
        return Math.max(f72.j(jJ0), tk7Var.k(i));
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        String str = this.t;
        if (str != null) {
            gyb.b(jybVar, str);
            gyb.g(jybVar, 5);
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.q28
    public final void y0() {
        sb2 sb2VarU0 = u0();
        g90 g90Var = this.v;
        g90Var.l = sb2VarU0;
        g90Var.d();
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
