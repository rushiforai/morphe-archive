package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e09 extends q28 implements sp6, xl3 {
    public c09 o;
    public boolean p;
    public xd q;
    public w82 r;
    public float s;
    public bs0 t;

    public static boolean J0(long j) {
        return !dfc.a(j, 9205357640488583168L) && (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j & 4294967295L))) & Integer.MAX_VALUE) < 2139095040;
    }

    public static boolean K0(long j) {
        return !dfc.a(j, 9205357640488583168L) && (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j >> 32))) & Integer.MAX_VALUE) < 2139095040;
    }

    public final boolean I0() {
        return this.p && this.o.h() != 9205357640488583168L;
    }

    public final long L0(long j) {
        boolean z = false;
        boolean z2 = f72.d(j) && f72.c(j);
        if (f72.f(j) && f72.e(j)) {
            z = true;
        }
        if ((!I0() && z2) || z) {
            return f72.a(j, f72.h(j), 0, f72.g(j), 0, 10);
        }
        long jH = this.o.h();
        int iRound = K0(jH) ? Math.round(Float.intBitsToFloat((int) (jH >> 32))) : f72.j(j);
        int iRound2 = J0(jH) ? Math.round(Float.intBitsToFloat((int) (jH & 4294967295L))) : f72.i(j);
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(h72.f(iRound2, j))) & 4294967295L) | (((long) Float.floatToRawIntBits(h72.g(iRound, j))) << 32);
        if (I0()) {
            long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(!K0(this.o.h()) ? Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) : Float.intBitsToFloat((int) (this.o.h() >> 32)))) << 32) | (((long) Float.floatToRawIntBits(!J0(this.o.h()) ? Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) : Float.intBitsToFloat((int) (this.o.h() & 4294967295L)))) & 4294967295L);
            jFloatToRawIntBits = (Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)) == 0.0f || Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)) == 0.0f) ? 0L : hp7.H(jFloatToRawIntBits2, this.r.g(jFloatToRawIntBits2, jFloatToRawIntBits));
        }
        return f72.a(j, h72.g(Math.round(Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32))), j), 0, h72.f(Math.round(Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L))), j), 0, 10);
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!I0()) {
            return tk7Var.n(i);
        }
        long jL0 = L0(h72.b(0, 0, 0, i, 7));
        return Math.max(f72.j(jL0), tk7Var.n(i));
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(L0(j));
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new xm(t99VarS, 6));
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!I0()) {
            return tk7Var.a(i);
        }
        long jL0 = L0(h72.b(0, i, 0, 0, 13));
        return Math.max(f72.i(jL0), tk7Var.a(i));
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!I0()) {
            return tk7Var.L(i);
        }
        long jL0 = L0(h72.b(0, i, 0, 0, 13));
        return Math.max(f72.i(jL0), tk7Var.L(i));
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        g61 g61Var = cq6Var.a;
        long jH = this.o.h();
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(K0(jH) ? Float.intBitsToFloat((int) (jH >> 32)) : Float.intBitsToFloat((int) (g61Var.b.B() >> 32)))) << 32) | (((long) Float.floatToRawIntBits(J0(jH) ? Float.intBitsToFloat((int) (jH & 4294967295L)) : Float.intBitsToFloat((int) (g61Var.b.B() & 4294967295L)))) & 4294967295L);
        m50 m50Var = g61Var.b;
        long jH2 = (Float.intBitsToFloat((int) (g61Var.b.B() >> 32)) == 0.0f || Float.intBitsToFloat((int) (m50Var.B() & 4294967295L)) == 0.0f) ? 0L : hp7.H(jFloatToRawIntBits, this.r.g(jFloatToRawIntBits, m50Var.B()));
        long jA = this.q.a((((long) Math.round(Float.intBitsToFloat((int) (jH2 >> 32)))) << 32) | (((long) Math.round(Float.intBitsToFloat((int) (jH2 & 4294967295L)))) & 4294967295L), (((long) Math.round(Float.intBitsToFloat((int) (m50Var.B() & 4294967295L)))) & 4294967295L) | (((long) Math.round(Float.intBitsToFloat((int) (m50Var.B() >> 32)))) << 32), cq6Var.getLayoutDirection());
        float f = (int) (jA >> 32);
        float f2 = (int) (jA & 4294967295L);
        ((md5) g61Var.b.b).C(f, f2);
        try {
            this.o.g(cq6Var, jH2, this.s, this.t);
            ((md5) g61Var.b.b).C(-f, -f2);
            cq6Var.a();
        } catch (Throwable th) {
            ((md5) g61Var.b.b).C(-f, -f2);
            throw th;
        }
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        if (!I0()) {
            return tk7Var.k(i);
        }
        long jL0 = L0(h72.b(0, 0, 0, i, 7));
        return Math.max(f72.j(jL0), tk7Var.k(i));
    }

    public final String toString() {
        return "PainterModifier(painter=" + this.o + ", sizeToIntrinsics=" + this.p + ", alignment=" + this.q + ", alpha=" + this.s + ", colorFilter=" + this.t + ')';
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
