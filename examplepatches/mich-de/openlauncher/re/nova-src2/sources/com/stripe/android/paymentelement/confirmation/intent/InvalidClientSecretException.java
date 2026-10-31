package com.stripe.android.paymentelement.confirmation.intent;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import r70.f;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/intent/InvalidClientSecretException;", "Lcom/stripe/android/core/exception/StripeException;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class InvalidClientSecretException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final String f44176f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public InvalidClientSecretException(String clientSecret, StripeIntent intent) {
        String str;
        super(0, 31, null, null, null, null);
        Intrinsics.g(clientSecret, "clientSecret");
        Intrinsics.g(intent, "intent");
        if (intent instanceof PaymentIntent) {
            str = "PaymentIntent";
        } else {
            if (!(intent instanceof SetupIntent)) {
                throw new NoWhenBranchMatchedException();
            }
            str = "SetupIntent";
        }
        this.f44176f = f.o0("\n        Encountered an invalid client secret \"" + clientSecret + "\" for intent type \"" + str + "\"\n    ");
    }

    @Override // com.stripe.android.core.exception.StripeException
    /* renamed from: a */
    public final String getF44175g() {
        return "invalidClientSecretProvided";
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f44176f;
    }
}
