package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cp0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ vjd b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ cp0(vjd vjdVar, x45 x45Var, int i) {
        this.a = i;
        this.b = vjdVar;
        this.c = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        x45 x45Var = this.c;
        vjd vjdVar = this.b;
        switch (i) {
            case 0:
                qjd qjdVar = (qjd) obj;
                if (vjdVar != null) {
                    vjdVar.a.setValue(qjdVar);
                }
                if (x45Var != null) {
                    x45Var.invoke(qjdVar);
                }
                return c1e.a;
            default:
                vjdVar.c.add(x45Var);
                return new am0(vjdVar, 10, x45Var);
        }
    }
}
