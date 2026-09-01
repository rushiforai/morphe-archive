package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class pk3 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;

    public /* synthetic */ pk3(int i, x45 x45Var) {
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                x45Var.invoke(new ip8(((rb9) obj2).c));
                break;
            default:
                kta ktaVar = (kta) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ktaVar.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(ktaVar) ? 4 : 2;
                }
                int i2 = 1;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    boolean zF = p65Var.f(x45Var) | ((iIntValue & 14) == 4);
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new ui9(x45Var, 17, ktaVar);
                        p65Var.j0(objM);
                    }
                    wo7.c((m45) objM, pxf.E(-887884486, new nta(ktaVar, i2), p65Var), null, false, null, null, p65Var, 48);
                }
                break;
        }
        return c1eVar;
    }
}
