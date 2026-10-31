package com.stripe.android.core.exception;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.stripe.android.core.StripeError;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/PermissionException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PermissionException extends StripeException {
    public PermissionException(StripeError stripeError, String str) {
        super(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, 24, stripeError, str, null, null);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "permissionError";
    }
}
