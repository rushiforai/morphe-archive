package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fj5 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ gj5 b;

    public /* synthetic */ fj5(gj5 gj5Var, int i) {
        this.a = i;
        this.b = gj5Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        gj5 gj5Var = this.b;
        switch (i) {
            case 0:
                gyd gydVar = gj5Var.v;
                if (gydVar == null) {
                    e26.b("Font resolution state is not set.");
                    z72.b();
                } else {
                    gydVar.getValue();
                }
                break;
            default:
                gyd gydVar2 = gj5Var.v;
                if (gydVar2 == null) {
                    e26.b("Font resolution state is not set.");
                    z72.b();
                } else {
                    gydVar2.getValue();
                }
                break;
        }
        return null;
    }
}
