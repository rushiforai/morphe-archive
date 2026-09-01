package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class gye extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ gi1 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gye(gi1 gi1Var, n92 n92Var) {
        super(n92Var);
        this.d = gi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
