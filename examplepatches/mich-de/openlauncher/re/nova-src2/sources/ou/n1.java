package ou;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.paymentsheet.b1 f80942t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f80943u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.paymentsheet.b1 f80944v;

    /* renamed from: w, reason: collision with root package name */
    public int f80945w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n1(com.stripe.android.paymentsheet.b1 b1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80944v = b1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80943u = obj;
        this.f80945w |= Integer.MIN_VALUE;
        return com.stripe.android.paymentsheet.b1.u(this.f80944v, this);
    }
}
