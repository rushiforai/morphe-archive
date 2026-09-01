package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class kj6 implements m45 {
    public final /* synthetic */ int a;
    public final lj6 b;

    public /* synthetic */ kj6(lj6 lj6Var, int i) {
        this.a = i;
        this.b = lj6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        lj6 lj6Var = this.b;
        switch (i) {
            case 0:
                x4a x4aVarC = lj6Var.D().y().c();
                return x4aVarC == null ? kng.o(lj6Var.D().y(), cd7.e) : x4aVarC;
            default:
                return xz5.H(lj6Var, false);
        }
    }
}
