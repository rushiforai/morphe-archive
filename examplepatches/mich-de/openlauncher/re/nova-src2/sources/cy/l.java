package cy;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f48503t;

    /* renamed from: u, reason: collision with root package name */
    public int f48504u;

    public l(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48503t = obj;
        this.f48504u |= Integer.MIN_VALUE;
        return d0.d(this);
    }
}
