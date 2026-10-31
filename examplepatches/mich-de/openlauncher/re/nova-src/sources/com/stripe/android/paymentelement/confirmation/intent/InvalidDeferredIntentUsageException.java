package com.stripe.android.paymentelement.confirmation.intent;

import com.stripe.android.core.exception.StripeException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/intent/InvalidDeferredIntentUsageException;", "Lcom/stripe/android/core/exception/StripeException;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class InvalidDeferredIntentUsageException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final String f44177f;

    public InvalidDeferredIntentUsageException() {
        super(0, 31, null, null, null, null);
        this.f44177f = "The payment method on the intent doesn't match the one provided in the createIntentCallback. When using deferred\nintent creation, ensure you're either creating a new intent with the correct payment method or updating an\nexisting intent with the new payment method ID.";
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "invalidDeferredIntentUsage";
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f44177f;
    }
}
