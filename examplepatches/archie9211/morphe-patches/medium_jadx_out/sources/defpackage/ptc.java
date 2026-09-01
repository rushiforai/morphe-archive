package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ptc implements x45 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ i52 b;
    public final /* synthetic */ i52 c;
    public final /* synthetic */ stc d;

    public ptc(boolean z, i52 i52Var, i52 i52Var2, stc stcVar) {
        this.a = z;
        this.b = i52Var;
        this.c = i52Var2;
        this.d = stcVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        ze3 ze3Var;
        ze3 ze3Var2;
        h52 h52Var = (h52) obj;
        h52Var.getClass();
        km4.o(h52Var.e, (this.a ? this.b : this.c).f, 12.0f, 4);
        wgd.k(h52Var.f, h52Var.c.e, 12.0f, 4);
        int[] iArr = otc.a;
        stc stcVar = this.d;
        int i = iArr[stcVar.ordinal()];
        if (i == 1 || i == 2) {
            ze3Var = new ze3(new vj3(as7.h), null);
        } else {
            if (i != 3) {
                ygf.a();
                return null;
            }
            ze3Var = new ze3(new vj3(160.0f), null);
        }
        h52Var.f(ze3Var);
        int i2 = iArr[stcVar.ordinal()];
        if (i2 == 1 || i2 == 2) {
            ze3Var2 = new ze3(new vj3(as7.i), null);
        } else {
            if (i2 != 3) {
                ygf.a();
                return null;
            }
            ze3Var2 = new ze3(new vj3(108.0f), null);
        }
        h52Var.d(ze3Var2);
        return c1e.a;
    }
}
