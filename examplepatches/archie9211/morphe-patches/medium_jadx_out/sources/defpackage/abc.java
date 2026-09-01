package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class abc implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ cbc b;

    public /* synthetic */ abc(cbc cbcVar) {
        this.b = cbcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        cbc cbcVar = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                num.getClass();
                k50.R(cbcVar, x12Var, tr7.y(1));
                break;
            default:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    k50.R(cbcVar, p65Var, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ abc(cbc cbcVar, int i) {
        this.b = cbcVar;
    }
}
