package defpackage;

/* JADX INFO: loaded from: classes.dex */
public final class vq4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ wq4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vq4(wq4 wq4Var, n92 n92Var) {
        super(n92Var);
        this.d = wq4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
