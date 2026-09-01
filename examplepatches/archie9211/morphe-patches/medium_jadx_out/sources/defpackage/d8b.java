package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d8b implements m45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ k8b b;
    public final /* synthetic */ j8b c;
    public final /* synthetic */ g08 d;
    public final /* synthetic */ m45 e;

    public /* synthetic */ d8b(k8b k8bVar, j8b j8bVar, g08 g08Var, m45 m45Var) {
        this.b = k8bVar;
        this.c = j8bVar;
        this.d = g08Var;
        this.e = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.e;
        g08 g08Var = this.d;
        j8b j8bVar = this.c;
        k8b k8bVar = this.b;
        switch (i) {
            case 0:
                k8bVar.m(j8bVar.b, g08Var.b);
                m45Var.invoke();
                break;
            default:
                k8bVar.b(j8bVar.b, g08Var.b);
                m45Var.invoke();
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ d8b(k8b k8bVar, j8b j8bVar, i8b i8bVar, g08 g08Var, m45 m45Var) {
        this.b = k8bVar;
        this.c = j8bVar;
        this.d = g08Var;
        this.e = m45Var;
    }
}
