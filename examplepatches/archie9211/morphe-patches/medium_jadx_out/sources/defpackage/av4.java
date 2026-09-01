package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class av4 extends p92 {
    public String b;
    public String c;
    public SourceParameter d;
    public String e;
    public Object f;
    public boolean g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ lod j;
    public int k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av4(lod lodVar, p92 p92Var) {
        super(p92Var);
        this.j = lodVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.k |= Integer.MIN_VALUE;
        Object objA = this.j.a(null, null, null, null, false, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
