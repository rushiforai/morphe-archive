package ys;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e1 f97445t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f97446u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ e1 f97447v;

    /* renamed from: w, reason: collision with root package name */
    public int f97448w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d1(e1 e1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f97447v = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f97446u = obj;
        this.f97448w |= Integer.MIN_VALUE;
        return this.f97447v.k(null, this);
    }
}
