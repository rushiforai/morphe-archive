package fr;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f55665t;

    /* renamed from: u, reason: collision with root package name */
    public Object f55666u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55667v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ r f55668w;

    /* renamed from: x, reason: collision with root package name */
    public int f55669x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55668w = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55667v = obj;
        this.f55669x |= Integer.MIN_VALUE;
        return this.f55668w.b(null, this);
    }
}
