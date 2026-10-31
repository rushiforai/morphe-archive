package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerShippingAddress;", "Lcom/stripe/android/core/model/StripeModel;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConsumerShippingAddress implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ConsumerShippingAddress> CREATOR = new p0();

    /* renamed from: a, reason: collision with root package name */
    public final String f43353a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f43354b;

    /* renamed from: c, reason: collision with root package name */
    public final ConsumerPaymentDetails.BillingAddress f43355c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43356d;

    public ConsumerShippingAddress(String id2, boolean z11, ConsumerPaymentDetails.BillingAddress address, String str) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(address, "address");
        this.f43353a = id2;
        this.f43354b = z11;
        this.f43355c = address;
        this.f43356d = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConsumerShippingAddress)) {
            return false;
        }
        ConsumerShippingAddress consumerShippingAddress = (ConsumerShippingAddress) obj;
        return Intrinsics.b(this.f43353a, consumerShippingAddress.f43353a) && this.f43354b == consumerShippingAddress.f43354b && Intrinsics.b(this.f43355c, consumerShippingAddress.f43355c) && Intrinsics.b(this.f43356d, consumerShippingAddress.f43356d);
    }

    public final int hashCode() {
        int iHashCode = (this.f43355c.hashCode() + c9.f(this.f43353a.hashCode() * 31, 31, this.f43354b)) * 31;
        String str = this.f43356d;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "ConsumerShippingAddress(id=" + this.f43353a + ", isDefault=" + this.f43354b + ", address=" + this.f43355c + ", unredactedPhoneNumber=" + this.f43356d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43353a);
        dest.writeInt(this.f43354b ? 1 : 0);
        this.f43355c.writeToParcel(dest, i5);
        dest.writeString(this.f43356d);
    }
}
