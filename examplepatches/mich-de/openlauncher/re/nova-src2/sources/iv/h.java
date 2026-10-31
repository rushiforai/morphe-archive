package iv;

import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class h {
    public static final Boolean a(PaymentSelection paymentSelection) {
        Intrinsics.g(paymentSelection, "<this>");
        if (paymentSelection instanceof PaymentSelection.New.Card) {
            PaymentMethodExtraParams paymentMethodExtraParams = ((PaymentSelection.New.Card) paymentSelection).f44818e;
            PaymentMethodExtraParams.Card card = paymentMethodExtraParams instanceof PaymentMethodExtraParams.Card ? (PaymentMethodExtraParams.Card) paymentMethodExtraParams : null;
            if (card != null) {
                return card.f43728b;
            }
            return null;
        }
        if (paymentSelection instanceof PaymentSelection.New.USBankAccount) {
            PaymentMethodExtraParams paymentMethodExtraParams2 = ((PaymentSelection.New.USBankAccount) paymentSelection).f44838i;
            PaymentMethodExtraParams.USBankAccount uSBankAccount = paymentMethodExtraParams2 instanceof PaymentMethodExtraParams.USBankAccount ? (PaymentMethodExtraParams.USBankAccount) paymentMethodExtraParams2 : null;
            if (uSBankAccount != null) {
                return uSBankAccount.f43732b;
            }
        }
        return null;
    }
}
