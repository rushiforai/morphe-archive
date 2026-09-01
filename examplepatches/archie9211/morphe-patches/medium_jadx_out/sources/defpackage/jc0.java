package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jc0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ jc0(fy2 fy2Var, boolean z, mz1 mz1Var) {
        this.a = 1;
        this.c = fy2Var;
        this.b = z;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        Object obj3 = this.d;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                gsa.A(z, (wc0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 1:
                fy2 fy2Var = (fy2) obj4;
                mz1 mz1Var = (mz1) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    kjd.a(((myd) p65Var.j(qyd.b)).j, pxf.E(1507027814, new dd(fy2Var, z, mz1Var), p65Var), p65Var, 48);
                }
                break;
            case 2:
                ((Integer) obj2).getClass();
                rv8.k(z, (ah3) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                xz5.w((fha) obj4, (wda) obj3, z, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jc0(fha fhaVar, wda wdaVar, boolean z, int i) {
        this.a = 3;
        this.c = fhaVar;
        this.d = wdaVar;
        this.b = z;
    }

    public /* synthetic */ jc0(boolean z, Object obj, r28 r28Var, int i, int i2) {
        this.a = i2;
        this.b = z;
        this.c = obj;
        this.d = r28Var;
    }
}
