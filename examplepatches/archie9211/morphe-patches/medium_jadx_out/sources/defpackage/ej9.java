package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ej9 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ fj9 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ej9(fj9 fj9Var, p92 p92Var) {
        super(p92Var);
        this.c = fj9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objM = this.c.m(0, this);
        return objM == tb2.COROUTINE_SUSPENDED ? objM : new bjb(objM);
    }
}
