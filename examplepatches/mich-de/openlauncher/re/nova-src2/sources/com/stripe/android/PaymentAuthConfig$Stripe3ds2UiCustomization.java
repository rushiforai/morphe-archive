package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.stripe3ds2.init.ui.StripeUiCustomization;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/PaymentAuthConfig$Stripe3ds2UiCustomization", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentAuthConfig$Stripe3ds2UiCustomization implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentAuthConfig$Stripe3ds2UiCustomization> CREATOR = new di.b(11);

    /* renamed from: a, reason: collision with root package name */
    public final StripeUiCustomization f42438a;

    public PaymentAuthConfig$Stripe3ds2UiCustomization(StripeUiCustomization uiCustomization) {
        Intrinsics.g(uiCustomization, "uiCustomization");
        this.f42438a = uiCustomization;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentAuthConfig$Stripe3ds2UiCustomization) && Intrinsics.b(this.f42438a, ((PaymentAuthConfig$Stripe3ds2UiCustomization) obj).f42438a);
    }

    public final int hashCode() {
        return this.f42438a.hashCode();
    }

    public final String toString() {
        return "Stripe3ds2UiCustomization(uiCustomization=" + this.f42438a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f42438a, i5);
    }
}
