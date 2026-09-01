package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dpa implements c55 {
    public final /* synthetic */ long a;
    public final /* synthetic */ npa b;

    public dpa(long j, npa npaVar) {
        this.a = j;
        this.b = npaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Number) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).g(zBooleanValue) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            p65Var.S();
        } else if (zBooleanValue) {
            p65Var.Y(-499784343);
            z3a.a(jfc.l(o28.b, 16.0f), this.a, 2.5f, 0L, 0, 0.0f, p65Var, 390, 56);
            p65Var.p(false);
        } else {
            p65Var.Y(-499540745);
            npa npaVar = this.b;
            boolean zF = p65Var.f(npaVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new a33(1, npaVar);
                p65Var.j0(objM);
            }
            vo7.a((mn4) objM, this.a, p65Var, 0);
            p65Var.p(false);
        }
        return c1e.a;
    }
}
