package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class vnc extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ u50 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vnc(u50 u50Var, n92 n92Var) {
        super(n92Var);
        this.d = u50Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
