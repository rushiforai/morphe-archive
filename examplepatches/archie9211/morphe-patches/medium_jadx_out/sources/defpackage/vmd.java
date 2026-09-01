package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vmd extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public boolean g;
    public /* synthetic */ Object h;
    public final /* synthetic */ f88 i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vmd(f88 f88Var, p92 p92Var) {
        super(p92Var);
        this.i = f88Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        Object objA = this.i.a(this, null, null, null, null, null, false);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
