package com.stripe.android;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import dq.e;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/GooglePayJsonFactory$BillingAddressParameters", "Landroid/os/Parcelable;", "dq/e", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class GooglePayJsonFactory$BillingAddressParameters implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<GooglePayJsonFactory$BillingAddressParameters> CREATOR = new di.b(6);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f42423a;

    /* renamed from: b, reason: collision with root package name */
    public final e f42424b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f42425c;

    public GooglePayJsonFactory$BillingAddressParameters(boolean z11, e format, boolean z12) {
        Intrinsics.g(format, "format");
        this.f42423a = z11;
        this.f42424b = format;
        this.f42425c = z12;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof GooglePayJsonFactory$BillingAddressParameters)) {
            return false;
        }
        GooglePayJsonFactory$BillingAddressParameters googlePayJsonFactory$BillingAddressParameters = (GooglePayJsonFactory$BillingAddressParameters) obj;
        return this.f42423a == googlePayJsonFactory$BillingAddressParameters.f42423a && this.f42424b == googlePayJsonFactory$BillingAddressParameters.f42424b && this.f42425c == googlePayJsonFactory$BillingAddressParameters.f42425c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f42425c) + ((this.f42424b.hashCode() + (Boolean.hashCode(this.f42423a) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BillingAddressParameters(isRequired=");
        sb2.append(this.f42423a);
        sb2.append(", format=");
        sb2.append(this.f42424b);
        sb2.append(", isPhoneNumberRequired=");
        return m.k(sb2, this.f42425c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42423a ? 1 : 0);
        dest.writeString(this.f42424b.name());
        dest.writeInt(this.f42425c ? 1 : 0);
    }
}
