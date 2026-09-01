package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class yi6 implements m45 {
    public final /* synthetic */ int a;
    public final aj6 b;

    public /* synthetic */ yi6(aj6 aj6Var, int i) {
        this.a = i;
        this.b = aj6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        aj6 aj6Var = this.b;
        switch (i) {
            case 0:
                return new zi6(aj6Var);
            default:
                return aj6Var.C();
        }
    }
}
