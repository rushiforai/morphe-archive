package kq;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.challenge.passive.c f72122t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f72123u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.challenge.passive.c f72124v;

    /* renamed from: w, reason: collision with root package name */
    public int f72125w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(com.stripe.android.challenge.passive.c cVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f72124v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f72123u = obj;
        this.f72125w |= Integer.MIN_VALUE;
        return this.f72124v.e(null, this);
    }
}
