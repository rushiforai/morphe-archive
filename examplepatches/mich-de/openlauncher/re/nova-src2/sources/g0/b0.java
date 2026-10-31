package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56465t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g0 f56466u;

    /* renamed from: v, reason: collision with root package name */
    public int f56467v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(g0 g0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56466u = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56465t = obj;
        this.f56467v |= Integer.MIN_VALUE;
        return g0.B(this.f56466u, this);
    }
}
