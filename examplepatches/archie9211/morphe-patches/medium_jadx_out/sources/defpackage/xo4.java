package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class xo4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ pc1 d;
    public do4 e;
    public Throwable f;
    public int g;
    public int h;
    public long i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xo4(pc1 pc1Var, n92 n92Var) {
        super(n92Var);
        this.d = pc1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
