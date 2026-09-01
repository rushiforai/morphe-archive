package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class lqc implements m45 {
    public final /* synthetic */ int a;
    public final mqc b;

    public /* synthetic */ lqc(mqc mqcVar, int i) {
        this.a = i;
        this.b = mqcVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        mqc mqcVar = this.b;
        switch (i) {
            case 0:
                s93 s93Var = mqcVar.b;
                return d46.R(kng.q(s93Var), kng.r(s93Var));
            default:
                return mqcVar.c ? d46.S(kng.p(mqcVar.b)) : ey3.a;
        }
    }
}
