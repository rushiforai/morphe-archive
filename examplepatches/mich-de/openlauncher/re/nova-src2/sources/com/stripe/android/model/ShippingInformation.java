package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ShippingInformation;", "Lcom/stripe/android/core/model/StripeModel;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ShippingInformation implements StripeModel, StripeParamsModel {

    @NotNull
    public static final Parcelable.Creator<ShippingInformation> CREATOR = new ft.q(13);

    /* renamed from: a, reason: collision with root package name */
    public final Address f43788a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43789b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43790c;

    public ShippingInformation(Address address, String str, String str2) {
        this.f43788a = address;
        this.f43789b = str;
        this.f43790c = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ShippingInformation)) {
            return false;
        }
        ShippingInformation shippingInformation = (ShippingInformation) obj;
        return Intrinsics.b(this.f43788a, shippingInformation.f43788a) && Intrinsics.b(this.f43789b, shippingInformation.f43789b) && Intrinsics.b(this.f43790c, shippingInformation.f43790c);
    }

    public final int hashCode() {
        Address address = this.f43788a;
        int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
        String str = this.f43789b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43790c;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShippingInformation(address=");
        sb2.append(this.f43788a);
        sb2.append(", name=");
        sb2.append(this.f43789b);
        sb2.append(", phone=");
        return b.c0.q(sb2, this.f43790c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Address address = this.f43788a;
        if (address == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            address.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43789b);
        dest.writeString(this.f43790c);
    }
}
