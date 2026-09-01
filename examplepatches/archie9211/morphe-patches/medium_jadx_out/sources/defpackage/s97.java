package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s97 extends p92 {
    public Throwable b;
    public /* synthetic */ Object c;
    public final /* synthetic */ u97 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s97(u97 u97Var, p92 p92Var) {
        super(p92Var);
        this.d = u97Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        x2b x2bVar = u97.w;
        return this.d.f(null, this);
    }
}
