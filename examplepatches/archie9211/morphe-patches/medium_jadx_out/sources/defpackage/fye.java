package defpackage;

/* JADX INFO: loaded from: classes4.dex */
public final class fye extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public do4 d;
    public int e;
    public final /* synthetic */ moe f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fye(moe moeVar, n92 n92Var) {
        super(n92Var);
        this.f = moeVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
