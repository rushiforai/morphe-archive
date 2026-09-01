package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uk extends p92 {
    public Object b;
    public /* synthetic */ Object c;
    public final /* synthetic */ vk d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk(vk vkVar, n92 n92Var) {
        super(n92Var);
        this.d = vkVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.a(null, this);
    }
}
