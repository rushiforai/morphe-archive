package xt;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f96302t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f96303u;

    /* renamed from: v, reason: collision with root package name */
    public int f96304v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f96303u = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f96302t = obj;
        this.f96304v |= Integer.MIN_VALUE;
        return this.f96303u.i(null, this);
    }
}
