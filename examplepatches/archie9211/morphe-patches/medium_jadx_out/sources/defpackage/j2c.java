package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j2c extends p92 {
    public List b;
    public Object c;
    public /* synthetic */ Object d;
    public final /* synthetic */ l2c e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j2c(l2c l2cVar, p92 p92Var) {
        super(p92Var);
        this.e = l2cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objD = this.e.d(this, null, null);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : new bjb(objD);
    }
}
