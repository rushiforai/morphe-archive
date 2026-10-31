package fv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56109t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i f56110u;

    /* renamed from: v, reason: collision with root package name */
    public int f56111v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(i iVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56110u = iVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56109t = obj;
        this.f56111v |= Integer.MIN_VALUE;
        return this.f56110u.d(null, this);
    }
}
