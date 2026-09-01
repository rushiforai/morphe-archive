package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class z35 implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ i45 b;
    public final /* synthetic */ ub0 c;
    public final /* synthetic */ SourceParameter d;

    public /* synthetic */ z35(ub0 ub0Var, i45 i45Var, SourceParameter sourceParameter) {
        this.c = ub0Var;
        this.b = i45Var;
        this.d = sourceParameter;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        SourceParameter sourceParameter = this.d;
        ub0 ub0Var = this.c;
        i45 i45Var = this.b;
        switch (i) {
            case 0:
                if (!ub0Var.i) {
                    i45Var.u(gp7.u(sourceParameter));
                } else {
                    i45Var.s();
                }
                break;
            default:
                i45Var.q(ub0Var.o, gp7.u(sourceParameter));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ z35(i45 i45Var, ub0 ub0Var, SourceParameter sourceParameter) {
        this.b = i45Var;
        this.c = ub0Var;
        this.d = sourceParameter;
    }
}
