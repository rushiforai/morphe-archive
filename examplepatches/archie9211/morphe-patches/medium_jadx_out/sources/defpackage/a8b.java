package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class a8b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ k8b b;
    public final /* synthetic */ dr9 c;
    public final /* synthetic */ j8b d;
    public final /* synthetic */ g08 e;
    public final /* synthetic */ m45 f;

    public /* synthetic */ a8b(k8b k8bVar, dr9 dr9Var, j8b j8bVar, g08 g08Var, m45 m45Var, int i) {
        this.a = i;
        this.b = k8bVar;
        this.c = dr9Var;
        this.d = j8bVar;
        this.e = g08Var;
        this.f = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.f;
        g08 g08Var = this.e;
        j8b j8bVar = this.d;
        dr9 dr9Var = this.c;
        k8b k8bVar = this.b;
        switch (i) {
            case 0:
                String str = dr9Var.a;
                String str2 = j8bVar.h;
                if (str2 == null) {
                    str2 = "";
                }
                k8bVar.c(str, str2, g08Var);
                m45Var.invoke();
                break;
            case 1:
                k8bVar.e(dr9Var.a, j8bVar.h != null, g08Var);
                m45Var.invoke();
                break;
            default:
                k8bVar.g(g08Var.b, dr9Var.a, j8bVar.b);
                m45Var.invoke();
                break;
        }
        return c1eVar;
    }
}
