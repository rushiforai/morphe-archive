package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sta implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ iua b;
    public final /* synthetic */ kv6 c;
    public final /* synthetic */ sh9 d;
    public final /* synthetic */ vta e;

    public /* synthetic */ sta(iua iuaVar, kv6 kv6Var, sh9 sh9Var, vta vtaVar, int i) {
        this.a = i;
        this.b = iuaVar;
        this.c = kv6Var;
        this.d = sh9Var;
        this.e = vtaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    hua huaVar = hua.a;
                    iua iuaVar = this.b;
                    if (g76.L(iuaVar, huaVar)) {
                        p65Var.Y(-879003342);
                        op8.A(jfc.c, p65Var, 6);
                        p65Var.p(false);
                    } else {
                        boolean z = iuaVar instanceof eua;
                        vta vtaVar = this.e;
                        if (z) {
                            p65Var.Y(-878999708);
                            op8.x((eua) iuaVar, this.c, this.d, vtaVar, jfc.c, p65Var, 24576);
                            p65Var.p(false);
                        } else if (iuaVar instanceof gua) {
                            p65Var.Y(-878989717);
                            op8.z((gua) iuaVar, vtaVar, jfc.c, p65Var, 384);
                            p65Var.p(false);
                        } else {
                            if (!(iuaVar instanceof fua)) {
                                throw ho2.L(p65Var, -879004963, false);
                            }
                            p65Var.Y(-878982529);
                            op8.y(vtaVar, jfc.c, p65Var, 48);
                            p65Var.p(false);
                        }
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                hy8 hy8Var = (hy8) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    op8.D(this.b, this.c, this.d, this.e, w2g.B(o28.b, hy8Var), p65Var2, 0);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
