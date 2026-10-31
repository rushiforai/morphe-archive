package com.stripe.android.core.exception;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/GenericStripeException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GenericStripeException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final String f42559f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GenericStripeException(String str, Throwable cause) {
        super(0, 7, null, null, cause.getMessage(), cause);
        Intrinsics.g(cause, "cause");
        this.f42559f = str;
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        String str = this.f42559f;
        return str == null ? "unknown" : str;
    }
}
