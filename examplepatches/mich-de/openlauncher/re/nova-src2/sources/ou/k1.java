package ou;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.paymentsheet.b1 f80920t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f80921u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.paymentsheet.b1 f80922v;

    /* renamed from: w, reason: collision with root package name */
    public int f80923w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k1(com.stripe.android.paymentsheet.b1 b1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80922v = b1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80921u = obj;
        this.f80923w |= Integer.MIN_VALUE;
        return this.f80922v.A(null, this);
    }
}
