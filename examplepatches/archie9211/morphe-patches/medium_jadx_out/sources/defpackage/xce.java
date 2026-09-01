package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xce extends p92 {
    public Object b;
    public ide c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ yce g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xce(yce yceVar, n92 n92Var) {
        super(n92Var);
        this.g = yceVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.a(null, this);
    }
}
