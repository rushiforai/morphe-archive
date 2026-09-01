package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gac extends p92 {
    public q62 b;
    public String c;
    public String d;
    public String e;
    public String f;
    public Object g;
    public boolean h;
    public /* synthetic */ Object i;
    public final /* synthetic */ hac j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gac(hac hacVar, p92 p92Var) {
        super(p92Var);
        this.j = hacVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objB = this.j.b(null, null, null, null, null, false, null, null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
