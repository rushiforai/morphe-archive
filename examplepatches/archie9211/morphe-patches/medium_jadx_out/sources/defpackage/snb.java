package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class snb extends p92 {
    public boolean b;
    public boolean c;
    public boolean d;
    public String e;
    public String f;
    public String g;
    public Object h;
    public /* synthetic */ Object i;
    public final /* synthetic */ tnb j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public snb(tnb tnbVar, p92 p92Var) {
        super(p92Var);
        this.j = tnbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objA = this.j.a(false, false, false, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
