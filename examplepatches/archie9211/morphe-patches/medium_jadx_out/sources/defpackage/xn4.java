package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xn4 implements b55 {
    public final /* synthetic */ long a;
    public final /* synthetic */ mkd b;
    public final /* synthetic */ float c;
    public final /* synthetic */ mz1 d;

    public xn4(long j, mkd mkdVar, float f, mz1 mz1Var) {
        this.a = j;
        this.b = mkdVar;
        this.c = f;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            fo7.v(this.a, this.b, pxf.E(-1767363041, new rw0(this.c, this.d), p65Var), p65Var, 384);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
