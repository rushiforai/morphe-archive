package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class u1e implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ x1e b;

    public /* synthetic */ u1e(x1e x1eVar) {
        this.b = x1eVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x1e x1eVar = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                num.getClass();
                m40.E(x1eVar, x12Var, tr7.y(1));
                break;
            default:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    m40.E(x1eVar, p65Var, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ u1e(x1e x1eVar, int i) {
        this.b = x1eVar;
    }
}
