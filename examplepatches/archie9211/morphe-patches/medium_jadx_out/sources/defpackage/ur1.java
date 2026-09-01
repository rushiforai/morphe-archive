package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ur1 extends p92 {
    public String b;
    public SourceParameter c;
    public /* synthetic */ Object d;
    public final /* synthetic */ n0c e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ur1(n0c n0cVar, n92 n92Var) {
        super(n92Var);
        this.e = n0cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.I(this, null, null, null, null);
    }
}
