package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class py0 extends p92 {
    public zwa b;
    public Object[] c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ qy0 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public py0(qy0 qy0Var, p92 p92Var) {
        super(p92Var);
        this.g = qy0Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.a(null, this);
    }
}
