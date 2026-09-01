package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jva extends p92 {
    public vbb b;
    public rx5 c;
    public z46 d;
    public ew5 e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ kva h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jva(kva kvaVar, p92 p92Var) {
        super(p92Var);
        this.h = kvaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.b(null, 0, this);
    }
}
