package com.stripe.android.paymentelement.confirmation.intent;

import com.stripe.android.core.exception.StripeException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/intent/CreateIntentWithConfirmationTokenCallbackFailureException;", "Lcom/stripe/android/core/exception/StripeException;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CreateIntentWithConfirmationTokenCallbackFailureException extends StripeException {
    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "merchantReturnedCreateIntentWithConfirmationTokenCallbackFailure";
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return null;
    }
}
