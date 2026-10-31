package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayLauncher$Config", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayLauncher$Config implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayLauncher$Config> CREATOR = new as.k(1);

    /* renamed from: a, reason: collision with root package name */
    public final as.j f42769a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42770b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42771c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f42772d;

    /* renamed from: e, reason: collision with root package name */
    public final GooglePayLauncher$BillingAddressConfig f42773e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f42774f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f42775g;

    /* renamed from: h, reason: collision with root package name */
    public final List f42776h;

    public GooglePayLauncher$Config(as.j environment, String merchantCountryCode, String merchantName, boolean z11, GooglePayLauncher$BillingAddressConfig billingAddressConfig, boolean z12, boolean z13, ArrayList additionalEnabledNetworks) {
        Intrinsics.g(environment, "environment");
        Intrinsics.g(merchantCountryCode, "merchantCountryCode");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(billingAddressConfig, "billingAddressConfig");
        Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
        this.f42769a = environment;
        this.f42770b = merchantCountryCode;
        this.f42771c = merchantName;
        this.f42772d = z11;
        this.f42773e = billingAddressConfig;
        this.f42774f = z12;
        this.f42775g = z13;
        this.f42776h = additionalEnabledNetworks;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayLauncher$Config)) {
            return false;
        }
        GooglePayLauncher$Config googlePayLauncher$Config = (GooglePayLauncher$Config) obj;
        return this.f42769a == googlePayLauncher$Config.f42769a && Intrinsics.b(this.f42770b, googlePayLauncher$Config.f42770b) && Intrinsics.b(this.f42771c, googlePayLauncher$Config.f42771c) && this.f42772d == googlePayLauncher$Config.f42772d && Intrinsics.b(this.f42773e, googlePayLauncher$Config.f42773e) && this.f42774f == googlePayLauncher$Config.f42774f && this.f42775g == googlePayLauncher$Config.f42775g && Intrinsics.b(this.f42776h, googlePayLauncher$Config.f42776h);
    }

    public final int hashCode() {
        return this.f42776h.hashCode() + c9.f(c9.f((this.f42773e.hashCode() + c9.f(c0.e(c0.e(this.f42769a.hashCode() * 31, 31, this.f42770b), 31, this.f42771c), 31, this.f42772d)) * 31, 31, this.f42774f), 31, this.f42775g);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Config(environment=");
        sb2.append(this.f42769a);
        sb2.append(", merchantCountryCode=");
        sb2.append(this.f42770b);
        sb2.append(", merchantName=");
        a80.m.q(this.f42771c, ", isEmailRequired=", ", billingAddressConfig=", sb2, this.f42772d);
        sb2.append(this.f42773e);
        sb2.append(", existingPaymentMethodRequired=");
        sb2.append(this.f42774f);
        sb2.append(", allowCreditCards=");
        sb2.append(this.f42775g);
        sb2.append(", additionalEnabledNetworks=");
        sb2.append(this.f42776h);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42769a.name());
        dest.writeString(this.f42770b);
        dest.writeString(this.f42771c);
        dest.writeInt(this.f42772d ? 1 : 0);
        this.f42773e.writeToParcel(dest, i5);
        dest.writeInt(this.f42774f ? 1 : 0);
        dest.writeInt(this.f42775g ? 1 : 0);
        dest.writeStringList(this.f42776h);
    }
}
