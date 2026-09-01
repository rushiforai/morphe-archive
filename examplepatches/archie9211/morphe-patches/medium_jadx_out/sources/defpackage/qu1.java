package defpackage;

/* JADX INFO: loaded from: classes4.dex */
public final class qu1 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ q9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qu1(q9 q9Var, n92 n92Var) {
        super(n92Var);
        this.d = q9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
