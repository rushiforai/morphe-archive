package n20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f77724t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f77725u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e f77726v;

    /* renamed from: w, reason: collision with root package name */
    public int f77727w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77726v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77725u = obj;
        this.f77727w |= Integer.MIN_VALUE;
        return this.f77726v.f(0, null, this);
    }
}
