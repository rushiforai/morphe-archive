package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gt0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ upc c;

    public /* synthetic */ gt0(i52 i52Var, upc upcVar, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = upcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        upc upcVar = this.c;
        i52 i52Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                km4.o(h52Var.g, i52Var.f, 0.0f, 6);
                wgd.k(h52Var.f, h52Var.c.e, 24.0f, 4);
                if (((Boolean) upcVar.getValue()).booleanValue()) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                km4.o(h52Var2.g, i52Var.f, 0.0f, 6);
                wgd.k(h52Var2.f, h52Var2.c.e, 24.0f, 4);
                if (((Boolean) upcVar.getValue()).booleanValue()) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
