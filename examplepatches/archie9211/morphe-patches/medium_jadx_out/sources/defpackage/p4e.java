package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p4e implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ g4e b;

    public /* synthetic */ p4e(g4e g4eVar, int i) {
        this.a = 0;
        this.b = g4eVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        g4e g4eVar = this.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                t40.z(g4eVar, (x12) obj, tr7.y(1));
                break;
            case 1:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    t40.z(g4eVar, p65Var, 0);
                }
                break;
            case 2:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    g4e g4eVar2 = this.b;
                    boolean zF = p65Var2.f(g4eVar2);
                    Object objM = p65Var2.M();
                    if (zF || objM == uobVar) {
                        ibd ibdVar = new ibd(0, g4eVar2, g4e.class, "onHasConfirmedPrivacyClicked", "onHasConfirmedPrivacyClicked()V", 0, 26);
                        p65Var2.j0(ibdVar);
                        objM = ibdVar;
                    }
                    f76.w((m45) ((qh6) objM), null, false, null, null, null, sgg.f, p65Var2, 805306368, 510);
                }
                break;
            default:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    g4e g4eVar3 = this.b;
                    boolean zF2 = p65Var3.f(g4eVar3);
                    Object objM2 = p65Var3.M();
                    if (zF2 || objM2 == uobVar) {
                        ibd ibdVar2 = new ibd(0, g4eVar3, g4e.class, "onDialogClosed", "onDialogClosed()V", 0, 27);
                        p65Var3.j0(ibdVar2);
                        objM2 = ibdVar2;
                    }
                    f76.w((m45) ((qh6) objM2), null, false, null, null, null, sgg.g, p65Var3, 805306368, 510);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ p4e(g4e g4eVar, int i, byte b) {
        this.a = i;
        this.b = g4eVar;
    }
}
