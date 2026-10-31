package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48499t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d0 f48500u;

    /* renamed from: v, reason: collision with root package name */
    public int f48501v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48500u = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48499t = obj;
        this.f48501v |= Integer.MIN_VALUE;
        return this.f48500u.c(this);
    }
}
