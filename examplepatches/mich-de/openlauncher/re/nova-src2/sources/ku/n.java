package ku;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.payments.core.authentication.threeds2.g f72257t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f72258u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.payments.core.authentication.threeds2.g f72259v;

    /* renamed from: w, reason: collision with root package name */
    public int f72260w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(com.stripe.android.payments.core.authentication.threeds2.g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f72259v = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f72258u = obj;
        this.f72260w |= Integer.MIN_VALUE;
        return this.f72259v.g(this);
    }
}
