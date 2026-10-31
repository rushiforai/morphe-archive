package com.stripe.android.googlepaylauncher;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/googlepaylauncher/GooglePayPaymentMethodLauncher$Config", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayPaymentMethodLauncher$Config implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayPaymentMethodLauncher$Config> CREATOR = new as.k(3);

    /* renamed from: a, reason: collision with root package name */
    public final as.j f42794a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42795b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42796c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f42797d;

    /* renamed from: e, reason: collision with root package name */
    public final GooglePayPaymentMethodLauncher$BillingAddressConfig f42798e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f42799f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f42800g;

    /* renamed from: h, reason: collision with root package name */
    public final List f42801h;

    public GooglePayPaymentMethodLauncher$Config(as.j jVar, String str, String str2, boolean z11, GooglePayPaymentMethodLauncher$BillingAddressConfig googlePayPaymentMethodLauncher$BillingAddressConfig, List list) {
        this(jVar, str, str2, z11, googlePayPaymentMethodLauncher$BillingAddressConfig, true, true, list);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayPaymentMethodLauncher$Config)) {
            return false;
        }
        GooglePayPaymentMethodLauncher$Config googlePayPaymentMethodLauncher$Config = (GooglePayPaymentMethodLauncher$Config) obj;
        return this.f42794a == googlePayPaymentMethodLauncher$Config.f42794a && Intrinsics.b(this.f42795b, googlePayPaymentMethodLauncher$Config.f42795b) && Intrinsics.b(this.f42796c, googlePayPaymentMethodLauncher$Config.f42796c) && this.f42797d == googlePayPaymentMethodLauncher$Config.f42797d && Intrinsics.b(this.f42798e, googlePayPaymentMethodLauncher$Config.f42798e) && this.f42799f == googlePayPaymentMethodLauncher$Config.f42799f && this.f42800g == googlePayPaymentMethodLauncher$Config.f42800g && Intrinsics.b(this.f42801h, googlePayPaymentMethodLauncher$Config.f42801h);
    }

    public final int hashCode() {
        return this.f42801h.hashCode() + c9.f(c9.f((this.f42798e.hashCode() + c9.f(c0.e(c0.e(this.f42794a.hashCode() * 31, 31, this.f42795b), 31, this.f42796c), 31, this.f42797d)) * 31, 31, this.f42799f), 31, this.f42800g);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Config(environment=");
        sb2.append(this.f42794a);
        sb2.append(", merchantCountryCode=");
        sb2.append(this.f42795b);
        sb2.append(", merchantName=");
        a80.m.q(this.f42796c, ", isEmailRequired=", ", billingAddressConfig=", sb2, this.f42797d);
        sb2.append(this.f42798e);
        sb2.append(", existingPaymentMethodRequired=");
        sb2.append(this.f42799f);
        sb2.append(", allowCreditCards=");
        sb2.append(this.f42800g);
        sb2.append(", additionalEnabledNetworks=");
        sb2.append(this.f42801h);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42794a.name());
        dest.writeString(this.f42795b);
        dest.writeString(this.f42796c);
        dest.writeInt(this.f42797d ? 1 : 0);
        this.f42798e.writeToParcel(dest, i5);
        dest.writeInt(this.f42799f ? 1 : 0);
        dest.writeInt(this.f42800g ? 1 : 0);
        dest.writeStringList(this.f42801h);
    }

    public GooglePayPaymentMethodLauncher$Config(as.j environment, String merchantCountryCode, String merchantName, boolean z11, GooglePayPaymentMethodLauncher$BillingAddressConfig billingAddressConfig, boolean z12, boolean z13, List additionalEnabledNetworks) {
        Intrinsics.g(environment, "environment");
        Intrinsics.g(merchantCountryCode, "merchantCountryCode");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(billingAddressConfig, "billingAddressConfig");
        Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
        this.f42794a = environment;
        this.f42795b = merchantCountryCode;
        this.f42796c = merchantName;
        this.f42797d = z11;
        this.f42798e = billingAddressConfig;
        this.f42799f = z12;
        this.f42800g = z13;
        this.f42801h = additionalEnabledNetworks;
    }
}
