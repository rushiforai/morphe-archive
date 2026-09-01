package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e88 extends p92 {
    public String b;
    public String c;
    public String d;
    public SourceParameter e;
    public String f;
    public /* synthetic */ Object g;
    public final /* synthetic */ f88 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e88(f88 f88Var, p92 p92Var) {
        super(p92Var);
        this.h = f88Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objB = this.h.b(this, null, null, null, null, null);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
