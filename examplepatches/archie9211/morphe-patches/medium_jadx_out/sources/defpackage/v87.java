package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class v87 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ x87 b;

    public /* synthetic */ v87(x87 x87Var) {
        this.b = x87Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x87 x87Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    rx0.y(x87Var, p65Var, 0);
                }
                break;
            default:
                num.getClass();
                rx0.y(x87Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ v87(x87 x87Var, int i) {
        this.b = x87Var;
    }
}
