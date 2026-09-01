package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mla implements zc8 {
    public final /* synthetic */ g49 a;
    public final /* synthetic */ g49 b;
    public final /* synthetic */ x45 c;

    public mla(g49 g49Var, g49 g49Var2, x45 x45Var) {
        this.a = g49Var;
        this.b = g49Var2;
        this.c = x45Var;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        return ev6.H();
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j & 4294967295L));
        g49 g49Var = this.a;
        float fG = g49Var.g() + fIntBitsToFloat;
        g49 g49Var2 = this.b;
        if ((-g49Var2.g()) > fG || fG > 0.0f) {
            return 0L;
        }
        float fU = iq7.u(fG, -g49Var2.g(), 0.0f) - g49Var.g();
        g49Var.h(g49Var.g() + fU);
        return (((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(fU)) & 4294967295L);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        g49 g49Var = this.a;
        float fG = g49Var.g();
        g49 g49Var2 = this.b;
        this.c.invoke(Boolean.valueOf(Math.abs(g49Var2.g() + fG) > 3.0f));
        g49Var.g();
        g49Var2.g();
        return 0L;
    }
}
