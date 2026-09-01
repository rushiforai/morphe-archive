package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class iu3 extends p92 {
    public String b;
    public String c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ tc0 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iu3(tc0 tc0Var, n92 n92Var) {
        super(n92Var);
        this.g = tc0Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.b(null, this);
    }
}
