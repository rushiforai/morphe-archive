package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r8g extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ h9g c;
    public int d;
    public ujf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r8g(h9g h9gVar, p92 p92Var) {
        super(p92Var);
        this.c = h9gVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        return this.c.d(null, this);
    }
}
