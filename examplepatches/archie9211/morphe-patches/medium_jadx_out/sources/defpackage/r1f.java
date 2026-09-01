package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class r1f extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ eh9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r1f(eh9 eh9Var, n92 n92Var) {
        super(n92Var);
        this.d = eh9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
