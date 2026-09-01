package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qd9 extends p92 {
    public boolean b;
    public String c;
    public String d;
    public String e;
    public SourceParameter f;
    public /* synthetic */ Object g;
    public final /* synthetic */ tl h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qd9(tl tlVar, n92 n92Var) {
        super(n92Var);
        this.h = tlVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        return this.h.p(false, null, null, null, null, null, this);
    }
}
