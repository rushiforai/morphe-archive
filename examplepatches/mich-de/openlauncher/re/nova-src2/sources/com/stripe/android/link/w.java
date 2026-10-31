package com.stripe.android.link;

import com.stripe.android.link.LinkLaunchMode;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class w {
    public static ConsumerPaymentDetails.PaymentDetails a(LinkLaunchMode linkLaunchMode) {
        if ((linkLaunchMode instanceof LinkLaunchMode.Authentication) || (linkLaunchMode instanceof LinkLaunchMode.Authorization) || (linkLaunchMode instanceof LinkLaunchMode.Full)) {
            return null;
        }
        if (linkLaunchMode instanceof LinkLaunchMode.Confirmation) {
            return ((LinkLaunchMode.Confirmation) linkLaunchMode).f42929a.getF42941a();
        }
        if (linkLaunchMode instanceof LinkLaunchMode.PaymentMethodSelection) {
            return ((LinkLaunchMode.PaymentMethodSelection) linkLaunchMode).f42931a;
        }
        throw new NoWhenBranchMatchedException();
    }
}
