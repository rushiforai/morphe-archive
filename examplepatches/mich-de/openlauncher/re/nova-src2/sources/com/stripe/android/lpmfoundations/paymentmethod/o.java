package com.stripe.android.lpmfoundations.paymentmethod;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.model.PaymentMethod;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class o {
    public static PaymentMethod.AllowRedisplay a(PaymentMethodSaveConsentBehavior paymentMethodSaveConsentBehavior, boolean z11, wu.c customerRequestedSave) {
        Intrinsics.g(customerRequestedSave, "customerRequestedSave");
        if (!z11) {
            if (!(paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Legacy) && !(paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Disabled)) {
                if (paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Enabled) {
                    return customerRequestedSave == wu.c.f94689b ? PaymentMethod.AllowRedisplay.f43592d : PaymentMethod.AllowRedisplay.f43590b;
                }
                throw new NoWhenBranchMatchedException();
            }
            return PaymentMethod.AllowRedisplay.f43590b;
        }
        if (paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Legacy) {
            return PaymentMethod.AllowRedisplay.f43590b;
        }
        if (paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Disabled) {
            PaymentMethod.AllowRedisplay allowRedisplay = ((PaymentMethodSaveConsentBehavior.Disabled) paymentMethodSaveConsentBehavior).f43116a;
            return allowRedisplay == null ? PaymentMethod.AllowRedisplay.f43591c : allowRedisplay;
        }
        if (paymentMethodSaveConsentBehavior instanceof PaymentMethodSaveConsentBehavior.Enabled) {
            return customerRequestedSave == wu.c.f94689b ? PaymentMethod.AllowRedisplay.f43592d : PaymentMethod.AllowRedisplay.f43591c;
        }
        throw new NoWhenBranchMatchedException();
    }
}
