package com.stripe.android;

import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b'\u0018\u0000*\n\b\u0000\u0010\u0002 \u0001*\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/StripeIntentResult;", "Lcom/stripe/android/model/StripeIntent;", "T", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class StripeIntentResult<T extends StripeIntent> implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final int f42454a;

    public StripeIntentResult(int i5) {
        this.f42454a = i5;
    }

    public abstract String b();

    public abstract StripeIntent d();
}
