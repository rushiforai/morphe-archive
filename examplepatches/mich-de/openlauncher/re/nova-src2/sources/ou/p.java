package ou;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f80951t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f80952u;

    /* renamed from: v, reason: collision with root package name */
    public int f80953v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80952u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80951t = obj;
        this.f80953v |= Integer.MIN_VALUE;
        return this.f80952u.a(null, this);
    }
}
