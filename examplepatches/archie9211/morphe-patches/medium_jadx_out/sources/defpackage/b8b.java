package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b8b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ k8b b;
    public final /* synthetic */ dr9 c;
    public final /* synthetic */ g08 d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ b8b(k8b k8bVar, dr9 dr9Var, g08 g08Var, m45 m45Var, int i) {
        this.a = i;
        this.b = k8bVar;
        this.c = dr9Var;
        this.d = g08Var;
        this.e = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.e;
        g08 g08Var = this.d;
        dr9 dr9Var = this.c;
        k8b k8bVar = this.b;
        switch (i) {
            case 0:
                k8bVar.n(dr9Var.a, g08Var);
                m45Var.invoke();
                break;
            case 1:
                k8bVar.h(dr9Var.a, g08Var);
                m45Var.invoke();
                break;
            default:
                k8bVar.i(dr9Var.a, g08Var.b);
                m45Var.invoke();
                break;
        }
        return c1eVar;
    }
}
