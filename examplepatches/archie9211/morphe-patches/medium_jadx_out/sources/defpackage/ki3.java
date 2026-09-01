package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ki3 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ long c;

    public /* synthetic */ ki3(float f, long j) {
        this.a = 2;
        this.c = j;
        this.b = f;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        float f = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                zl3 zl3Var = (zl3) obj;
                float fZ = zl3Var.Z(f);
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(zl3Var.Z(f) / 2.0f)) & 4294967295L) | (Float.floatToRawIntBits(0.0f) << 32);
                float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32));
                ho2.n(zl3Var, this.c, jFloatToRawIntBits, (4294967295L & ((long) Float.floatToRawIntBits(zl3Var.Z(f) / 2.0f))) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32), fZ, 0, 496);
                break;
            case 1:
                zl3 zl3Var2 = (zl3) obj;
                float fZ2 = zl3Var2.Z(f);
                ho2.n(zl3Var2, this.c, (((long) Float.floatToRawIntBits(zl3Var2.Z(f) / 2.0f)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L), (((long) Float.floatToRawIntBits(zl3Var2.Z(f) / 2.0f)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var2.f() & 4294967295L))))), fZ2, 0, 496);
                break;
            default:
                zl3 zl3Var3 = (zl3) obj;
                zl3Var3.getClass();
                long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L);
                long jFloatToRawIntBits3 = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var3.f() >> 32)) / 2.0f)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var3.f() & 4294967295L)))) & 4294967295L);
                long j = this.c;
                float f2 = this.b;
                ho2.n(zl3Var3, j, jFloatToRawIntBits2, jFloatToRawIntBits3, f2, 0, 496);
                ho2.n(zl3Var3, j, (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var3.f() >> 32)) / 2.0f)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var3.f() & 4294967295L)))) & 4294967295L), (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var3.f() >> 32)))) << 32) | (((long) Float.floatToRawIntBits(0.0f)) & 4294967295L), f2, 0, 496);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ki3(float f, int i, long j) {
        this.a = i;
        this.b = f;
        this.c = j;
    }
}
