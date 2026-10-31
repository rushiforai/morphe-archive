package com.stripe.android.paymentelement.confirmation.epms;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import st.b;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/epms/ExternalPaymentMethodConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ExternalPaymentMethodConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<ExternalPaymentMethodConfirmationOption> CREATOR = new b();

    /* renamed from: a, reason: collision with root package name */
    public final String f44159a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f44160b;

    public ExternalPaymentMethodConfirmationOption(String type, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(type, "type");
        this.f44159a = type;
        this.f44160b = billingDetails;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ExternalPaymentMethodConfirmationOption)) {
            return false;
        }
        ExternalPaymentMethodConfirmationOption externalPaymentMethodConfirmationOption = (ExternalPaymentMethodConfirmationOption) obj;
        return Intrinsics.b(this.f44159a, externalPaymentMethodConfirmationOption.f44159a) && Intrinsics.b(this.f44160b, externalPaymentMethodConfirmationOption.f44160b);
    }

    public final int hashCode() {
        int iHashCode = this.f44159a.hashCode() * 31;
        PaymentMethod.BillingDetails billingDetails = this.f44160b;
        return iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode());
    }

    public final String toString() {
        return "ExternalPaymentMethodConfirmationOption(type=" + this.f44159a + ", billingDetails=" + this.f44160b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44159a);
        dest.writeParcelable(this.f44160b, i5);
    }
}
