package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cv extends co6 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cv(int i, Object obj) {
        super(3);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                t99 t99VarS = ((tk7) obj2).s(((f72) obj3).a);
                return ((bl7) obj).q0(t99VarS.a, t99VarS.b, fy3.a, new jr(t99VarS, 6, (x82) obj4));
            case 1:
                ((Number) obj3).intValue();
                p65 p65Var = (p65) ((x12) obj2);
                p65Var.Y(955869654);
                tj4 tj4Var = (tj4) obj4;
                p65Var.p(false);
                return tj4Var;
            default:
                ((Number) obj3).intValue();
                p65 p65Var2 = (p65) ((x12) obj2);
                p65Var2.Y(374375707);
                Object objM = p65Var2.M();
                if (objM == w12.a) {
                    objM = new yb9();
                    p65Var2.j0(objM);
                }
                yb9 yb9Var = (yb9) objM;
                yb9Var.b = (x45) obj4;
                k0b k0bVar = yb9Var.c;
                if (k0bVar != null) {
                    k0bVar.b = null;
                }
                yb9Var.c = null;
                p65Var2.p(false);
                return yb9Var;
        }
    }
}
