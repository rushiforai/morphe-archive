package defpackage;

/* JADX INFO: loaded from: classes4.dex */
public final class jg7 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ kg7 d;
    public do4 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jg7(kg7 kg7Var, n92 n92Var) {
        super(n92Var);
        this.d = kg7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
