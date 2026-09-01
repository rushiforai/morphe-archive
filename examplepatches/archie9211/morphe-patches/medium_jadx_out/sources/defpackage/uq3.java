package defpackage;

import com.medium.proto.model.PlaybackModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uq3 extends p92 {
    public br3 b;
    public PlaybackModel c;
    public /* synthetic */ Object d;
    public final /* synthetic */ xq3 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uq3(xq3 xq3Var, p92 p92Var) {
        super(p92Var);
        this.e = xq3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objI = this.e.i(this);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : new bjb(objI);
    }
}
