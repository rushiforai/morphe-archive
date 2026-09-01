package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e42 extends p92 {
    public boolean b;
    public Object c;
    public Object d;
    public rya e;
    public ib2 f;
    public rya g;
    public tz7 h;
    public /* synthetic */ Object i;
    public final /* synthetic */ f42 j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e42(f42 f42Var, p92 p92Var) {
        super(p92Var);
        this.j = f42Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        return this.j.G(false, null, this);
    }
}
