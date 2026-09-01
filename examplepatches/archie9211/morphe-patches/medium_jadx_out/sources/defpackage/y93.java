package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class y93 implements m45 {
    public final /* synthetic */ int a;
    public final m45 b;

    public /* synthetic */ y93(int i, m45 m45Var) {
        this.a = i;
        this.b = m45Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                return bu1.q1((Iterable) m45Var.invoke());
            default:
                ev7 ev7Var = (ev7) m45Var.invoke();
                return ev7Var instanceof tv6 ? ((tv6) ev7Var).h() : ev7Var;
        }
    }
}
