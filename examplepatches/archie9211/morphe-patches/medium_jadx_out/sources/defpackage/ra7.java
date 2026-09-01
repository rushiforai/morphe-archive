package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ra7 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rhd b;

    public /* synthetic */ ra7(rhd rhdVar, int i) {
        this.a = i;
        this.b = rhdVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        rhd rhdVar = this.b;
        switch (i) {
            case 0:
                rhdVar.b(((ip8) obj).a, u3b.i);
                break;
            case 1:
                rb9 rb9Var = (rb9) obj;
                rhdVar.e(mq7.F(rb9Var, false));
                rb9Var.a();
                break;
            default:
                rb9 rb9Var2 = (rb9) obj;
                rhdVar.e(mq7.F(rb9Var2, false));
                rb9Var2.a();
                break;
        }
        return c1eVar;
    }
}
