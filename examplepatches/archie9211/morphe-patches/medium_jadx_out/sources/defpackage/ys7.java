package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ys7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Integer b;

    public /* synthetic */ ys7(Integer num, int i) {
        this.a = i;
        this.b = num;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pwe pweVar = pwe.d;
        pwe pweVar2 = pwe.b;
        Integer num = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.f;
                i52 i52Var = h52Var.c;
                wgd.k(q52Var, i52Var.e, 0.0f, 6);
                km4.o(h52Var.e, i52Var.d, 0.0f, 6);
                if (num != null) {
                    pweVar = pweVar2;
                }
                h52Var.e(pweVar);
                break;
            default:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                q52 q52Var2 = h52Var2.f;
                i52 i52Var2 = h52Var2.c;
                wgd.k(q52Var2, i52Var2.e, 0.0f, 6);
                km4.o(h52Var2.e, i52Var2.d, 0.0f, 6);
                if (num != null) {
                    pweVar = pweVar2;
                }
                h52Var2.e(pweVar);
                break;
        }
        return c1eVar;
    }
}
