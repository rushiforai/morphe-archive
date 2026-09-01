package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class cs implements x45 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ Object d;

    public /* synthetic */ cs(lp8 lp8Var, boolean z, boolean z2) {
        this.d = lp8Var;
        this.b = z;
        this.c = z2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.d;
        boolean z = this.c;
        boolean z2 = this.b;
        switch (i) {
            case 0:
                jyb jybVar = (jyb) obj;
                long jA = ((lp8) obj2).a();
                jybVar.d(ixb.a, new hxb(z2 ? ai5.SelectionStart : ai5.SelectionEnd, jA, z ? gxb.Left : gxb.Right, (9223372034707292159L & jA) != 9205357640488583168L));
                break;
            default:
                String str = (String) obj2;
                ae6 ae6Var = (ae6) obj;
                ae6Var.getClass();
                ae6Var.t0("extensions");
                ae6Var.i();
                if (z2) {
                    ae6Var.t0("persistedQuery");
                    ae6Var.i();
                    ae6Var.t0("version").u(1);
                    ae6Var.t0("sha256Hash").E(str);
                    ae6Var.e();
                }
                if (z) {
                    ae6Var.t0("clientLibrary");
                    ae6Var.i();
                    ae6Var.t0("name").E("apollo-kotlin");
                    ae6Var.t0("version").E("4.4.1");
                    ae6Var.e();
                }
                ae6Var.e();
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ cs(String str, boolean z, boolean z2) {
        this.b = z;
        this.c = z2;
        this.d = str;
    }
}
