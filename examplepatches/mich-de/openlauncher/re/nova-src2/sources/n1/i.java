package n1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f77650t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f77651u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n f77652v;

    /* renamed from: w, reason: collision with root package name */
    public int f77653w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77652v = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77651u = obj;
        this.f77653w |= Integer.MIN_VALUE;
        return this.f77652v.B(this);
    }
}
