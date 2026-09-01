package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n5b implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ k5b b;

    public /* synthetic */ n5b(k5b k5bVar) {
        this.b = k5bVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        k5b k5bVar = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    mq7.o(k5bVar, p65Var, 0);
                }
                break;
            default:
                num.getClass();
                mq7.o(k5bVar, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ n5b(k5b k5bVar, int i) {
        this.b = k5bVar;
    }
}
