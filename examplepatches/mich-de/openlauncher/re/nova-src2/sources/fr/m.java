package fr;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f55659t;

    /* renamed from: u, reason: collision with root package name */
    public g f55660u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f55661v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ r f55662w;

    /* renamed from: x, reason: collision with root package name */
    public int f55663x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55662w = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55661v = obj;
        this.f55663x |= Integer.MIN_VALUE;
        return this.f55662w.a(null, this);
    }
}
