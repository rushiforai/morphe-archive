package com.stripe.android.core.exception;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/InvalidResponseException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class InvalidResponseException extends StripeException {
    public InvalidResponseException() {
        super(null, null, 0, null, null);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "invalidResponseError";
    }
}
