package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class q6c extends p92 {
    public r6c b;
    public do4 c;
    public s6c d;
    public va6 e;
    public /* synthetic */ Object f;
    public final /* synthetic */ r6c g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q6c(r6c r6cVar, n92 n92Var) {
        super(n92Var);
        this.g = r6cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return r6c.m(this.g, null, this);
    }
}
