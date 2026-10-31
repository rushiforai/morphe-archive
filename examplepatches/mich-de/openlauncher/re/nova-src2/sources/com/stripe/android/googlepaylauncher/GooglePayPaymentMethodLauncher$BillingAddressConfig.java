package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import as.v;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$BillingAddressConfig", "Landroid/os/Parcelable;", "as/v", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayPaymentMethodLauncher$BillingAddressConfig implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayPaymentMethodLauncher$BillingAddressConfig> CREATOR = new as.k(2);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f42791a;

    /* renamed from: b, reason: collision with root package name */
    public final v f42792b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f42793c;

    public GooglePayPaymentMethodLauncher$BillingAddressConfig(boolean z11, v format, boolean z12) {
        Intrinsics.g(format, "format");
        this.f42791a = z11;
        this.f42792b = format;
        this.f42793c = z12;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayPaymentMethodLauncher$BillingAddressConfig)) {
            return false;
        }
        GooglePayPaymentMethodLauncher$BillingAddressConfig googlePayPaymentMethodLauncher$BillingAddressConfig = (GooglePayPaymentMethodLauncher$BillingAddressConfig) obj;
        return this.f42791a == googlePayPaymentMethodLauncher$BillingAddressConfig.f42791a && this.f42792b == googlePayPaymentMethodLauncher$BillingAddressConfig.f42792b && this.f42793c == googlePayPaymentMethodLauncher$BillingAddressConfig.f42793c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f42793c) + ((this.f42792b.hashCode() + (Boolean.hashCode(this.f42791a) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BillingAddressConfig(isRequired=");
        sb2.append(this.f42791a);
        sb2.append(", format=");
        sb2.append(this.f42792b);
        sb2.append(", isPhoneNumberRequired=");
        return a80.m.k(sb2, this.f42793c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42791a ? 1 : 0);
        dest.writeString(this.f42792b.name());
        dest.writeInt(this.f42793c ? 1 : 0);
    }
}
