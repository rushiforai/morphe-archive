package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/PaymentAuthConfig$Stripe3ds2Config", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentAuthConfig$Stripe3ds2Config implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentAuthConfig$Stripe3ds2Config> CREATOR = new di.b(10);

    /* renamed from: a, reason: collision with root package name */
    public final int f42436a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentAuthConfig$Stripe3ds2UiCustomization f42437b;

    public PaymentAuthConfig$Stripe3ds2Config(int i5, PaymentAuthConfig$Stripe3ds2UiCustomization uiCustomization) {
        Intrinsics.g(uiCustomization, "uiCustomization");
        this.f42436a = i5;
        this.f42437b = uiCustomization;
        if (i5 < 5 || i5 > 99) {
            throw new IllegalArgumentException("Timeout value must be between 5 and 99, inclusive");
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentAuthConfig$Stripe3ds2Config)) {
            return false;
        }
        PaymentAuthConfig$Stripe3ds2Config paymentAuthConfig$Stripe3ds2Config = (PaymentAuthConfig$Stripe3ds2Config) obj;
        return this.f42436a == paymentAuthConfig$Stripe3ds2Config.f42436a && Intrinsics.b(this.f42437b, paymentAuthConfig$Stripe3ds2Config.f42437b);
    }

    public final int hashCode() {
        return this.f42437b.f42438a.hashCode() + (Integer.hashCode(this.f42436a) * 31);
    }

    public final String toString() {
        return "Stripe3ds2Config(timeout=" + this.f42436a + ", uiCustomization=" + this.f42437b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42436a);
        this.f42437b.writeToParcel(dest, i5);
    }
}
