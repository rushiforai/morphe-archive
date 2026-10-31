package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayLauncher$BillingAddressConfig", "Landroid/os/Parcelable;", "as/l", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayLauncher$BillingAddressConfig implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayLauncher$BillingAddressConfig> CREATOR = new as.k(0);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f42766a;

    /* renamed from: b, reason: collision with root package name */
    public final as.l f42767b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f42768c;

    public GooglePayLauncher$BillingAddressConfig(boolean z11, as.l format, boolean z12) {
        Intrinsics.g(format, "format");
        this.f42766a = z11;
        this.f42767b = format;
        this.f42768c = z12;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayLauncher$BillingAddressConfig)) {
            return false;
        }
        GooglePayLauncher$BillingAddressConfig googlePayLauncher$BillingAddressConfig = (GooglePayLauncher$BillingAddressConfig) obj;
        return this.f42766a == googlePayLauncher$BillingAddressConfig.f42766a && this.f42767b == googlePayLauncher$BillingAddressConfig.f42767b && this.f42768c == googlePayLauncher$BillingAddressConfig.f42768c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f42768c) + ((this.f42767b.hashCode() + (Boolean.hashCode(this.f42766a) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BillingAddressConfig(isRequired=");
        sb2.append(this.f42766a);
        sb2.append(", format=");
        sb2.append(this.f42767b);
        sb2.append(", isPhoneNumberRequired=");
        return a80.m.k(sb2, this.f42768c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42766a ? 1 : 0);
        dest.writeString(this.f42767b.name());
        dest.writeInt(this.f42768c ? 1 : 0);
    }
}
