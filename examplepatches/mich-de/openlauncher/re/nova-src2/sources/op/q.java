package op;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class q extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f80573t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f80574u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ r f80575v;

    /* renamed from: w, reason: collision with root package name */
    public int f80576w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80575v = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80574u = obj;
        this.f80576w |= Integer.MIN_VALUE;
        return r.a(this.f80575v, null, this);
    }
}
