package h0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58734t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f58735u;

    /* renamed from: v, reason: collision with root package name */
    public int f58736v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58735u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58734t = obj;
        this.f58736v |= Integer.MIN_VALUE;
        return this.f58735u.d(null, 0.0f, null, this);
    }
}
