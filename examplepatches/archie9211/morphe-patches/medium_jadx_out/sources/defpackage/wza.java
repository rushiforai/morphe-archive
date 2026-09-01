package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wza implements zc8 {
    public final /* synthetic */ g49 a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ l78 c;

    public wza(g49 g49Var, l78 l78Var, l78 l78Var2) {
        this.a = g49Var;
        this.b = l78Var;
        this.c = l78Var2;
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
        l78 l78Var = this.b;
        g49Var.h(((Integer) l78Var.getValue()) != null ? iq7.u(fG, -r0.intValue(), 0.0f) : 0.0f);
        if (((Integer) l78Var.getValue()) == null) {
            return 0L;
        }
        this.c.setValue(Float.valueOf(Math.max(r3.intValue() - (-g49Var.g()), 0.0f)));
        return 0L;
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final /* bridge */ long n0(long j, long j2, int i) {
        return 0L;
    }
}
