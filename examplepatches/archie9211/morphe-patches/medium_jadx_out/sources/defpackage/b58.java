package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b58 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public final /* synthetic */ q9 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b58(q9 q9Var, n92 n92Var) {
        super(n92Var);
        this.d = q9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
