package vt;

import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.coroutines.Continuation;

/* loaded from: classes4.dex */
public interface m0 {
    Object a(StripeIntent stripeIntent, PaymentMethodConfirmationOption.New r22, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation);

    Object b(StripeIntent stripeIntent, PaymentMethodConfirmationOption.Saved saved, ConfirmPaymentIntentParams.Shipping shipping, Continuation continuation);
}
