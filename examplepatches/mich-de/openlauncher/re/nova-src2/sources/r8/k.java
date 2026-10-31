package r8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f85630t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m f85631u;

    /* renamed from: v, reason: collision with root package name */
    public int f85632v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85631u = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85630t = obj;
        this.f85632v |= Integer.MIN_VALUE;
        return this.f85631u.b(null, this);
    }
}
