package com.stripe.android.core.exception;

import com.stripe.android.core.StripeError;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/APIException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class APIException extends StripeException {
    public APIException() {
        this(0, 31, null, null, null, null);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "apiError";
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public APIException(int i5, int i11, StripeError stripeError, String str, String str2, Throwable th2) {
        String str3;
        Throwable th3;
        stripeError = (i11 & 1) != 0 ? null : stripeError;
        str = (i11 & 2) != 0 ? null : str;
        i5 = (i11 & 4) != 0 ? 0 : i5;
        str2 = (i11 & 8) != 0 ? stripeError != null ? stripeError.f42551b : null : str2;
        if ((i11 & 16) != 0) {
            str3 = str2;
            th3 = null;
        } else {
            str3 = str2;
            th3 = th2;
        }
        super(stripeError, str, i5, th3, str3);
    }
}
