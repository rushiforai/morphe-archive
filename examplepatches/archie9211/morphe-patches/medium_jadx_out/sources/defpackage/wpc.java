package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class wpc extends p92 {
    public do4 b;
    public ypc c;
    public va6 d;
    public Object e;
    public Object f;
    public /* synthetic */ Object g;
    public final /* synthetic */ xpc h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wpc(xpc xpcVar, n92 n92Var) {
        super(n92Var);
        this.h = xpcVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.b(null, this);
    }
}
