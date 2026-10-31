package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodsList;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentMethodsList implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<PaymentMethodsList> CREATOR = new ft.q(9);

    /* renamed from: a, reason: collision with root package name */
    public final List f43757a;

    public PaymentMethodsList(List paymentMethods) {
        Intrinsics.g(paymentMethods, "paymentMethods");
        this.f43757a = paymentMethods;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentMethodsList) && Intrinsics.b(this.f43757a, ((PaymentMethodsList) obj).f43757a);
    }

    public final int hashCode() {
        return this.f43757a.hashCode();
    }

    public final String toString() {
        return "PaymentMethodsList(paymentMethods=" + this.f43757a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f43757a, dest);
        while (itK.hasNext()) {
            ((PaymentMethod) itK.next()).writeToParcel(dest, i5);
        }
    }
}
