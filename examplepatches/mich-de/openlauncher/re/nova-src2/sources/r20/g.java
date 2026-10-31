package r20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f85357t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ l f85358u;

    /* renamed from: v, reason: collision with root package name */
    public int f85359v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85358u = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85357t = obj;
        this.f85359v |= Integer.MIN_VALUE;
        return l.l(this.f85358u, this);
    }
}
