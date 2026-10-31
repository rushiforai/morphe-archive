package com.stripe.android.lpmfoundations.paymentmethod;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.model.ElementsSession;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class n {
    public static final PaymentMethodSaveConsentBehavior a(ElementsSession elementsSession) {
        ElementsSession.Customer.Session session;
        ElementsSession.Customer.Components components;
        ElementsSession.Customer customer = elementsSession.f43393h;
        ElementsSession.Customer.Components.MobilePaymentElement mobilePaymentElement = (customer == null || (session = customer.f43412c) == null || (components = session.f43430f) == null) ? null : components.f43413a;
        if (mobilePaymentElement instanceof ElementsSession.Customer.Components.MobilePaymentElement.Enabled) {
            ElementsSession.Customer.Components.MobilePaymentElement.Enabled enabled = (ElementsSession.Customer.Components.MobilePaymentElement.Enabled) mobilePaymentElement;
            return enabled.f43420a ? PaymentMethodSaveConsentBehavior.Enabled.f43117a : new PaymentMethodSaveConsentBehavior.Disabled(enabled.f43423d);
        }
        if ((mobilePaymentElement instanceof ElementsSession.Customer.Components.MobilePaymentElement.Disabled) || mobilePaymentElement == null) {
            return PaymentMethodSaveConsentBehavior.Legacy.f43118a;
        }
        throw new NoWhenBranchMatchedException();
    }
}
