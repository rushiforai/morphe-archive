package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tge implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;

    public /* synthetic */ tge(l78 l78Var, int i) {
        this.a = i;
        this.b = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.b;
        switch (i) {
            case 0:
                qjd qjdVar = (qjd) obj;
                qjdVar.getClass();
                long j = qjdVar.a.b.a.b;
                if (!qkd.a(((qkd) l78Var.getValue()).a, j)) {
                    l78Var.setValue(new qkd(j));
                }
                break;
            case 1:
                Boolean bool = (Boolean) obj;
                bool.booleanValue();
                l78Var.setValue(bool);
                break;
            default:
                qjd qjdVar2 = (qjd) obj;
                qjdVar2.getClass();
                long j2 = qjdVar2.a.b.a.b;
                if (!qkd.a(((qkd) l78Var.getValue()).a, j2)) {
                    l78Var.setValue(new qkd(j2));
                }
                break;
        }
        return c1eVar;
    }
}
