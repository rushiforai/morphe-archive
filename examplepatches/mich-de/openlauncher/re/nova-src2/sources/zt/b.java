package zt;

import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class b {
    public static final String a(PaymentElementLoader$InitializationMode paymentElementLoader$InitializationMode) {
        PaymentSheet$IntentConfiguration.SellerDetails sellerDetails;
        Intrinsics.g(paymentElementLoader$InitializationMode, "<this>");
        PaymentElementLoader$InitializationMode.DeferredIntent deferredIntent = paymentElementLoader$InitializationMode instanceof PaymentElementLoader$InitializationMode.DeferredIntent ? (PaymentElementLoader$InitializationMode.DeferredIntent) paymentElementLoader$InitializationMode : null;
        if (deferredIntent == null) {
            return null;
        }
        PaymentSheet$IntentConfiguration.IntentBehavior intentBehavior = deferredIntent.f44968a.f44593f;
        PaymentSheet$IntentConfiguration.IntentBehavior.SharedPaymentToken sharedPaymentToken = intentBehavior instanceof PaymentSheet$IntentConfiguration.IntentBehavior.SharedPaymentToken ? (PaymentSheet$IntentConfiguration.IntentBehavior.SharedPaymentToken) intentBehavior : null;
        if (sharedPaymentToken == null || (sellerDetails = sharedPaymentToken.f44595a) == null) {
            return null;
        }
        return sellerDetails.f44604a;
    }
}
