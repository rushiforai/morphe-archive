package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jyc implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ boolean c;

    public /* synthetic */ jyc(i52 i52Var, boolean z, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        boolean z = this.c;
        i52 i52Var = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                h52Var.e.a(i52Var.f, 40.0f, 40.0f);
                i52 i52Var2 = h52Var.c;
                h52.c(h52Var, i52Var2.c, i52Var2.e, 24.0f, 24.0f, 0.0f, 48);
                if (z) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                km4.o(h52Var2.e, i52Var.f, 40.0f, 4);
                i52 i52Var3 = h52Var2.c;
                h52.c(h52Var2, i52Var3.c, i52Var3.e, 24.0f, 24.0f, 0.0f, 48);
                if (z) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
