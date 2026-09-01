package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dhc implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ jhc b;

    public /* synthetic */ dhc(jhc jhcVar, int i) {
        this.a = i;
        this.b = jhcVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        jhc jhcVar = this.b;
        switch (i) {
            case 0:
                x51 x51Var = jhcVar.d;
                if (x51Var.r() instanceof ai8) {
                    x51Var.resumeWith(bic.Dismissed);
                }
                return Boolean.TRUE;
            default:
                x51 x51Var2 = jhcVar.d;
                if (x51Var2.r() instanceof ai8) {
                    x51Var2.resumeWith(bic.ActionPerformed);
                }
                return c1e.a;
        }
    }
}
