package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class o8b implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l8b b;
    public final /* synthetic */ String c;
    public final /* synthetic */ g08 d;

    public /* synthetic */ o8b(l8b l8bVar, String str, g08 g08Var, int i) {
        this.a = i;
        this.b = l8bVar;
        this.c = str;
        this.d = g08Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        g08 g08Var = this.d;
        String str = this.c;
        l8b l8bVar = this.b;
        switch (i) {
            case 0:
                l8bVar.f(str, g08Var);
                break;
            case 1:
                l8bVar.d(str, g08Var);
                break;
            case 2:
                l8bVar.g(str, g08Var);
                break;
            default:
                l8bVar.b(str, g08Var);
                break;
        }
        return c1eVar;
    }
}
