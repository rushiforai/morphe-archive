package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class rp4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ fp4 d;
    public Object e;
    public do4 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rp4(fp4 fp4Var, n92 n92Var) {
        super(n92Var);
        this.d = fp4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
