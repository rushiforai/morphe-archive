package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s12 extends co6 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ u12 b;
    public final /* synthetic */ mn c;
    public final /* synthetic */ mz1 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s12(mn mnVar, u12 u12Var, mz1 mz1Var) {
        super(2);
        this.c = mnVar;
        this.b = u12Var;
        this.d = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        mz1 mz1Var = this.d;
        mn mnVar = this.c;
        u12 u12Var = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    p65Var.Y(866651995);
                    z22.a(mnVar, u12Var.k, mz1Var, p65Var, 0);
                    p65Var.p(false);
                }
                break;
            default:
                ((Number) obj2).intValue();
                u12Var.a(mnVar, mz1Var, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s12(u12 u12Var, mn mnVar, mz1 mz1Var, int i) {
        super(2);
        this.b = u12Var;
        this.c = mnVar;
        this.d = mz1Var;
    }
}
