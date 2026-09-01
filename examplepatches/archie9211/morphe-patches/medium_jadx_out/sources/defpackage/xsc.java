package defpackage;

/* JADX INFO: loaded from: classes4.dex */
public final class xsc extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public do4 d;
    public int e;
    public final /* synthetic */ eh9 f;
    public oz8 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xsc(eh9 eh9Var, n92 n92Var) {
        super(n92Var);
        this.f = eh9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
