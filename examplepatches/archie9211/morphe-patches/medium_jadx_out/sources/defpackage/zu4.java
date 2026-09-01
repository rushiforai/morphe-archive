package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zu4 extends p92 {
    public String b;
    public String c;
    public SourceParameter d;
    public String e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ ku3 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zu4(ku3 ku3Var, p92 p92Var) {
        super(p92Var);
        this.h = ku3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objF = this.h.F(null, null, null, null, false, this);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
    }
}
