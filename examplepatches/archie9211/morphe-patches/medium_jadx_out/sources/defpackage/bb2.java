package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bb2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ db2 b;

    public /* synthetic */ bb2(db2 db2Var, int i) {
        this.a = i;
        this.b = db2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        db2 db2Var = this.b;
        switch (i) {
            case 0:
                flb.s0(db2Var);
                return c1eVar;
            case 1:
                db2Var.v.e(true);
                break;
            case 2:
                db2Var.v.a(true);
                break;
            case 3:
                db2Var.v.c();
                break;
            case 4:
                flb.s0(db2Var);
                return c1eVar;
            case 5:
                db2Var.v.o();
                break;
            case 6:
                qa2 qa2Var = db2Var.s.w;
                qa2Var.b.r.b(db2Var.w.e);
                break;
            default:
                kx6 kx6Var = db2Var.s;
                sr4 sr4Var = db2Var.x;
                if (kx6Var.b()) {
                    akc akcVar = kx6Var.c;
                    if (akcVar != null) {
                        ((n43) akcVar).b();
                    }
                } else {
                    sr4.a(sr4Var);
                }
                return Boolean.TRUE;
        }
        return Boolean.TRUE;
    }
}
