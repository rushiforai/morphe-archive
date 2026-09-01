package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w0e extends p92 {
    public String b;
    public String c;
    public SourceParameter d;
    public String e;
    public Object f;
    public boolean g;
    public /* synthetic */ Object h;
    public final /* synthetic */ o2b i;
    public int j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w0e(o2b o2bVar, p92 p92Var) {
        super(p92Var);
        this.i = o2bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.h = obj;
        this.j |= Integer.MIN_VALUE;
        Object objW = this.i.w(null, null, null, null, false, this);
        return objW == tb2.COROUTINE_SUSPENDED ? objW : new bjb(objW);
    }
}
