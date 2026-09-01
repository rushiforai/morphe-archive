package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class nw4 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ lw4 b;

    public /* synthetic */ nw4(lw4 lw4Var) {
        this.b = lw4Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        lw4 lw4Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                num.getClass();
                vx0.n(lw4Var, x12Var, tr7.y(1));
                break;
            default:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    vx0.n(lw4Var, p65Var, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ nw4(lw4 lw4Var, int i) {
        this.b = lw4Var;
    }
}
