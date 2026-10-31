package com.stripe.android.paymentelement.confirmation.cpms;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/CustomPaymentMethodConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CustomPaymentMethodConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<CustomPaymentMethodConfirmationOption> CREATOR = new qt.a();

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$CustomPaymentMethod f44151a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f44152b;

    public CustomPaymentMethodConfirmationOption(PaymentSheet$CustomPaymentMethod customPaymentMethodType, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(customPaymentMethodType, "customPaymentMethodType");
        this.f44151a = customPaymentMethodType;
        this.f44152b = billingDetails;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CustomPaymentMethodConfirmationOption)) {
            return false;
        }
        CustomPaymentMethodConfirmationOption customPaymentMethodConfirmationOption = (CustomPaymentMethodConfirmationOption) obj;
        return Intrinsics.b(this.f44151a, customPaymentMethodConfirmationOption.f44151a) && Intrinsics.b(this.f44152b, customPaymentMethodConfirmationOption.f44152b);
    }

    public final int hashCode() {
        int iHashCode = this.f44151a.hashCode() * 31;
        PaymentMethod.BillingDetails billingDetails = this.f44152b;
        return iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode());
    }

    public final String toString() {
        return "CustomPaymentMethodConfirmationOption(customPaymentMethodType=" + this.f44151a + ", billingDetails=" + this.f44152b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44151a.writeToParcel(dest, i5);
        dest.writeParcelable(this.f44152b, i5);
    }
}
