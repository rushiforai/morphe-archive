package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zn9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lo9 b;

    public /* synthetic */ zn9(lo9 lo9Var, int i) {
        this.a = i;
        this.b = lo9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    lo9 lo9Var = this.b;
                    boolean zH = p65Var.h(lo9Var);
                    Object objM = p65Var.M();
                    if (zH || objM == uobVar) {
                        bo9 bo9Var = new bo9(0, lo9Var, lo9.class, "onDialogClosed", "onDialogClosed()V", 0, 0);
                        p65Var.j0(bo9Var);
                        objM = bo9Var;
                    }
                    f76.w((m45) ((qh6) objM), null, false, null, null, null, wgf.h, p65Var, 805306368, 510);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    lo9 lo9Var2 = this.b;
                    boolean zH2 = p65Var2.h(lo9Var2);
                    Object objM2 = p65Var2.M();
                    if (zH2 || objM2 == uobVar) {
                        bo9 bo9Var2 = new bo9(0, lo9Var2, lo9.class, "onHideResponsesConfirmed", "onHideResponsesConfirmed()V", 0, 2);
                        p65Var2.j0(bo9Var2);
                        objM2 = bo9Var2;
                    }
                    f76.w((m45) ((qh6) objM2), null, false, null, null, null, wgf.k, p65Var2, 805306368, 510);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    lo9 lo9Var3 = this.b;
                    boolean zH3 = p65Var3.h(lo9Var3);
                    Object objM3 = p65Var3.M();
                    if (zH3 || objM3 == uobVar) {
                        bo9 bo9Var3 = new bo9(0, lo9Var3, lo9.class, "onDialogClosed", "onDialogClosed()V", 0, 3);
                        p65Var3.j0(bo9Var3);
                        objM3 = bo9Var3;
                    }
                    f76.w((m45) ((qh6) objM3), null, false, null, null, null, wgf.l, p65Var3, 805306368, 510);
                }
                break;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    lo9 lo9Var4 = this.b;
                    boolean zH4 = p65Var4.h(lo9Var4);
                    Object objM4 = p65Var4.M();
                    if (zH4 || objM4 == uobVar) {
                        bo9 bo9Var4 = new bo9(0, lo9Var4, lo9.class, "onLockResponsesConfirmed", "onLockResponsesConfirmed()V", 0, 5);
                        p65Var4.j0(bo9Var4);
                        objM4 = bo9Var4;
                    }
                    f76.w((m45) ((qh6) objM4), null, false, null, null, null, wgf.o, p65Var4, 805306368, 510);
                }
                break;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    lo9 lo9Var5 = this.b;
                    boolean zH5 = p65Var5.h(lo9Var5);
                    Object objM5 = p65Var5.M();
                    if (zH5 || objM5 == uobVar) {
                        qv7 qv7Var = new qv7(0, lo9Var5, lo9.class, "onDialogClosed", "onDialogClosed()V", 0, 28);
                        p65Var5.j0(qv7Var);
                        objM5 = qv7Var;
                    }
                    f76.w((m45) ((qh6) objM5), null, false, null, null, null, wgf.p, p65Var5, 805306368, 510);
                }
                break;
            default:
                String str = (String) obj;
                String str2 = (String) obj2;
                str.getClass();
                str2.getClass();
                ko9 ko9Var = this.b.a;
                vx0.c0(f76.F(ko9Var), null, null, new ho9(ko9Var, str, str2, null, 0), 3);
                break;
        }
        return c1eVar;
    }
}
