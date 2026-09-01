package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ib7 implements hp6 {
    public final hb7 a;

    public ib7(hb7 hb7Var) {
        this.a = hb7Var;
    }

    @Override // defpackage.hp6
    public final long D(hp6 hp6Var, long j) {
        return G(hp6Var, j);
    }

    @Override // defpackage.hp6
    public final long F(long j) {
        return ip8.e(this.a.o.F(j), a());
    }

    @Override // defpackage.hp6
    public final long G(hp6 hp6Var, long j) {
        boolean z = hp6Var instanceof ib7;
        hb7 hb7Var = this.a;
        if (!z) {
            hb7 hb7VarN = d46.N(hb7Var);
            eh8 eh8Var = hb7VarN.o;
            long jD = ip8.d(G(hb7VarN.r, j), (4294967295L & ((long) Float.floatToRawIntBits((int) (hb7VarN.p & 4294967295L)))) | (Float.floatToRawIntBits((int) (r5 >> 32)) << 32));
            if (!eh8Var.O0().n) {
                b26.b("LayoutCoordinate operations are only valid when isAttached is true");
            }
            eh8Var.X0();
            eh8 eh8Var2 = eh8Var.q;
            if (eh8Var2 != null) {
                eh8Var = eh8Var2;
            }
            return ip8.e(jD, eh8Var.G(hp6Var, 0L));
        }
        hb7 hb7Var2 = ((ib7) hp6Var).a;
        eh8 eh8Var3 = hb7Var2.o;
        eh8Var3.X0();
        hb7 hb7VarM0 = hb7Var.o.K0(eh8Var3).M0();
        if (hb7VarM0 != null) {
            long jC = k46.c(k46.d(hb7Var2.F0(hb7VarM0, false), d46.c0(j)), hb7Var.F0(hb7VarM0, false));
            return (((long) Float.floatToRawIntBits((int) (jC >> 32))) << 32) | (((long) Float.floatToRawIntBits((int) (jC & 4294967295L))) & 4294967295L);
        }
        hb7 hb7VarN2 = d46.N(hb7Var2);
        long jD2 = k46.d(k46.d(hb7Var2.F0(hb7VarN2, false), hb7VarN2.p), d46.c0(j));
        hb7 hb7VarN3 = d46.N(hb7Var);
        long jC2 = k46.c(jD2, k46.d(hb7Var.F0(hb7VarN3, false), hb7VarN3.p));
        long jFloatToRawIntBits = Float.floatToRawIntBits((int) (jC2 >> 32));
        long jFloatToRawIntBits2 = ((long) Float.floatToRawIntBits((int) (jC2 & 4294967295L))) & 4294967295L;
        eh8 eh8Var4 = hb7VarN3.o.q;
        eh8Var4.getClass();
        eh8 eh8Var5 = hb7VarN2.o.q;
        eh8Var5.getClass();
        return eh8Var4.G(eh8Var5, jFloatToRawIntBits2 | (jFloatToRawIntBits << 32));
    }

    @Override // defpackage.hp6
    public final zwa H(hp6 hp6Var, boolean z) {
        return this.a.o.H(hp6Var, z);
    }

    @Override // defpackage.hp6
    public final long I(long j) {
        return this.a.o.I(ip8.e(j, a()));
    }

    public final long a() {
        hb7 hb7Var = this.a;
        hb7 hb7VarN = d46.N(hb7Var);
        return ip8.d(G(hb7VarN.r, 0L), hb7Var.o.G(hb7VarN.o, 0L));
    }

    @Override // defpackage.hp6
    public final long d(long j) {
        return this.a.o.d(ip8.e(j, a()));
    }

    @Override // defpackage.hp6
    public final void h(float[] fArr) {
        this.a.o.h(fArr);
    }

    @Override // defpackage.hp6
    public final void i(hp6 hp6Var, float[] fArr) {
        this.a.o.i(hp6Var, fArr);
    }

    @Override // defpackage.hp6
    public final long j() {
        hb7 hb7Var = this.a;
        return (((long) hb7Var.a) << 32) | (((long) hb7Var.b) & 4294967295L);
    }

    @Override // defpackage.hp6
    public final boolean m() {
        return this.a.o.O0().n;
    }

    @Override // defpackage.hp6
    public final long p(long j) {
        return this.a.o.p(ip8.e(0L, a()));
    }

    @Override // defpackage.hp6
    public final long v(long j) {
        return ip8.e(this.a.o.v(j), a());
    }

    @Override // defpackage.hp6
    public final hp6 y() {
        hb7 hb7VarM0;
        if (!m()) {
            b26.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        eh8 eh8Var = ((eh8) this.a.o.o.F.e).q;
        if (eh8Var == null || (hb7VarM0 = eh8Var.M0()) == null) {
            return null;
        }
        return hb7VarM0.r;
    }
}
