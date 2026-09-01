package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o9f extends p92 {
    public r0d b;
    public r0d c;
    public /* synthetic */ Object d;
    public final /* synthetic */ r0d e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o9f(r0d r0dVar, p92 p92Var) {
        super(p92Var);
        this.e = r0dVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return r0d.d(this.e, this);
    }
}
