package lw;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f75136t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f75137u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f75138v;

    /* renamed from: w, reason: collision with root package name */
    public int f75139w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75138v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75137u = obj;
        this.f75139w |= Integer.MIN_VALUE;
        return this.f75138v.b(this);
    }
}
