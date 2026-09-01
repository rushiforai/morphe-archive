package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x03 extends p92 {
    public sw5 b;
    public cfc c;
    public boolean d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ z03 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x03(z03 z03Var, p92 p92Var) {
        super(p92Var);
        this.h = z03Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.d(null, false, this);
    }
}
