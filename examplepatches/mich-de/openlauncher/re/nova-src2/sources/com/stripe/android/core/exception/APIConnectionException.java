package com.stripe.android.core.exception;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/core/exception/APIConnectionException;", "Lcom/stripe/android/core/exception/StripeException;", "p6/f", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class APIConnectionException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f42558f = 0;

    public APIConnectionException() {
        this(null, null);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "connectionError";
    }

    public APIConnectionException(String str, Throwable th2) {
        super(0, 7, null, null, str, th2);
    }
}
