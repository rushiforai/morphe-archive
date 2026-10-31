package w70;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes5.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Throwable f94044t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f94045u;

    /* renamed from: v, reason: collision with root package name */
    public int f94046v;

    public v(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94045u = obj;
        this.f94046v |= Integer.MIN_VALUE;
        return a0.a(null, null, null, this);
    }
}
