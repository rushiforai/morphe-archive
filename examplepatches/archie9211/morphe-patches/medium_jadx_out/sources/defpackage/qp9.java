package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qp9 extends p92 {
    public o33 b;
    public ra5 c;
    public long d;
    public long e;
    public /* synthetic */ Object f;
    public final /* synthetic */ wp9 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qp9(wp9 wp9Var, p92 p92Var) {
        super(p92Var);
        this.g = wp9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.e(null, this);
    }
}
