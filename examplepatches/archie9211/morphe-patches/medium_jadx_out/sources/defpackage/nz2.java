package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nz2 extends p92 {
    public String b;
    public m45 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ pz2 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nz2(pz2 pz2Var, p92 p92Var) {
        super(p92Var);
        this.e = pz2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.b(null, null, null, null, this);
    }
}
