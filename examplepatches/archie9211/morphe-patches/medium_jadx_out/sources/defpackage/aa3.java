package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class aa3 implements m45 {
    public final /* synthetic */ int a;
    public final ca3 b;
    public final da3 c;

    public /* synthetic */ aa3(ca3 ca3Var, da3 da3Var, int i) {
        this.a = i;
        this.b = ca3Var;
        this.c = da3Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        da3 da3Var = this.c;
        ca3 ca3Var = this.b;
        switch (i) {
            case 0:
                return qo7.v(ca3Var.a.keySet(), da3Var.o());
            default:
                return qo7.v(ca3Var.b.keySet(), da3Var.p());
        }
    }
}
