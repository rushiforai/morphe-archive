package o20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public br.a f79434t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f79435u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f79436v;

    /* renamed from: w, reason: collision with root package name */
    public int f79437w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f79436v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79435u = obj;
        this.f79437w |= Integer.MIN_VALUE;
        return this.f79436v.d(null, this);
    }
}
