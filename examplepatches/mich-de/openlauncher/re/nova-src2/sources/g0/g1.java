package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56542t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h1 f56543u;

    /* renamed from: v, reason: collision with root package name */
    public int f56544v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(h1 h1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56543u = h1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56542t = obj;
        this.f56544v |= Integer.MIN_VALUE;
        return this.f56543u.tryAwaitRelease(this);
    }
}
