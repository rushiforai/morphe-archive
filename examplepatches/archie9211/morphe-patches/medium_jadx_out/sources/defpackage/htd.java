package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class htd extends p92 {
    public mc9 b;
    public String c;
    public String[] d;
    public int e;
    public int f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ mtd i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public htd(mtd mtdVar, p92 p92Var) {
        super(p92Var);
        this.i = mtdVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        return this.i.f(null, 0, this);
    }
}
