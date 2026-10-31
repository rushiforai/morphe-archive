package r10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f85119t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d f85120u;

    /* renamed from: v, reason: collision with root package name */
    public int f85121v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85120u = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85119t = obj;
        this.f85121v |= Integer.MIN_VALUE;
        return this.f85120u.a(this);
    }
}
