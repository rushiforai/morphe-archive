package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c4e extends p92 {
    public j55 b;
    public m45 c;
    public float d;
    public /* synthetic */ Object e;
    public final /* synthetic */ d4e f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c4e(d4e d4eVar, p92 p92Var) {
        super(p92Var);
        this.f = d4eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.a(null, null, this);
    }
}
