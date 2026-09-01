package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class x5c implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ of5 b;

    public /* synthetic */ x5c(of5 of5Var, int i) {
        this.a = i;
        this.b = of5Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        of5 of5Var = this.b;
        cq6 cq6Var = (cq6) obj;
        cq6Var.getClass();
        switch (i) {
            case 0:
                vi7 vi7Var = new vi7(cq6Var, 1);
                long jF = cq6Var.f();
                int iIntBitsToFloat = (int) Float.intBitsToFloat((int) (jF >> 32));
                cq6Var.e((4294967295L & ((long) ((int) Float.intBitsToFloat((int) (jF & 4294967295L))))) | (((long) iIntBitsToFloat) << 32), vi7Var, of5Var);
                g76.V(cq6Var, of5Var);
                break;
            default:
                vi7 vi7Var2 = new vi7(cq6Var, 2);
                long jF2 = cq6Var.f();
                int iIntBitsToFloat2 = (int) Float.intBitsToFloat((int) (jF2 >> 32));
                cq6Var.e((4294967295L & ((long) ((int) Float.intBitsToFloat((int) (jF2 & 4294967295L))))) | (((long) iIntBitsToFloat2) << 32), vi7Var2, of5Var);
                g76.V(cq6Var, of5Var);
                break;
        }
        return c1eVar;
    }
}
