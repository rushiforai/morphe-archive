package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nta implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kta b;

    public /* synthetic */ nta(kta ktaVar, int i) {
        this.a = i;
        this.b = ktaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        kta ktaVar = this.b;
        switch (i) {
            case 0:
                mz1 mz1Var = r40.c;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    mz1Var.f(ktaVar, p65Var, 48);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jjd.b(ktaVar.b, bgf.N(o28.b, "name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var2, 48, 24960, 110588);
                }
                break;
        }
        return c1eVar;
    }
}
