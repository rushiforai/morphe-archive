package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/SharePaymentDetails;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class SharePaymentDetails implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<SharePaymentDetails> CREATOR = new ft.q(12);

    /* renamed from: a, reason: collision with root package name */
    public final String f43786a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43787b;

    public SharePaymentDetails(String paymentMethodId, String encodedPaymentMethod) {
        Intrinsics.g(paymentMethodId, "paymentMethodId");
        Intrinsics.g(encodedPaymentMethod, "encodedPaymentMethod");
        this.f43786a = paymentMethodId;
        this.f43787b = encodedPaymentMethod;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SharePaymentDetails)) {
            return false;
        }
        SharePaymentDetails sharePaymentDetails = (SharePaymentDetails) obj;
        return Intrinsics.b(this.f43786a, sharePaymentDetails.f43786a) && Intrinsics.b(this.f43787b, sharePaymentDetails.f43787b);
    }

    public final int hashCode() {
        return this.f43787b.hashCode() + (this.f43786a.hashCode() * 31);
    }

    public final String toString() {
        return b.c0.n("SharePaymentDetails(paymentMethodId=", this.f43786a, ", encodedPaymentMethod=", this.f43787b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43786a);
        dest.writeString(this.f43787b);
    }
}
