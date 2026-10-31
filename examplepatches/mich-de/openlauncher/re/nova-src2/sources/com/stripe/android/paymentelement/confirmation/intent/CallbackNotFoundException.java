package com.stripe.android.paymentelement.confirmation.intent;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/intent/CallbackNotFoundException;", "Lcom/stripe/android/core/exception/StripeException;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CallbackNotFoundException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final ResolvableString f44174f;

    /* renamed from: g, reason: collision with root package name */
    public final String f44175g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CallbackNotFoundException(String message, ResolvableString resolvableString, String analyticsValue) {
        super(0, 15, null, null, message, null);
        Intrinsics.g(message, "message");
        Intrinsics.g(analyticsValue, "analyticsValue");
        this.f44174f = resolvableString;
        this.f44175g = analyticsValue;
    }

    @Override // com.stripe.android.core.exception.StripeException
    /* renamed from: a, reason: from getter */
    public final String getF44175g() {
        return this.f44175g;
    }
}
