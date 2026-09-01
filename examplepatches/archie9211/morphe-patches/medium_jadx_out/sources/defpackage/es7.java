package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class es7 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ Object c;

    public /* synthetic */ es7(float f, int i, Object obj) {
        this.a = i;
        this.b = f;
        this.c = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                g7d g7dVar = (g7d) obj4;
                r28 r28Var = (r28) obj;
                ((Integer) obj3).getClass();
                r28Var.getClass();
                p65 p65Var = (p65) ((x12) obj2);
                p65Var.Y(1800313180);
                pj2 pj2Var = ao3.a;
                cud cudVarQ = f76.Q(250, 0, pj2Var, 2);
                float f = this.b;
                upc upcVarA = zu.a(f, cudVarQ, "currentTabWidth", p65Var, 384, 8);
                float f2 = g7dVar.a;
                r28 r28VarP = jfc.p(guc.S(jfc.s(jfc.d(r28Var, 1.0f), z46.j, 2), ((vj3) zu.a((((g7dVar.b + f2) + f2) - f) / 2.0f, f76.Q(250, 0, pj2Var, 2), "indicatorOffset", p65Var, 384, 8).getValue()).a, 0.0f), ((vj3) upcVarA.getValue()).a);
                p65Var.p(false);
                return r28VarP;
            default:
                h7d h7dVar = (h7d) obj4;
                r28 r28Var2 = (r28) obj;
                ((Integer) obj3).getClass();
                r28Var2.getClass();
                p65 p65Var2 = (p65) ((x12) obj2);
                p65Var2.Y(7206020);
                pj2 pj2Var2 = ao3.a;
                cud cudVarQ2 = f76.Q(250, 0, pj2Var2, 2);
                float f3 = this.b;
                upc upcVarA2 = zu.a(f3, cudVarQ2, "currentTabWidth", p65Var2, 384, 8);
                float f4 = h7dVar.a;
                r28 r28VarP2 = jfc.p(guc.S(jfc.s(jfc.d(r28Var2, 1.0f), z46.j, 2), ((vj3) zu.a((((h7dVar.b + f4) + f4) - f3) / 2.0f, f76.Q(250, 0, pj2Var2, 2), "indicatorOffset", p65Var2, 384, 8).getValue()).a, 0.0f), ((vj3) upcVarA2.getValue()).a);
                p65Var2.p(false);
                return r28VarP2;
        }
    }
}
