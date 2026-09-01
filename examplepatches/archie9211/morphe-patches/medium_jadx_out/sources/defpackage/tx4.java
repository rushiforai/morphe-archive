package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tx4 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ ay4 b;

    public /* synthetic */ tx4(ay4 ay4Var) {
        this.b = ay4Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ay4 ay4Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                num.getClass();
                f49.j(ay4Var, x12Var, tr7.y(1));
                break;
            default:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    f49.j(ay4Var, p65Var, 0);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ tx4(ay4 ay4Var, int i) {
        this.b = ay4Var;
    }
}
