package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class ce7 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ ee7 b;

    public /* synthetic */ ce7(ee7 ee7Var) {
        this.b = ee7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ee7 ee7Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    n01.L(ee7Var, p65Var, 0);
                }
                break;
            default:
                num.getClass();
                n01.L(ee7Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ce7(ee7 ee7Var, int i) {
        this.b = ee7Var;
    }
}
