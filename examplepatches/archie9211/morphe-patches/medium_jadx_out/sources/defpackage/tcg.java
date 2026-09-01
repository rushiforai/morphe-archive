package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tcg extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ wcg c;
    public int d;
    public xbg e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tcg(wcg wcgVar, n92 n92Var) {
        super(n92Var);
        this.c = wcgVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        return this.c.a(null, this);
    }
}
