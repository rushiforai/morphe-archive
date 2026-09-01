package defpackage;

/* JADX INFO: loaded from: classes4.dex */
public final class iye extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ dac d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iye(dac dacVar, n92 n92Var) {
        super(n92Var);
        this.d = dacVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
