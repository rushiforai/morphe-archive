package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class c5b extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ hha d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c5b(hha hhaVar, p92 p92Var) {
        super(p92Var);
        this.d = hhaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objS = this.d.s(null, this);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : new bjb(objS);
    }
}
