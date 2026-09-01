package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class y0f extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ k64 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0f(k64 k64Var, n92 n92Var) {
        super(n92Var);
        this.d = k64Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
