package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class e8b implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mkd b;
    public final /* synthetic */ long c;

    public /* synthetic */ e8b(mkd mkdVar, long j, int i) {
        this.a = i;
        this.b = mkdVar;
        this.c = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mkd mkdVar = this.b;
        switch (i) {
            case 0:
                zl3 zl3Var = (zl3) obj;
                zl3Var.getClass();
                ho2.n(zl3Var, this.c, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits((zl3Var.p0(mkdVar.b.c) - zl3Var.p0(mkdVar.a.b)) / 2.0f)) & 4294967295L), (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)))) & 4294967295L), zl3Var.Z(1.0f), 0, 496);
                break;
            case 1:
                zl3 zl3Var2 = (zl3) obj;
                zl3Var2.getClass();
                ho2.n(zl3Var2, this.c, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits((zl3Var2.p0(mkdVar.b.c) - zl3Var2.p0(mkdVar.a.b)) / 2.0f)) & 4294967295L), (4294967295L & ((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var2.f() & 4294967295L))))) | (((long) Float.floatToRawIntBits(0.0f)) << 32), zl3Var2.Z(1.0f), 0, 496);
                break;
            case 2:
                zl3 zl3Var3 = (zl3) obj;
                zl3Var3.getClass();
                float fP0 = (zl3Var3.p0(mkdVar.b.c) - zl3Var3.p0(mkdVar.a.b)) / 2.0f;
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(fP0)) & 4294967295L);
                float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var3.f() & 4294967295L)) - fP0;
                if (fIntBitsToFloat < 0.0f) {
                    fIntBitsToFloat = 0.0f;
                }
                ho2.n(zl3Var3, this.c, jFloatToRawIntBits, (((long) Float.floatToRawIntBits(0.0f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(fIntBitsToFloat))), zl3Var3.Z(1.0f), 0, 496);
                break;
            default:
                zl3 zl3Var4 = (zl3) obj;
                zl3Var4.getClass();
                float fZ = zl3Var4.Z(9.5f);
                float fP02 = (zl3Var4.p0(mkdVar.b.c) - zl3Var4.p0(mkdVar.a.b)) / 2.0f;
                long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fZ)) << 32) | (((long) Float.floatToRawIntBits(fP02)) & 4294967295L);
                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zl3Var4.f() & 4294967295L)) - fP02;
                ho2.n(zl3Var4, this.c, jFloatToRawIntBits2, (((long) Float.floatToRawIntBits(fZ)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(fIntBitsToFloat2 >= 0.0f ? fIntBitsToFloat2 : 0.0f))), zl3Var4.Z(1.0f), 0, 496);
                break;
        }
        return c1eVar;
    }
}
