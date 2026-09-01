package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ul1 implements b55 {
    public final /* synthetic */ mz1 a;
    public final /* synthetic */ mkd b;
    public final /* synthetic */ long c;
    public final /* synthetic */ nl1 d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ float f;
    public final /* synthetic */ hy8 g;

    public ul1(mz1 mz1Var, mkd mkdVar, long j, nl1 nl1Var, boolean z, float f, hy8 hy8Var) {
        this.a = mz1Var;
        this.b = mkdVar;
        this.c = j;
        this.d = nl1Var;
        this.e = z;
        this.f = f;
        this.g = hy8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            nl1 nl1Var = this.d;
            boolean z = this.e;
            wl1.c(this.a, this.b, this.c, z ? nl1Var.c : nl1Var.g, z ? nl1Var.d : nl1Var.h, this.f, this.g, p65Var, 24576);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
