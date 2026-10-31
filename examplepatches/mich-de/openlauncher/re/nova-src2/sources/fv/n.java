package fv;

import com.stripe.android.model.ElementsSessionParams;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class n {
    public static final ElementsSessionParams.SellerDetails a(PaymentSheet$IntentConfiguration paymentSheet$IntentConfiguration) {
        PaymentSheet$IntentConfiguration.IntentBehavior intentBehavior = paymentSheet$IntentConfiguration.f44593f;
        if (!(intentBehavior instanceof PaymentSheet$IntentConfiguration.IntentBehavior.SharedPaymentToken)) {
            if (intentBehavior instanceof PaymentSheet$IntentConfiguration.IntentBehavior.Default) {
                return null;
            }
            throw new NoWhenBranchMatchedException();
        }
        PaymentSheet$IntentConfiguration.SellerDetails sellerDetails = ((PaymentSheet$IntentConfiguration.IntentBehavior.SharedPaymentToken) intentBehavior).f44595a;
        if (sellerDetails == null) {
            return null;
        }
        return new ElementsSessionParams.SellerDetails(sellerDetails.f44605b, sellerDetails.f44606c);
    }
}
