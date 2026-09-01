package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class ht5 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ a9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ht5(a9 a9Var, n92 n92Var) {
        super(n92Var);
        this.d = a9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
