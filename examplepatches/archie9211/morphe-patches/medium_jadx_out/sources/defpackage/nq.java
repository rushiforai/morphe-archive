package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nq implements b55 {
    public final /* synthetic */ r28 a;
    public final /* synthetic */ m78 b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ yrb d;
    public final /* synthetic */ m3c e;
    public final /* synthetic */ long f;
    public final /* synthetic */ float g;
    public final /* synthetic */ mz1 h;

    public nq(r28 r28Var, m78 m78Var, l78 l78Var, yrb yrbVar, m3c m3cVar, long j, float f, mz1 mz1Var) {
        this.a = r28Var;
        this.b = m78Var;
        this.c = l78Var;
        this.d = yrbVar;
        this.e = m3cVar;
        this.f = j;
        this.g = f;
        this.h = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            wo7.a(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, p65Var, 384);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
