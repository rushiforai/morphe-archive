package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ce1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ye1 b;
    public final /* synthetic */ rg1 c;
    public final /* synthetic */ l78 d;

    public /* synthetic */ ce1(ye1 ye1Var, rg1 rg1Var, l78 l78Var, int i) {
        this.a = i;
        this.b = ye1Var;
        this.c = rg1Var;
        this.d = l78Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.d;
        rg1 rg1Var = this.c;
        ye1 ye1Var = this.b;
        switch (i) {
            case 0:
                l78Var.setValue(Boolean.FALSE);
                ye1Var.n(rg1Var);
                break;
            case 1:
                l78Var.setValue(Boolean.FALSE);
                ye1Var.j(rg1Var, false);
                break;
            case 2:
                l78Var.setValue(Boolean.FALSE);
                ye1Var.j(rg1Var, true);
                break;
            default:
                String str = rg1Var.a;
                Object obj = ((bjb) l78Var.getValue()).a;
                br7.v(obj);
                ye1Var.c(str, rg1Var.n, true ^ ((Boolean) obj).booleanValue());
                break;
        }
        return c1eVar;
    }
}
