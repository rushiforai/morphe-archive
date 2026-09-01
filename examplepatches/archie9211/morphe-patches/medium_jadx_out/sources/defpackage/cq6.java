package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cq6 implements zl3 {
    public final g61 a = new g61();
    public xl3 b;

    @Override // defpackage.zl3
    public final void E(long j, long j2, long j3, float f, int i) {
        this.a.E(j, j2, j3, f, i);
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.a.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.a.N(i);
    }

    @Override // defpackage.zl3
    public final void O(long j, float f, float f2, long j2, long j3, float f3, pxf pxfVar) {
        this.a.O(j, f, f2, j2, j3, f3, pxfVar);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / this.a.b();
    }

    @Override // defpackage.zl3
    public final void S(br brVar, ez0 ez0Var, float f, pxf pxfVar, int i) {
        this.a.S(brVar, ez0Var, f, pxfVar, i);
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.U();
    }

    @Override // defpackage.zl3
    public final void V(br brVar, long j, float f, pxf pxfVar) {
        this.a.V(brVar, j, f, pxfVar);
    }

    @Override // defpackage.zl3
    public final void Y(long j, long j2, long j3, float f, pxf pxfVar, int i) {
        this.a.Y(j, j2, j3, f, pxfVar, i);
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.a.b() * f;
    }

    public final void a() {
        g61 g61Var = this.a;
        m50 m50Var = g61Var.b;
        e61 e61VarX = g61Var.b.x();
        a43 a43Var = this.b;
        if (a43Var == null) {
            throw lv8.v("Attempting to drawContent for a `null` node. This usually means that a call to ContentDrawScope#drawContent() has been captured inside a lambda, and is being invoked outside of the draw pass. Capturing the scope this way is unsupported - if you are trying to record drawContent with graphicsLayer.record(), make sure you are using the GraphicsLayer#record function within DrawScope, instead of the member function on GraphicsLayer.");
        }
        q28 q28Var = (q28) a43Var;
        q28 q28VarQ0 = q28Var.a.f;
        if (q28VarQ0 == null || (q28VarQ0.d & 4) == 0) {
            q28VarQ0 = null;
        } else {
            while (q28VarQ0 != null) {
                int i = q28VarQ0.c;
                if ((i & 2) != 0) {
                    break;
                } else if ((i & 4) != 0) {
                    break;
                } else {
                    q28VarQ0 = q28VarQ0.f;
                }
            }
            q28VarQ0 = null;
        }
        if (q28VarQ0 == null) {
            eh8 eh8VarT0 = flb.t0(a43Var, 4);
            if (eh8VarT0.O0() == q28Var.a) {
                eh8VarT0 = eh8VarT0.p;
                eh8VarT0.getClass();
            }
            eh8VarT0.d1(e61VarX, (of5) m50Var.c);
            return;
        }
        o78 o78Var = null;
        while (q28VarQ0 != null) {
            if (q28VarQ0 instanceof xl3) {
                xl3 xl3Var = (xl3) q28VarQ0;
                of5 of5Var = (of5) m50Var.c;
                eh8 eh8VarT02 = flb.t0(xl3Var, 4);
                long jC0 = nk7.C0(eh8VarT02.c);
                aq6 aq6Var = eh8VarT02.o;
                aq6Var.getClass();
                ((mn) dq6.a(aq6Var)).getSharedDrawScope().c(e61VarX, jC0, eh8VarT02, xl3Var, of5Var);
            } else if ((q28VarQ0.c & 4) != 0 && (q28VarQ0 instanceof b43)) {
                int i2 = 0;
                for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                    if ((q28Var2.c & 4) != 0) {
                        i2++;
                        if (i2 == 1) {
                            q28VarQ0 = q28Var2;
                        } else {
                            if (o78Var == null) {
                                o78Var = new o78(new q28[16]);
                            }
                            if (q28VarQ0 != null) {
                                o78Var.b(q28VarQ0);
                                q28VarQ0 = null;
                            }
                            o78Var.b(q28Var2);
                        }
                    }
                }
                if (i2 == 1) {
                }
            }
            q28VarQ0 = flb.q0(o78Var);
        }
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b();
    }

    @Override // defpackage.zl3
    public final m50 b0() {
        return this.a.b;
    }

    public final void c(e61 e61Var, long j, eh8 eh8Var, xl3 xl3Var, of5 of5Var) {
        xl3 xl3Var2 = this.b;
        this.b = xl3Var;
        ip6 ip6Var = eh8Var.o.z;
        m50 m50Var = this.a.b;
        m73 m73VarY = m50Var.y();
        ip6 ip6VarA = m50Var.A();
        e61 e61VarX = m50Var.x();
        long jB = m50Var.B();
        of5 of5Var2 = (of5) m50Var.c;
        m50Var.O(eh8Var);
        m50Var.P(ip6Var);
        m50Var.M(e61Var);
        m50Var.Q(j);
        m50Var.c = of5Var;
        e61Var.h();
        try {
            xl3Var.e0(this);
            e61Var.q();
            m50Var.O(m73VarY);
            m50Var.P(ip6VarA);
            m50Var.M(e61VarX);
            m50Var.Q(jB);
            m50Var.c = of5Var2;
            this.b = xl3Var2;
        } catch (Throwable th) {
            e61Var.q();
            m50Var.O(m73VarY);
            m50Var.P(ip6VarA);
            m50Var.M(e61VarX);
            m50Var.Q(jB);
            m50Var.c = of5Var2;
            throw th;
        }
    }

    public final void d(ez0 ez0Var, long j, long j2, float f, pxf pxfVar, int i) {
        g61 g61Var = this.a;
        int i2 = (int) (j >> 32);
        int i3 = (int) (j & 4294967295L);
        g61Var.a.c.l(Float.intBitsToFloat(i2), Float.intBitsToFloat(i3), Float.intBitsToFloat((int) (j2 >> 32)) + Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j2 & 4294967295L)) + Float.intBitsToFloat(i3), g61Var.c(ez0Var, pxfVar, f, null, i, 1));
    }

    public final void e(long j, x45 x45Var, of5 of5Var) {
        of5Var.f(this, getLayoutDirection(), j, new vt(this, this.b, x45Var, 6));
    }

    @Override // defpackage.zl3
    public final long f() {
        return this.a.b.B();
    }

    @Override // defpackage.zl3
    public final void f0(oz6 oz6Var, float f, long j, pxf pxfVar) {
        this.a.f0(oz6Var, f, j, pxfVar);
    }

    @Override // defpackage.zl3
    public final void g0(wp wpVar, long j, long j2, long j3, float f, bs0 bs0Var, int i) {
        this.a.g0(wpVar, j, j2, j3, f, bs0Var, i);
    }

    @Override // defpackage.zl3
    public final ip6 getLayoutDirection() {
        return this.a.a.b;
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        return ho2.d(this.a, f);
    }

    @Override // defpackage.zl3
    public final long k0() {
        return this.a.k0();
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        return ho2.g(j, this.a);
    }

    @Override // defpackage.zl3
    public final void o(ez0 ez0Var, long j, long j2, long j3, float f, pxf pxfVar) {
        this.a.o(ez0Var, j, j2, j3, f, pxfVar);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        return ho2.f(j, this.a);
    }

    @Override // defpackage.zl3
    public final void q(long j, long j2, long j3, long j4, pxf pxfVar) {
        this.a.q(j, j2, j3, j4, pxfVar);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        return ho2.e(j, this.a);
    }

    @Override // defpackage.zl3
    public final void t0(oz6 oz6Var, float f, long j, pxf pxfVar) {
        this.a.t0(oz6Var, f, j, pxfVar);
    }

    @Override // defpackage.zl3
    public final void u(long j, float f, long j2, pxf pxfVar) {
        this.a.u(j, f, j2, pxfVar);
    }

    @Override // defpackage.m73
    public final float z(long j) {
        return km4.i(j, this.a);
    }
}
