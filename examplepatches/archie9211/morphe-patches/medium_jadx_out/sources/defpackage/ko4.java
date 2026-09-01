package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class ko4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ yh d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ko4(yh yhVar, n92 n92Var) {
        super(n92Var);
        this.d = yhVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
