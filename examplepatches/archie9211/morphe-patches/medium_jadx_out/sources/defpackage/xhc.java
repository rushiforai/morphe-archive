package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xhc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ihc b;

    public /* synthetic */ xhc(ihc ihcVar, int i) {
        this.a = i;
        this.b = ihcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ihc ihcVar = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jjd.b(ihcVar.a.a(), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 262142);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(1 & iIntValue2, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    boolean zF = p65Var2.f(ihcVar);
                    Object objM = p65Var2.M();
                    if (zF || objM == w12.a) {
                        objM = new ehc(ihcVar, 2);
                        p65Var2.j0(objM);
                    }
                    f49.l((m45) objM, null, false, null, null, r02.a, p65Var2, 1572864, 62);
                }
                break;
        }
        return c1eVar;
    }
}
