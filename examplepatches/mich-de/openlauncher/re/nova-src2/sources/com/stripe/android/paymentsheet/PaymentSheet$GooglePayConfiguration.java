package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$GooglePayConfiguration", "Landroid/os/Parcelable;", "ou/q0", "ou/p0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$GooglePayConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$GooglePayConfiguration> CREATOR = new ou.l0(9);

    /* renamed from: a, reason: collision with root package name */
    public final ou.q0 f44575a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44576b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44577c;

    /* renamed from: d, reason: collision with root package name */
    public final Long f44578d;

    /* renamed from: e, reason: collision with root package name */
    public final String f44579e;

    /* renamed from: f, reason: collision with root package name */
    public final ou.p0 f44580f;

    /* renamed from: g, reason: collision with root package name */
    public final List f44581g;

    public PaymentSheet$GooglePayConfiguration(ou.q0 environment, String countryCode, String str, Long l9, String str2, ou.p0 buttonType, List additionalEnabledNetworks) {
        Intrinsics.g(environment, "environment");
        Intrinsics.g(countryCode, "countryCode");
        Intrinsics.g(buttonType, "buttonType");
        Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
        this.f44575a = environment;
        this.f44576b = countryCode;
        this.f44577c = str;
        this.f44578d = l9;
        this.f44579e = str2;
        this.f44580f = buttonType;
        this.f44581g = additionalEnabledNetworks;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$GooglePayConfiguration)) {
            return false;
        }
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = (PaymentSheet$GooglePayConfiguration) obj;
        return this.f44575a == paymentSheet$GooglePayConfiguration.f44575a && Intrinsics.b(this.f44576b, paymentSheet$GooglePayConfiguration.f44576b) && Intrinsics.b(this.f44577c, paymentSheet$GooglePayConfiguration.f44577c) && Intrinsics.b(this.f44578d, paymentSheet$GooglePayConfiguration.f44578d) && Intrinsics.b(this.f44579e, paymentSheet$GooglePayConfiguration.f44579e) && this.f44580f == paymentSheet$GooglePayConfiguration.f44580f && Intrinsics.b(this.f44581g, paymentSheet$GooglePayConfiguration.f44581g);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f44575a.hashCode() * 31, 31, this.f44576b);
        String str = this.f44577c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        Long l9 = this.f44578d;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str2 = this.f44579e;
        return this.f44581g.hashCode() + ((this.f44580f.hashCode() + ((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GooglePayConfiguration(environment=");
        sb2.append(this.f44575a);
        sb2.append(", countryCode=");
        sb2.append(this.f44576b);
        sb2.append(", currencyCode=");
        sb2.append(this.f44577c);
        sb2.append(", amount=");
        sb2.append(this.f44578d);
        sb2.append(", label=");
        sb2.append(this.f44579e);
        sb2.append(", buttonType=");
        sb2.append(this.f44580f);
        sb2.append(", additionalEnabledNetworks=");
        return a80.m.j(sb2, this.f44581g, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44575a.name());
        dest.writeString(this.f44576b);
        dest.writeString(this.f44577c);
        Long l9 = this.f44578d;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f44579e);
        dest.writeString(this.f44580f.name());
        dest.writeStringList(this.f44581g);
    }
}
