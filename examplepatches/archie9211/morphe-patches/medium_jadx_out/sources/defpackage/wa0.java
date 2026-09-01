package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class wa0 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;

    public /* synthetic */ wa0(int i, x45 x45Var) {
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                ((Integer) obj).intValue();
                rv2 rv2Var = (rv2) obj2;
                rv2Var.getClass();
                x45Var.invoke(rv2Var);
                break;
            default:
                x45Var.invoke(obj);
                break;
        }
        return c1eVar;
    }
}
