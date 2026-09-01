package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hq4 extends p92 {
    public /* synthetic */ Object b;
    public int c;
    public do4 d;
    public final /* synthetic */ sa e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hq4(sa saVar, n92 n92Var) {
        super(n92Var);
        this.e = saVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.c |= Integer.MIN_VALUE;
        return this.e.a(null, this);
    }
}
