package m20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public d f75821t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75822u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d f75823v;

    /* renamed from: w, reason: collision with root package name */
    public int f75824w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(d dVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75823v = dVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75822u = obj;
        this.f75824w |= Integer.MIN_VALUE;
        return this.f75823v.f(0, null, this);
    }
}
