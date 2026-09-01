package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tic implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ x45 c;

    public /* synthetic */ tic(x45 x45Var, x45 x45Var2, int i) {
        this.a = i;
        this.b = x45Var;
        this.c = x45Var2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.c;
        x45 x45Var2 = this.b;
        switch (i) {
            case 0:
                x45Var2.invoke(obj);
                x45Var.invoke(obj);
                break;
            default:
                x45Var2.invoke(obj);
                x45Var.invoke(obj);
                break;
        }
        return c1eVar;
    }
}
