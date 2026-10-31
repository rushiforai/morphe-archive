package com.stripe.android;

import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/CardBrandFilter;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface CardBrandFilter extends Parcelable {
    boolean M(ft.b bVar);

    boolean q0(PaymentMethod paymentMethod);
}
