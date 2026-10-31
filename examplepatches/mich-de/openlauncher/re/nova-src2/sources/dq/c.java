package dq;

import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.ConfirmStripeIntentParams;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.model.RadarOptions;

/* loaded from: classes4.dex */
public abstract class c {
    public abstract ConfirmStripeIntentParams a(PaymentMethodCreateParams paymentMethodCreateParams, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, ClientAttributionMetadata clientAttributionMetadata);

    public abstract ConfirmStripeIntentParams b(String str, PaymentMethod.Type type, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, ft.d dVar, RadarOptions radarOptions, ClientAttributionMetadata clientAttributionMetadata);
}
