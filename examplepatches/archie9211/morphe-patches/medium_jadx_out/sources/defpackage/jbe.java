package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jbe extends p92 {
    public String b;
    public String c;
    public String d;
    public SourceParameter e;
    public /* synthetic */ Object f;
    public final /* synthetic */ kbe g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jbe(kbe kbeVar, n92 n92Var) {
        super(n92Var);
        this.g = kbeVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.i(this, null, null, null, null);
    }
}
