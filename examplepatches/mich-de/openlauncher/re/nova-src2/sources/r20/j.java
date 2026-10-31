package r20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f85374t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85375u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f85376v;

    /* renamed from: w, reason: collision with root package name */
    public int f85377w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85376v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85375u = obj;
        this.f85377w |= Integer.MIN_VALUE;
        return this.f85376v.f(0, null, this);
    }
}
