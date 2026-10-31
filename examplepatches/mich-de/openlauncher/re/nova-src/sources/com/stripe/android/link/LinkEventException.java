package com.stripe.android.link;

import com.stripe.android.core.exception.StripeException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkEventException;", "Lcom/stripe/android/core/exception/StripeException;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinkEventException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final Throwable f42925f;

    public LinkEventException(Throwable th2) {
        super(0, 23, null, null, null, th2);
        this.f42925f = th2;
    }

    @Override // java.lang.Throwable
    public final Throwable getCause() {
        return this.f42925f;
    }
}
