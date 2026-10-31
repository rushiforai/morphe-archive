package com.stripe.android.core.exception;

import com.stripe.android.core.StripeError;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/RateLimitException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class RateLimitException extends StripeException {
    public RateLimitException() {
        this(null, null, 15);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "rateLimitError";
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public RateLimitException(StripeError stripeError, String str, int i5) {
        StripeError stripeError2 = (i5 & 1) != 0 ? null : stripeError;
        super(stripeError2, (i5 & 2) != 0 ? null : str, 429, null, stripeError2 != null ? stripeError2.f42551b : null);
    }
}
