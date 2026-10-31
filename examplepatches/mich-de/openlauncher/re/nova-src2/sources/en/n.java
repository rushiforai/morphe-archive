package en;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes3.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f52846t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ o f52847u;

    /* renamed from: v, reason: collision with root package name */
    public int f52848v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(o oVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52847u = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52846t = obj;
        this.f52848v |= Integer.MIN_VALUE;
        return this.f52847u.f(null, this);
    }
}
