package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vt2 extends p92 {
    public Object b;
    public Object c;
    public Object d;
    public rya e;
    public mu2 f;
    public /* synthetic */ Object g;
    public final /* synthetic */ wt2 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vt2(wt2 wt2Var, p92 p92Var) {
        super(p92Var);
        this.h = wt2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.a(null, this);
    }
}
