package defpackage;

/* JADX INFO: loaded from: classes5.dex */
public final class bp4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ zz d;
    public Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bp4(zz zzVar, n92 n92Var) {
        super(n92Var);
        this.d = zzVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
