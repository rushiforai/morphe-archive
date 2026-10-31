package com.stripe.android.model;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodUpdateParams;
import java.util.Set;

/* loaded from: classes4.dex */
public final class o4 {
    public static PaymentMethodUpdateParams.Card a(Integer num, Integer num2, PaymentMethodUpdateParams.Card.Networks networks, PaymentMethod.BillingDetails billingDetails, Set set) {
        return new PaymentMethodUpdateParams.Card(num, num2, networks, billingDetails, set, null);
    }
}
