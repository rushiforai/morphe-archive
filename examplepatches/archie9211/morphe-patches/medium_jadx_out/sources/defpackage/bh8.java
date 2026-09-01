package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bh8 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ eh8 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bh8(eh8 eh8Var, int i) {
        super(0);
        this.a = i;
        this.b = eh8Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        eh8 eh8Var = this.b;
        switch (i) {
            case 0:
                e61 e61Var = eh8Var.H;
                e61Var.getClass();
                eh8Var.I0(e61Var, eh8Var.G);
                break;
            default:
                eh8 eh8Var2 = eh8Var.q;
                if (eh8Var2 != null) {
                    eh8Var2.V0();
                }
                break;
        }
        return c1eVar;
    }
}
