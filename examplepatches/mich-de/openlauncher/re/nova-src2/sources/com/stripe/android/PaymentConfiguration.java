package com.stripe.android;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/PaymentConfiguration;", "Landroid/os/Parcelable;", "dq/o", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentConfiguration> CREATOR = new di.b(12);

    /* renamed from: c, reason: collision with root package name */
    public static PaymentConfiguration f42439c;

    /* renamed from: a, reason: collision with root package name */
    public final String f42440a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42441b;

    public PaymentConfiguration(String publishableKey, String str) {
        Intrinsics.g(publishableKey, "publishableKey");
        this.f42440a = publishableKey;
        this.f42441b = str;
        if (k.U0(publishableKey)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You must use a valid Stripe API key to make a Stripe API request. For more info, see https://stripe.com/docs/keys");
        }
        if (j.I0(publishableKey, "sk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a secret key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
        }
        if (j.I0(publishableKey, "rk_", false)) {
            throw new IllegalArgumentException("Invalid Publishable Key: You are using a restricted key instead of a publishable one. For more info, see https://stripe.com/docs/keys");
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
        if (!(obj instanceof PaymentConfiguration)) {
            return false;
        }
        PaymentConfiguration paymentConfiguration = (PaymentConfiguration) obj;
        return Intrinsics.b(this.f42440a, paymentConfiguration.f42440a) && Intrinsics.b(this.f42441b, paymentConfiguration.f42441b);
    }

    public final int hashCode() {
        int iHashCode = this.f42440a.hashCode() * 31;
        String str = this.f42441b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return c0.n("PaymentConfiguration(publishableKey=", this.f42440a, ", stripeAccountId=", this.f42441b, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42440a);
        dest.writeString(this.f42441b);
    }
}
