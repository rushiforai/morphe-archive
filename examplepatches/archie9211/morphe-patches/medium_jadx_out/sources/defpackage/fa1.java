package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fa1 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ ga1 b;
    public final /* synthetic */ y81 c;

    public /* synthetic */ fa1(y81 y81Var, ga1 ga1Var) {
        this.c = y81Var;
        this.b = ga1Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        y81 y81Var = this.c;
        ga1 ga1Var = this.b;
        switch (i) {
            case 0:
                y81Var.x(ga1Var.k);
                break;
            default:
                if (!ga1Var.j.booleanValue()) {
                    y81Var.l();
                } else {
                    y81Var.A();
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fa1(ga1 ga1Var, y81 y81Var) {
        this.b = ga1Var;
        this.c = y81Var;
    }
}
