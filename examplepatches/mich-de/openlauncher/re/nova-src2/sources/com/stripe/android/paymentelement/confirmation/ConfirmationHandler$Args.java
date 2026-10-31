package com.stripe.android.paymentelement.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.StripeIntent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentelement/confirmation/ConfirmationHandler$Args", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConfirmationHandler$Args implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ConfirmationHandler$Args> CREATOR = new ji.a(26);

    /* renamed from: a, reason: collision with root package name */
    public final ConfirmationHandler$Option f44128a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodMetadata f44129b;

    /* renamed from: c, reason: collision with root package name */
    public final StripeIntent f44130c;

    public ConfirmationHandler$Args(ConfirmationHandler$Option confirmationOption, PaymentMethodMetadata paymentMethodMetadata) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        this.f44128a = confirmationOption;
        this.f44129b = paymentMethodMetadata;
        this.f44130c = paymentMethodMetadata.f43092a;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmationHandler$Args)) {
            return false;
        }
        ConfirmationHandler$Args confirmationHandler$Args = (ConfirmationHandler$Args) obj;
        return Intrinsics.b(this.f44128a, confirmationHandler$Args.f44128a) && Intrinsics.b(this.f44129b, confirmationHandler$Args.f44129b);
    }

    public final int hashCode() {
        return this.f44129b.hashCode() + (this.f44128a.hashCode() * 31);
    }

    public final String toString() {
        return "Args(confirmationOption=" + this.f44128a + ", paymentMethodMetadata=" + this.f44129b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f44128a, i5);
        this.f44129b.writeToParcel(dest, i5);
    }
}
