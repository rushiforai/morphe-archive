package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nd9 extends p92 {
    public String b;
    public String c;
    public SourceParameter d;
    public /* synthetic */ Object e;
    public final /* synthetic */ tl f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nd9(tl tlVar, p92 p92Var) {
        super(p92Var);
        this.f = tlVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.e(null, null, null, this);
    }
}
