package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class o43 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r43 b;

    public /* synthetic */ o43(r43 r43Var, int i) {
        this.a = i;
        this.b = r43Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        r43 r43Var = this.b;
        switch (i) {
            case 0:
                lkb lkbVar = (lkb) bo.K(r43Var, qkb.a);
                yr yrVar = r43Var.u;
                if (lkbVar == null) {
                    if (yrVar != null) {
                        r43Var.J0(yrVar);
                    }
                    r43Var.u = null;
                } else if (yrVar == null) {
                    q43 q43Var = new q43(0, r43Var);
                    o43 o43Var = new o43(r43Var, 1);
                    d56 d56Var = r43Var.r;
                    boolean z = r43Var.s;
                    float f = r43Var.t;
                    cud cudVar = pkb.a;
                    yr yrVar2 = new yr(d56Var, z, f, q43Var, o43Var);
                    r43Var.I0(yrVar2);
                    r43Var.u = yrVar2;
                }
                return c1e.a;
            default:
                return pwd.j;
        }
    }
}
