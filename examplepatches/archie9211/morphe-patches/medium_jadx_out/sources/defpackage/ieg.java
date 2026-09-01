package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ieg extends p92 {
    public a98 b;
    public /* synthetic */ Object c;
    public final /* synthetic */ d2f d;
    public int e;
    public String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ieg(d2f d2fVar, p92 p92Var) {
        super(p92Var);
        this.d = d2fVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.k0(null, this);
    }
}
