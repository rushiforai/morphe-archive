package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class m91 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ y81 b;
    public final /* synthetic */ gc1 c;

    public /* synthetic */ m91(int i, y81 y81Var, gc1 gc1Var) {
        this.a = i;
        this.b = y81Var;
        this.c = gc1Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        gc1 gc1Var = this.c;
        y81 y81Var = this.b;
        switch (i) {
            case 0:
                y81Var.i(gc1Var.e.a, gc1Var.r);
                break;
            case 1:
                y81Var.i(gc1Var.e.a, gc1Var.r);
                break;
            default:
                y81Var.u(gc1Var.r);
                break;
        }
        return c1eVar;
    }
}
