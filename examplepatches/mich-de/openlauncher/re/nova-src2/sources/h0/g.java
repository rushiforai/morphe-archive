package h0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f58737t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f58738u;

    /* renamed from: v, reason: collision with root package name */
    public int f58739v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f58738u = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f58737t = obj;
        this.f58739v |= Integer.MIN_VALUE;
        return h.b(this.f58738u, null, 0.0f, 0.0f, null, this);
    }
}
