package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class le7 extends p92 {
    public boolean b;
    public wyb c;
    public /* synthetic */ Object d;
    public final /* synthetic */ me7 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public le7(me7 me7Var, p92 p92Var) {
        super(p92Var);
        this.e = me7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.e(false, this);
    }
}
