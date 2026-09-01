package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class aa6 implements m45 {
    public final ku3 a;
    public final swd b;
    public final v96 c;
    public final zvd d;
    public final s0b e;

    public aa6(ku3 ku3Var, swd swdVar, v96 v96Var, zvd zvdVar, s0b s0bVar) {
        this.a = ku3Var;
        this.b = swdVar;
        this.c = v96Var;
        this.d = zvdVar;
        this.e = s0bVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        mya myaVar = (mya) this.a.d;
        co1 co1VarA = this.d.a();
        return myaVar.t(this.b, v96.a(v96.a(this.c, null, false, null, co1VarA != null ? co1VarA.T() : null, 31), null, this.e.d(), null, null, 59));
    }
}
