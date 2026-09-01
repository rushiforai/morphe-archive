package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x8b extends p92 {
    public String b;
    public g08 c;
    public String d;
    public /* synthetic */ Object e;
    public final /* synthetic */ y8b f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x8b(y8b y8bVar, p92 p92Var) {
        super(p92Var);
        this.f = y8bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, null, null, this);
    }
}
