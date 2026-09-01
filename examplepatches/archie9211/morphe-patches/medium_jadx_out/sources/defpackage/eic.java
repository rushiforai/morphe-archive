package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eic extends p92 {
    public x45 b;
    public /* synthetic */ Object c;
    public final /* synthetic */ iic d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public eic(iic iicVar, p92 p92Var) {
        super(p92Var);
        this.d = iicVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.b(null, 0.0f, null, this);
    }
}
