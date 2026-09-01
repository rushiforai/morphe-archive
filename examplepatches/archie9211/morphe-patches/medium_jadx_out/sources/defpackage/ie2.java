package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ie2 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ z52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ ie2(Object obj, Object obj2, z52 z52Var, i52 i52Var, int i) {
        this.a = i;
        this.d = obj;
        this.e = obj2;
        this.b = z52Var;
        this.c = i52Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        i52 i52Var = this.c;
        z52 z52Var = this.b;
        Object obj3 = this.e;
        Object obj4 = this.d;
        uob uobVar = w12.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    boolean z = ((se2) obj4).c;
                    xd2 xd2Var = (xd2) obj3;
                    boolean zF = p65Var.f(xd2Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        k0 k0Var = new k0(1, xd2Var, xd2.class, "onIsPrivateChanged", PdtluglzAX.ZUmnzhM, 0, 6);
                        p65Var.j0(k0Var);
                        objM = k0Var;
                    }
                    x45 x45Var = (x45) ((qh6) objM);
                    Object objM2 = p65Var.M();
                    if (objM2 == uobVar) {
                        objM2 = xx.u;
                        p65Var.j0(objM2);
                    }
                    z52Var.getClass();
                    hk7.b(z, x45Var, bgf.N(new y52(i52Var, (x45) objM2), "is_private"), false, null, null, p65Var, 0, 56);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    boolean z2 = ((a5e) obj4).d;
                    g4e g4eVar = (g4e) obj3;
                    boolean zF2 = p65Var2.f(g4eVar);
                    Object objM3 = p65Var2.M();
                    if (zF2 || objM3 == uobVar) {
                        hgb hgbVar = new hgb(1, g4eVar, g4e.class, "onIsPrivateChanged", "onIsPrivateChanged(Z)V", 0, 14);
                        p65Var2.j0(hgbVar);
                        objM3 = hgbVar;
                    }
                    x45 x45Var2 = (x45) ((qh6) objM3);
                    Object objM4 = p65Var2.M();
                    if (objM4 == uobVar) {
                        objM4 = zkc.r;
                        p65Var2.j0(objM4);
                    }
                    z52Var.getClass();
                    hk7.b(z2, x45Var2, bgf.N(new y52(i52Var, (x45) objM4), "is_private"), false, null, null, p65Var2, 0, 56);
                }
                break;
        }
        return c1eVar;
    }
}
