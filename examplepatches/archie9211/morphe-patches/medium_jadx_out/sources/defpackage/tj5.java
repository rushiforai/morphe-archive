package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tj5 extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ md5 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tj5(md5 md5Var, p92 p92Var) {
        super(p92Var);
        this.d = md5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objM = this.d.m(null, null, this);
        return objM == tb2.COROUTINE_SUSPENDED ? objM : new bjb(objM);
    }
}
