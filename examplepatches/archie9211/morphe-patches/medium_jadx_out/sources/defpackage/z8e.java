package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z8e extends p92 {
    public Object b;
    public /* synthetic */ Object c;
    public final /* synthetic */ a9e d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z8e(a9e a9eVar, n92 n92Var) {
        super(n92Var);
        this.d = a9eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
