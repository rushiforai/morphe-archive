package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class od implements b55 {
    public final /* synthetic */ b55 a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ m3c d;
    public final /* synthetic */ long e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;
    public final /* synthetic */ long h;
    public final /* synthetic */ b55 i;
    public final /* synthetic */ mz1 j;

    public od(b55 b55Var, b55 b55Var2, b55 b55Var3, m3c m3cVar, long j, long j2, long j3, long j4, b55 b55Var4, mz1 mz1Var) {
        this.a = b55Var;
        this.b = b55Var2;
        this.c = b55Var3;
        this.d = m3cVar;
        this.e = j;
        this.f = j2;
        this.g = j3;
        this.h = j4;
        this.i = b55Var4;
        this.j = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            qd.a(pxf.E(1367541877, new nd(this.i, this.j, 2), p65Var), null, this.a, this.b, this.c, this.d, this.e, iv1.d(ub3.a, p65Var), this.f, this.g, this.h, p65Var, 6);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
