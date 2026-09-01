package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg4 extends p92 {
    public zg4 b;
    public Object c;
    public Object d;
    public nh4 e;
    public /* synthetic */ Object f;
    public final /* synthetic */ zg4 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yg4(zg4 zg4Var, p92 p92Var) {
        super(p92Var);
        this.g = zg4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.b(null, this);
    }
}
