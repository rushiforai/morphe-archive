package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n1c extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ o1c c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n1c(o1c o1cVar, p92 p92Var) {
        super(p92Var);
        this.c = o1cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        return this.c.b(this);
    }
}
