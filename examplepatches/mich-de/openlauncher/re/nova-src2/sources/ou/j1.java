package ou;

import com.stripe.android.paymentsheet.state.PaymentSheetState$Full;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.paymentsheet.b1 f80911t;

    /* renamed from: u, reason: collision with root package name */
    public PaymentSheetState$Full f80912u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f80913v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.paymentsheet.b1 f80914w;

    /* renamed from: x, reason: collision with root package name */
    public int f80915x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j1(com.stripe.android.paymentsheet.b1 b1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f80914w = b1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f80913v = obj;
        this.f80915x |= Integer.MIN_VALUE;
        return this.f80914w.y(null, this);
    }
}
