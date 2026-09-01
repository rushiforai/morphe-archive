package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hi7 extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ my6 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hi7(my6 my6Var, p92 p92Var) {
        super(p92Var);
        this.d = my6Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objF = this.d.F(null, this);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
    }
}
