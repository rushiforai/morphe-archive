package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t03 extends p92 {
    public String b;
    public cfc c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ z03 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t03(z03 z03Var, p92 p92Var) {
        super(p92Var);
        this.f = z03Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, null, this);
    }
}
