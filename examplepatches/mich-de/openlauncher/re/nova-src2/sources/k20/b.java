package k20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c f70882t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f70883u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f70884v;

    /* renamed from: w, reason: collision with root package name */
    public int f70885w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f70884v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f70883u = obj;
        this.f70885w |= Integer.MIN_VALUE;
        return this.f70884v.f(0, null, this);
    }
}
