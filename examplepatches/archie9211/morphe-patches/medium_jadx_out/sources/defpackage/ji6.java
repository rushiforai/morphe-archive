package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class ji6 implements m45 {
    public final /* synthetic */ int a;
    public final ni6 b;

    public /* synthetic */ ji6(ni6 ni6Var, int i) {
        this.a = i;
        this.b = ni6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ni6 ni6Var = this.b;
        switch (i) {
            case 0:
                return new mi6(ni6Var);
            default:
                return mo7.F(ni6Var.b);
        }
    }
}
