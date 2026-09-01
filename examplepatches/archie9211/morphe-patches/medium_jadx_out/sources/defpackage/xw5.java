package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xw5 extends p92 {
    public ova b;
    public Object c;
    public String d;
    public /* synthetic */ Object e;
    public final /* synthetic */ yw5 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xw5(yw5 yw5Var, p92 p92Var) {
        super(p92Var);
        this.f = yw5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.intercept(null, this);
    }
}
