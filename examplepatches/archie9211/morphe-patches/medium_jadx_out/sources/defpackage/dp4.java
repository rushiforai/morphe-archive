package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class dp4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ to4 d;
    public fp4 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dp4(to4 to4Var, n92 n92Var) {
        super(n92Var);
        this.d = to4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
