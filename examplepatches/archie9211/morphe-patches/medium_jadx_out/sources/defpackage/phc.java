package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class phc implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ mz1 c;

    public /* synthetic */ phc(mz1 mz1Var, b55 b55Var, int i) {
        this.a = 3;
        this.c = mz1Var;
        this.b = b55Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        b55 b55Var = this.b;
        mz1 mz1Var = this.c;
        int i3 = 1;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    sn3 sn3Var = w72.a;
                    long j = ((uu1) p65Var.j(d82.a)).a;
                    k40.c(sn3Var.a(Float.valueOf((!((sv1) p65Var.j(tv1.a)).f() ? ((double) op8.f0(j)) < 0.5d : ((double) op8.f0(j)) > 0.5d) ? 0.87f : 1.0f)), pxf.E(1236486620, new phc(b55Var, mz1Var, i3), p65Var), p65Var, 56);
                }
                break;
            case 1:
                int iIntValue2 = num.intValue();
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    kjd.a(((myd) p65Var2.j(qyd.b)).j, pxf.E(1789628237, new phc(b55Var, mz1Var, i2), p65Var2), p65Var2, 48);
                }
                break;
            case 2:
                int iIntValue3 = num.intValue();
                p65 p65Var3 = (p65) x12Var;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else if (b55Var != null) {
                    p65Var3.Y(1845823628);
                    il7.a(mz1Var, b55Var, p65Var3, 0);
                    p65Var3.p(false);
                } else {
                    p65Var3.Y(1845819398);
                    il7.n(mz1Var, p65Var3, 0);
                    p65Var3.p(false);
                }
                break;
            default:
                num.getClass();
                il7.a(mz1Var, b55Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ phc(b55 b55Var, mz1 mz1Var, int i) {
        this.a = i;
        this.b = b55Var;
        this.c = mz1Var;
    }
}
