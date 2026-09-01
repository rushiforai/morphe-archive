package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ae8 extends p92 {
    public fva b;
    public ne8 c;
    public ne8 d;
    public pkf e;
    public /* synthetic */ Object f;
    public final /* synthetic */ be8 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ae8(be8 be8Var, p92 p92Var) {
        super(p92Var);
        this.g = be8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.i(null, null, null, this);
    }
}
