package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n58 extends p92 {
    public Object b;
    public Object c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ p58 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n58(p58 p58Var, p92 p92Var) {
        super(p92Var);
        this.f = p58Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, this);
    }
}
