package es;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.link.l f52964t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f52965u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.l f52966v;

    /* renamed from: w, reason: collision with root package name */
    public int f52967w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(com.stripe.android.link.l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52966v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52965u = obj;
        this.f52967w |= Integer.MIN_VALUE;
        return com.stripe.android.link.l.f(this.f52966v, this);
    }
}
