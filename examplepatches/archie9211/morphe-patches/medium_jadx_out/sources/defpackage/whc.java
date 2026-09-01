package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class whc implements b55 {
    public final /* synthetic */ b55 a;
    public final /* synthetic */ mz1 b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;

    public whc(b55 b55Var, mz1 mz1Var, b55 b55Var2, long j, long j2) {
        this.a = b55Var;
        this.b = mz1Var;
        this.c = b55Var2;
        this.d = j;
        this.e = j2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            k40.c(jjd.a.a(pyd.a(cic.h, p65Var)), pxf.E(969655473, new vhc(this.a, this.b, this.c, pyd.a(cic.b, p65Var), this.d, this.e), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
