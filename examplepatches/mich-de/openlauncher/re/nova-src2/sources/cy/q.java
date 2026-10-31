package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d0 f48522t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f48523u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d0 f48524v;

    /* renamed from: w, reason: collision with root package name */
    public int f48525w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f48524v = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48523u = obj;
        this.f48525w |= Integer.MIN_VALUE;
        return this.f48524v.p(this);
    }
}
