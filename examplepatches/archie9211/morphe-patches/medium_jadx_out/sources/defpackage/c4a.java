package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c4a implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mz1 b;
    public final /* synthetic */ uu1 c;

    public /* synthetic */ c4a(uu1 uu1Var, mz1 mz1Var, int i) {
        this.a = 2;
        this.c = uu1Var;
        this.b = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.b;
        uu1 uu1Var = this.c;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    mz1Var.k(uu1Var, new uu1(ap7.a.n), p65Var, 0);
                }
                break;
            case 1:
                int iIntValue2 = num.intValue();
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    mz1Var.k(uu1Var, new uu1(ap7.a.p), p65Var2, 0);
                }
                break;
            default:
                num.getClass();
                kk7.a(uu1Var, mz1Var, x12Var, tr7.y(49));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ c4a(mz1 mz1Var, uu1 uu1Var, int i) {
        this.a = i;
        this.b = mz1Var;
        this.c = uu1Var;
    }
}
