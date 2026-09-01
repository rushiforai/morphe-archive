package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s4d extends p92 {
    public enc b;
    public /* synthetic */ Object c;
    public final /* synthetic */ u4d d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s4d(u4d u4dVar, kn0 kn0Var) {
        super(kn0Var);
        this.d = u4dVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.g(0L, null, this);
    }
}
