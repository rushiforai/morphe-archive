package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t97 extends p92 {
    public Object b;
    public Object c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ u97 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t97(u97 u97Var, p92 p92Var) {
        super(p92Var);
        this.f = u97Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        x2b x2bVar = u97.w;
        return this.f.g(this);
    }
}
