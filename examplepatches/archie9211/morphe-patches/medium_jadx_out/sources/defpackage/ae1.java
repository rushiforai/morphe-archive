package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ae1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ye1 b;
    public final /* synthetic */ rg1 c;

    public /* synthetic */ ae1(ye1 ye1Var, rg1 rg1Var, int i) {
        this.a = i;
        this.b = ye1Var;
        this.c = rg1Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        rg1 rg1Var = this.c;
        ye1 ye1Var = this.b;
        switch (i) {
            case 0:
                ye1Var.f(rg1Var.a, rg1Var.n);
                break;
            default:
                ye1Var.D(rg1Var.g, rg1Var.a);
                break;
        }
        return c1eVar;
    }
}
