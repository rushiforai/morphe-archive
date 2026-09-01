package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pd implements b55 {
    public final /* synthetic */ mz1 a;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ b55 d;
    public final /* synthetic */ m3c e;
    public final /* synthetic */ long f;
    public final /* synthetic */ long g;

    public pd(mz1 mz1Var, r28 r28Var, b55 b55Var, b55 b55Var2, m3c m3cVar, long j, long j2) {
        this.a = mz1Var;
        this.b = r28Var;
        this.c = b55Var;
        this.d = b55Var2;
        this.e = m3cVar;
        this.f = j;
        this.g = j2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            rd.b(this.a, this.b, this.c, this.d, this.e, this.f, this.g, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
