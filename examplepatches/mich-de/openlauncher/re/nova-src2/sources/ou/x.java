package ou;

import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;

/* loaded from: classes4.dex */
public interface x {
    PaymentMethodExtraParams a();

    PaymentSelection b();

    PaymentMethodOptionsParams c();

    String d();

    PaymentMethodCreateParams e();

    String getType();
}
