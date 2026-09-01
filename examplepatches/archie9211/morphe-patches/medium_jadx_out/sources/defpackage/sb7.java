package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sb7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ub7 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sb7(ub7 ub7Var, int i) {
        super(0);
        this.a = i;
        this.b = ub7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ub7 ub7Var = this.b;
        switch (i) {
            case 0:
                bc7 bc7Var = (bc7) ub7Var.i.getValue();
                float fA = 0.0f;
                if (bc7Var != null) {
                    if (ub7Var.f() < 0.0f) {
                        ac7 ac7VarC = ub7Var.c();
                        if (ac7VarC != null) {
                            fA = ac7VarC.b(bc7Var);
                        }
                    } else {
                        ac7 ac7VarC2 = ub7Var.c();
                        fA = ac7VarC2 != null ? ac7VarC2.a(bc7Var) : 1.0f;
                    }
                }
                return Float.valueOf(fA);
            case 1:
                return Float.valueOf((((Boolean) ub7Var.d.getValue()).booleanValue() && ub7Var.d() % 2 == 0) ? -ub7Var.f() : ub7Var.f());
            default:
                return Boolean.valueOf(ub7Var.d() == ((Number) ub7Var.c.getValue()).intValue() && ub7Var.e() == ((Number) ub7Var.m.getValue()).floatValue());
        }
    }
}
