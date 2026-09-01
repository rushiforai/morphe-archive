package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yi7 extends q28 implements sp6, xl3, cr4 {
    public final j83 A;
    public int q;
    public float r;
    public enc v;
    public of5 w;
    public final k49 x;
    public int o = 3;
    public int p = 1200;
    public final h49 s = new h49(0);
    public final h49 t = new h49(0);
    public final k49 u = qo7.u(Boolean.FALSE);
    public final k49 y = qo7.u(new ti7());
    public final ou z = yi2.h(0.0f);

    public yi7(int i, rd6 rd6Var, float f) {
        this.q = i;
        this.r = f;
        this.x = qo7.u(rd6Var);
        this.A = bjc.b(new ps5(rd6Var, 10, this));
    }

    @Override // defpackage.q28
    public final void A0() {
        enc encVar = this.v;
        if (encVar != null) {
            encVar.m(null);
        }
        this.v = null;
        of5 of5Var = this.w;
        if (of5Var != null) {
            ((mn) flb.w0(this)).getGraphicsContext().a(of5Var);
            this.w = null;
        }
    }

    @Override // defpackage.cr4
    public final void F(zr4 zr4Var) {
        this.u.setValue(Boolean.valueOf(zr4Var.getHasFocus()));
    }

    public final int I0() {
        return ((Number) this.A.getValue()).intValue();
    }

    public final void J0() {
        enc encVar = this.v;
        n92 n92Var = null;
        if (encVar != null) {
            encVar.m(null);
        }
        if (this.n) {
            this.v = vx0.c0(u0(), null, null, new kd7(encVar, this, n92Var, 2), 3);
        }
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return tk7Var.n(i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(f72.a(j, 0, Integer.MAX_VALUE, 0, 0, 13));
        int iG = h72.g(t99VarS.a, j);
        h49 h49Var = this.t;
        h49Var.h(iG);
        this.s.h(t99VarS.a);
        return bl7Var.q0(h49Var.g(), t99VarS.b, fy3.a, new y0(t99VarS, 9));
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return tk7Var.a(Integer.MAX_VALUE);
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return tk7Var.L(Integer.MAX_VALUE);
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        float fG;
        float fFloatValue;
        int iG;
        boolean z;
        long j;
        g61 g61Var = cq6Var.a;
        int iA = vj3.a(this.r, 0.0f);
        h49 h49Var = this.t;
        ou ouVar = this.z;
        h49 h49Var2 = this.s;
        if (iA > 0) {
            int i = wi7.a[cq6Var.getLayoutDirection().ordinal()];
            if (i == 1) {
                fG = ((Number) ouVar.d()).floatValue();
            } else if (i != 2) {
                ygf.a();
                return;
            } else {
                fFloatValue = (-((Number) ouVar.d()).floatValue()) + (h49Var2.g() * 2) + I0();
                iG = h49Var.g();
                fG = fFloatValue - iG;
            }
        } else {
            int i2 = wi7.a[cq6Var.getLayoutDirection().ordinal()];
            if (i2 == 1) {
                fG = (-((Number) ouVar.d()).floatValue()) + h49Var2.g() + I0();
            } else if (i2 != 2) {
                ygf.a();
                return;
            } else {
                fFloatValue = ((Number) ouVar.d()).floatValue() + h49Var2.g();
                iG = h49Var.g();
                fG = fFloatValue - iG;
            }
        }
        boolean z2 = fG < ((float) h49Var2.g());
        boolean z3 = ((float) h49Var.g()) + fG > ((float) (I0() + h49Var2.g()));
        float fI0 = I0() + h49Var2.g();
        float fIntBitsToFloat = Float.intBitsToFloat((int) (g61Var.b.B() & 4294967295L));
        of5 of5Var = this.w;
        if (of5Var != null) {
            j = 4294967295L;
            z = z2;
            cq6Var.e((((long) nk7.w0(fIntBitsToFloat)) & 4294967295L) | (((long) h49Var2.g()) << 32), new vi7(cq6Var, 0), of5Var);
        } else {
            z = z2;
            j = 4294967295L;
        }
        float fG2 = h49Var.g();
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (cq6Var.f() & j));
        m50 m50Var = g61Var.b;
        long jB = m50Var.B();
        m50Var.x().h();
        try {
            ((m50) ((md5) m50Var.b).b).x().o(0.0f, 0.0f, fG2, fIntBitsToFloat2, 1);
            float f = -fG;
            ((md5) g61Var.b.b).C(f, 0.0f);
            try {
                of5 of5Var2 = this.w;
                if (of5Var2 != null) {
                    if (z) {
                        g76.V(cq6Var, of5Var2);
                    }
                    if (z3) {
                        ((md5) g61Var.b.b).C(fI0, 0.0f);
                        try {
                            g76.V(cq6Var, of5Var2);
                            ((md5) g61Var.b.b).C(-fI0, -0.0f);
                        } finally {
                        }
                    }
                } else {
                    if (z) {
                        cq6Var.a();
                    }
                    if (z3) {
                        ((md5) g61Var.b.b).C(fI0, 0.0f);
                        try {
                            cq6Var.a();
                            ((md5) g61Var.b.b).C(-fI0, -0.0f);
                        } finally {
                        }
                    }
                }
                ((md5) g61Var.b.b).C(-f, -0.0f);
            } catch (Throwable th) {
                ((md5) g61Var.b.b).C(-f, -0.0f);
                throw th;
            }
        } finally {
            y30.x(m50Var, jB);
        }
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return 0;
    }

    @Override // defpackage.q28
    public final void y0() {
        of5 of5Var = this.w;
        lf5 graphicsContext = ((mn) flb.w0(this)).getGraphicsContext();
        if (of5Var != null) {
            graphicsContext.a(of5Var);
        }
        this.w = graphicsContext.b();
        J0();
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
