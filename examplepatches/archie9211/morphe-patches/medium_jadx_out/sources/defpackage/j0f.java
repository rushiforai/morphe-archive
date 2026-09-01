package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j0f extends p92 {
    public Object b;
    public /* synthetic */ Object c;
    public final /* synthetic */ k0f d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0f(k0f k0fVar, n92 n92Var) {
        super(n92Var);
        this.d = k0fVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
