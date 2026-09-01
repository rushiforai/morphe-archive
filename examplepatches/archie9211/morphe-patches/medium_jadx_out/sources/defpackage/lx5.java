package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx5 extends c09 {
    public final ew5 f;

    public lx5(ew5 ew5Var) {
        this.f = ew5Var;
    }

    @Override // defpackage.c09
    public final long h() {
        ew5 ew5Var = this.f;
        int iB = ew5Var.b();
        float f = iB > 0 ? iB : Float.NaN;
        int iA = ew5Var.a();
        return (((long) Float.floatToRawIntBits(iA > 0 ? iA : Float.NaN)) & 4294967295L) | (((long) Float.floatToRawIntBits(f)) << 32);
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        ew5 ew5Var = this.f;
        int iB = ew5Var.b();
        float fIntBitsToFloat = iB > 0 ? Float.intBitsToFloat((int) (zl3Var.f() >> 32)) / iB : 1.0f;
        int iA = ew5Var.a();
        float fIntBitsToFloat2 = iA > 0 ? Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)) / iA : 1.0f;
        m50 m50VarB0 = zl3Var.b0();
        long jB = m50VarB0.B();
        m50VarB0.x().h();
        try {
            ((md5) m50VarB0.b).z(fIntBitsToFloat, fIntBitsToFloat2, 0L);
            ew5Var.d(qm.a(zl3Var.b0().x()));
        } finally {
            y30.x(m50VarB0, jB);
        }
    }
}
