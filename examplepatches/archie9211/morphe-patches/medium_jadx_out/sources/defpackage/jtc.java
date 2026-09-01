package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jtc implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ stc d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ i52 f;

    public jtc(boolean z, i52 i52Var, i52 i52Var2, stc stcVar, i52 i52Var3) {
        this.a = 2;
        this.b = z;
        this.c = i52Var;
        this.f = i52Var2;
        this.d = stcVar;
        this.e = i52Var3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        i52 i52Var = this.f;
        i52 i52Var2 = this.c;
        boolean z = this.b;
        stc stcVar = this.d;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                wgd.k(h52Var.d, h52Var.c.c, 0.0f, 6);
                km4.o(h52Var.e, z ? i52Var2.f : stcVar == stc.M ? (v52) obj2 : i52Var.f, 0.0f, 6);
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                wgd.k(h52Var2.d, h52Var2.c.c, 0.0f, 6);
                km4.o(h52Var2.e, z ? i52Var2.f : stcVar == stc.M ? (v52) obj2 : i52Var.f, 16.0f, 4);
                break;
            default:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                km4.o(h52Var3.e, z ? i52Var2.f : i52Var.f, stcVar == stc.S ? 12.0f : 16.0f, 4);
                wgd.k(h52Var3.d, h52Var3.c.c, 2.0f, 4);
                wgd.k(h52Var3.f, ((i52) obj2).c, stcVar == stc.L ? 56.0f : 24.0f, 4);
                ka1.A(h52Var3, null, "spread");
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jtc(boolean z, i52 i52Var, stc stcVar, v52 v52Var, i52 i52Var2, int i) {
        this.a = i;
        this.b = z;
        this.c = i52Var;
        this.d = stcVar;
        this.e = v52Var;
        this.f = i52Var2;
    }
}
