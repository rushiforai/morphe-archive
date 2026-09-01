package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ltc implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ stc d;

    public /* synthetic */ ltc(i52 i52Var, i52 i52Var2, stc stcVar, int i) {
        this.a = i;
        this.b = i52Var;
        this.c = i52Var2;
        this.d = stcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        float f;
        int i = this.a;
        c1e c1eVar = c1e.a;
        stc stcVar = this.d;
        i52 i52Var = this.c;
        i52 i52Var2 = this.b;
        switch (i) {
            case 0:
                h52 h52Var = (h52) obj;
                h52Var.getClass();
                q52 q52Var = h52Var.f;
                q52 q52Var2 = h52Var.d;
                i52 i52Var3 = h52Var.c;
                w52 w52Var = i52Var3.c;
                w52 w52Var2 = i52Var3.e;
                wgd.k(q52Var2, w52Var, 2.0f, 4);
                q52 q52Var3 = h52Var.e;
                v52 v52Var = i52Var2.f;
                int[] iArr = ktc.a;
                int i2 = iArr[stcVar.ordinal()];
                if (i2 == 1) {
                    f = 0.0f;
                } else if (i2 == 2 || i2 == 3) {
                    f = 12.0f;
                } else {
                    ygf.a();
                }
                km4.o(q52Var3, v52Var, f, 4);
                int i3 = iArr[stcVar.ordinal()];
                if (i3 == 1) {
                    wgd.k(q52Var, i52Var.c, 24.0f, 4);
                } else if (i3 == 2) {
                    wgd.k(q52Var, w52Var2, 2.0f, 4);
                } else if (i3 != 3) {
                    ygf.a();
                } else {
                    wgd.k(q52Var, w52Var2, 216.0f, 4);
                }
                h52Var.f(new ze3(null, "spread"));
                h52Var.d(new ze3(null, "wrap"));
                break;
            case 1:
                h52 h52Var2 = (h52) obj;
                h52Var2.getClass();
                km4.o(h52Var2.e, i52Var2.f, 8.0f, 4);
                wgd.k(h52Var2.d, h52Var2.c.c, 2.0f, 4);
                wgd.k(h52Var2.f, i52Var.c, stcVar != stc.L ? 24.0f : 56.0f, 4);
                ka1.A(h52Var2, null, "spread");
                break;
            case 2:
                h52 h52Var3 = (h52) obj;
                h52Var3.getClass();
                q52 q52Var4 = h52Var3.e;
                v52 v52Var2 = i52Var2.f;
                stc stcVar2 = stc.L;
                km4.o(q52Var4, v52Var2, stcVar == stcVar2 ? 16.0f : 12.0f, 4);
                h52.c(h52Var3, h52Var3.c.c, i52Var.c, 2.0f, stcVar == stcVar2 ? 56.0f : 24.0f, 0.0f, 48);
                ka1.A(h52Var3, null, "spread");
                break;
            case 3:
                h52 h52Var4 = (h52) obj;
                h52Var4.getClass();
                km4.o(h52Var4.e, i52Var2.f, 8.0f, 4);
                h52.c(h52Var4, h52Var4.c.c, i52Var.c, 2.0f, stcVar != stc.L ? 24.0f : 56.0f, 0.0f, 48);
                ka1.A(h52Var4, null, "spread");
                break;
            default:
                h52 h52Var5 = (h52) obj;
                h52Var5.getClass();
                km4.o(h52Var5.e, i52Var2.f, 8.0f, 4);
                h52.c(h52Var5, h52Var5.c.c, i52Var.c, 2.0f, stcVar == stc.L ? 128.0f : 96.0f, 0.0f, 48);
                ka1.A(h52Var5, null, "spread");
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ltc(i52 i52Var, stc stcVar, i52 i52Var2, int i) {
        this.a = i;
        this.b = i52Var;
        this.d = stcVar;
        this.c = i52Var2;
    }
}
