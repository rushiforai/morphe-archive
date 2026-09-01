package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aff implements zc8 {
    public final /* synthetic */ g49 a;
    public final /* synthetic */ g49 b;

    public aff(g49 g49Var, g49 g49Var2) {
        this.a = g49Var;
        this.b = g49Var2;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        return ev6.H();
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        g49 g49Var = this.a;
        float fG = g49Var.g();
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j & 4294967295L));
        float fG2 = this.b.g();
        float f = fIntBitsToFloat + fG;
        if (fG2 < 0.0f) {
            fG2 = 0.0f;
        }
        float fU = iq7.u(f, -fG2, 0.0f);
        float f2 = fU - fG;
        g49Var.h(fU);
        return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(f2)) & 4294967295L);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        this.a.g();
        this.b.g();
        return 0L;
    }
}
