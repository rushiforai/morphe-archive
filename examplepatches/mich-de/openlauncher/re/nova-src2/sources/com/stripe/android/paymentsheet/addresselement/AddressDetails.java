package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.measurement.k2;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AddressDetails;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class AddressDetails implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AddressDetails> CREATOR = new pu.a(0);

    /* renamed from: a, reason: collision with root package name */
    public final String f44678a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$Address f44679b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44680c;

    /* renamed from: d, reason: collision with root package name */
    public final Boolean f44681d;

    public /* synthetic */ AddressDetails(String str, PaymentSheet$Address paymentSheet$Address, String str2, int i5) {
        this(str, paymentSheet$Address, (i5 & 4) != 0 ? null : str2, (Boolean) null);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AddressDetails)) {
            return false;
        }
        AddressDetails addressDetails = (AddressDetails) obj;
        return Intrinsics.b(this.f44678a, addressDetails.f44678a) && Intrinsics.b(this.f44679b, addressDetails.f44679b) && Intrinsics.b(this.f44680c, addressDetails.f44680c) && Intrinsics.b(this.f44681d, addressDetails.f44681d);
    }

    public final int hashCode() {
        String str = this.f44678a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        PaymentSheet$Address paymentSheet$Address = this.f44679b;
        int iHashCode2 = (iHashCode + (paymentSheet$Address == null ? 0 : paymentSheet$Address.hashCode())) * 31;
        String str2 = this.f44680c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Boolean bool = this.f44681d;
        return iHashCode3 + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        return "AddressDetails(name=" + this.f44678a + ", address=" + this.f44679b + ", phoneNumber=" + this.f44680c + ", isCheckboxSelected=" + this.f44681d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44678a);
        PaymentSheet$Address paymentSheet$Address = this.f44679b;
        if (paymentSheet$Address == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$Address.writeToParcel(dest, i5);
        }
        dest.writeString(this.f44680c);
        Boolean bool = this.f44681d;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            k2.w(dest, 1, bool);
        }
    }

    public AddressDetails(String str, PaymentSheet$Address paymentSheet$Address, String str2, Boolean bool) {
        this.f44678a = str;
        this.f44679b = paymentSheet$Address;
        this.f44680c = str2;
        this.f44681d = bool;
    }
}
