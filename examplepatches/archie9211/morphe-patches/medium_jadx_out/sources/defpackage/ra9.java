package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ra9 extends p92 {
    public CharSequence b;
    public Object c;
    public a98 d;
    public long e;
    public /* synthetic */ Object f;
    public final /* synthetic */ va9 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ra9(va9 va9Var, p92 p92Var) {
        super(p92Var);
        this.g = va9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.b(null, 0L, null, this);
    }
}
