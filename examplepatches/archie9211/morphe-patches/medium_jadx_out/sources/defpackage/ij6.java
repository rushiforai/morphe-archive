package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class ij6 implements m45 {
    public final /* synthetic */ int a;
    public final jj6 b;

    public /* synthetic */ ij6(jj6 jj6Var, int i) {
        this.a = i;
        this.b = jj6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        jj6 jj6Var = this.b;
        switch (i) {
            case 0:
                s4a s4aVarB = jj6Var.D().y().b();
                return s4aVarB == null ? kng.n(jj6Var.D().y(), cd7.e) : s4aVarB;
            default:
                return xz5.H(jj6Var, true);
        }
    }
}
