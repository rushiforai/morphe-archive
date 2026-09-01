package defpackage;

import com.medium.android.data.post.model.ReportRepostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f6b extends p92 {
    public String b;
    public String c;
    public ReportRepostReason d;
    public g08 e;
    public /* synthetic */ Object f;
    public final /* synthetic */ mya g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f6b(mya myaVar, p92 p92Var) {
        super(p92Var);
        this.g = myaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objB = this.g.B(null, null, null, false, null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
