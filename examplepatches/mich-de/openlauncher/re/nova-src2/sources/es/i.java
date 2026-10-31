package es;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.l f52955t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f52956u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.l f52957v;

    /* renamed from: w, reason: collision with root package name */
    public int f52958w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(com.stripe.android.link.l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52957v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52956u = obj;
        this.f52958w |= Integer.MIN_VALUE;
        return this.f52957v.i(this);
    }
}
