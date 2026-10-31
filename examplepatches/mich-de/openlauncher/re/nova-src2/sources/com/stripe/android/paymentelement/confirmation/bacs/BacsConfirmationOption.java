package com.stripe.android.paymentelement.confirmation.bacs;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/bacs/BacsConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BacsConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<BacsConfirmationOption> CREATOR = new f(10);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodCreateParams f44149a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodOptionsParams f44150b;

    public BacsConfirmationOption(PaymentMethodCreateParams createParams, PaymentMethodOptionsParams paymentMethodOptionsParams) {
        Intrinsics.g(createParams, "createParams");
        this.f44149a = createParams;
        this.f44150b = paymentMethodOptionsParams;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BacsConfirmationOption)) {
            return false;
        }
        BacsConfirmationOption bacsConfirmationOption = (BacsConfirmationOption) obj;
        return Intrinsics.b(this.f44149a, bacsConfirmationOption.f44149a) && Intrinsics.b(this.f44150b, bacsConfirmationOption.f44150b);
    }

    public final int hashCode() {
        int iHashCode = this.f44149a.hashCode() * 31;
        PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44150b;
        return iHashCode + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode());
    }

    public final String toString() {
        return "BacsConfirmationOption(createParams=" + this.f44149a + ", optionsParams=" + this.f44150b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44149a, i5);
        dest.writeParcelable(this.f44150b, i5);
    }
}
