package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class cj6 implements m45 {
    public final /* synthetic */ int a;
    public final ej6 b;

    public /* synthetic */ cj6(ej6 ej6Var, int i) {
        this.a = i;
        this.b = ej6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ej6 ej6Var = this.b;
        switch (i) {
            case 0:
                return new dj6(ej6Var);
            default:
                return ej6Var.C();
        }
    }
}
