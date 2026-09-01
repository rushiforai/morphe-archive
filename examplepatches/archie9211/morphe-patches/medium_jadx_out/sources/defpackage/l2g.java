package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l2g extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ x2g c;
    public int d;
    public String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l2g(x2g x2gVar, p92 p92Var) {
        super(p92Var);
        this.c = x2gVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        return this.c.b(null, this);
    }
}
