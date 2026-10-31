package h50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f59317t;

    /* renamed from: u, reason: collision with root package name */
    public int f59318u;

    public y(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59317t = obj;
        this.f59318u |= Integer.MIN_VALUE;
        return b0.a(null, null, null, this);
    }
}
