package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tc9 extends p92 {
    public String b;
    public x45 c;
    public o42 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ uc9 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tc9(uc9 uc9Var, p92 p92Var) {
        super(p92Var);
        this.f = uc9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.c(null, null, this);
    }
}
