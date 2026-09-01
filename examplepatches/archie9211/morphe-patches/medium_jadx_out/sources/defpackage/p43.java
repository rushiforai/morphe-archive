package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p43 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r43 b;

    public /* synthetic */ p43(r43 r43Var, int i) {
        this.a = i;
        this.b = r43Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        r43 r43Var = this.b;
        switch (i) {
            case 0:
                mkb mkbVar = (mkb) bo.K(r43Var, rkb.a);
                yr yrVar = r43Var.u;
                if (mkbVar == null) {
                    if (yrVar != null) {
                        r43Var.J0(yrVar);
                    }
                    r43Var.u = null;
                } else if (yrVar == null) {
                    int i2 = 1;
                    q43 q43Var = new q43(i2, r43Var);
                    p43 p43Var = new p43(r43Var, i2);
                    d56 d56Var = r43Var.r;
                    boolean z = r43Var.s;
                    float f = r43Var.t;
                    cud cudVar = pkb.a;
                    yr yrVar2 = new yr(d56Var, z, f, q43Var, p43Var);
                    r43Var.I0(yrVar2);
                    r43Var.u = yrVar2;
                }
                return c1e.a;
            default:
                return ((sv1) bo.K(r43Var, tv1.a)).f() ? ((double) op8.f0(((uu1) bo.K(r43Var, d82.a)).a)) > 0.5d ? rkb.d : rkb.e : rkb.f;
        }
    }
}
