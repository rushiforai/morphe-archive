package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {
    public final /* synthetic */ d0 A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public d0 f93020t;

    /* renamed from: u, reason: collision with root package name */
    public PaymentSheet$IntentConfiguration f93021u;

    /* renamed from: v, reason: collision with root package name */
    public StripeIntent f93022v;

    /* renamed from: w, reason: collision with root package name */
    public PaymentMethodConfirmationOption.New f93023w;

    /* renamed from: x, reason: collision with root package name */
    public ConfirmPaymentIntentParams.Shipping f93024x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f93025y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f93026z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.A = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93026z = obj;
        this.B |= Integer.MIN_VALUE;
        return this.A.d(null, null, null, null, false, this);
    }
}
