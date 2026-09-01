package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jd7 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ wd7 b;
    public final /* synthetic */ ld7 c;

    public /* synthetic */ jd7(wd7 wd7Var, ld7 ld7Var) {
        this.b = wd7Var;
        this.c = ld7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ld7 ld7Var = this.c;
        wd7 wd7Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    g01.u(wd7Var, ld7Var, p65Var, 0);
                }
                break;
            default:
                num.getClass();
                g01.u(wd7Var, ld7Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jd7(wd7 wd7Var, ld7 ld7Var, int i) {
        this.b = wd7Var;
        this.c = ld7Var;
    }
}
