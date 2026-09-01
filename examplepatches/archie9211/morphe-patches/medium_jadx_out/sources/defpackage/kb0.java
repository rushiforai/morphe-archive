package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kb0 extends p92 {
    public rya b;
    public /* synthetic */ Object c;
    public final /* synthetic */ sa d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kb0(sa saVar, n92 n92Var) {
        super(n92Var);
        this.d = saVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.b(null, this);
    }
}
