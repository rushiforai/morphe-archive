package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nm2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ x45 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nm2(int i, n92 n92Var, x45 x45Var) {
        super(2, n92Var);
        this.b = i;
        this.d = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        x45 x45Var = this.d;
        switch (i) {
            case 0:
                nm2 nm2Var = new nm2(0, n92Var, x45Var);
                nm2Var.c = obj;
                return nm2Var;
            case 1:
                nm2 nm2Var2 = new nm2(1, n92Var, x45Var);
                nm2Var2.c = obj;
                return nm2Var2;
            default:
                nm2 nm2Var3 = new nm2(x45Var, n92Var);
                nm2Var3.c = obj;
                return nm2Var3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((nm2) create((w49) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((nm2) create((w49) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                ((nm2) create((b78) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        x45 x45Var = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                w49 w49Var = (w49) this.c;
                w49Var.getClass();
                return x45Var.invoke(w49Var.d());
            case 1:
                br7.v(obj);
                w49 w49Var2 = (w49) this.c;
                w49Var2.getClass();
                return x45Var.invoke(w49Var2.d());
            default:
                br7.v(obj);
                x45Var.invoke((b78) this.c);
                return c1e.a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nm2(x45 x45Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 2;
        this.d = x45Var;
    }
}
