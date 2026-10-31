package com.stripe.android.core.exception;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/exception/LocalStripeException;", "Lcom/stripe/android/core/exception/StripeException;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LocalStripeException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final String f42560f;

    /* renamed from: g, reason: collision with root package name */
    public final String f42561g;

    public LocalStripeException(String str, String str2) {
        super(0, 15, null, null, str, null);
        this.f42560f = str;
        this.f42561g = str2;
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        String str = this.f42561g;
        return str == null ? "unknown" : str;
    }
}
