package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k f86604t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86605u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ k f86606v;

    /* renamed from: w, reason: collision with root package name */
    public int f86607w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86606v = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86605u = obj;
        this.f86607w |= Integer.MIN_VALUE;
        return this.f86606v.c(null, this);
    }
}
