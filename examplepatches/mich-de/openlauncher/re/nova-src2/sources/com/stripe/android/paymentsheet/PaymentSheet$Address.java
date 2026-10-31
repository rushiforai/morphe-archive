package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Address", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Address implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Address> CREATOR = new ou.l0(0);

    /* renamed from: a, reason: collision with root package name */
    public final String f44447a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44448b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44449c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44450d;

    /* renamed from: e, reason: collision with root package name */
    public final String f44451e;

    /* renamed from: f, reason: collision with root package name */
    public final String f44452f;

    public PaymentSheet$Address(String str, String str2, String str3, String str4, String str5, String str6) {
        this.f44447a = str;
        this.f44448b = str2;
        this.f44449c = str3;
        this.f44450d = str4;
        this.f44451e = str5;
        this.f44452f = str6;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Address)) {
            return false;
        }
        PaymentSheet$Address paymentSheet$Address = (PaymentSheet$Address) obj;
        return Intrinsics.b(this.f44447a, paymentSheet$Address.f44447a) && Intrinsics.b(this.f44448b, paymentSheet$Address.f44448b) && Intrinsics.b(this.f44449c, paymentSheet$Address.f44449c) && Intrinsics.b(this.f44450d, paymentSheet$Address.f44450d) && Intrinsics.b(this.f44451e, paymentSheet$Address.f44451e) && Intrinsics.b(this.f44452f, paymentSheet$Address.f44452f);
    }

    public final int hashCode() {
        String str = this.f44447a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f44448b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f44449c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f44450d;
        int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f44451e;
        int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f44452f;
        return iHashCode5 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("Address(city=", this.f44447a, ", country=", this.f44448b, ", line1=");
        b.c0.D(sbW, this.f44449c, ", line2=", this.f44450d, ", postalCode=");
        return b.c0.s(sbW, this.f44451e, ", state=", this.f44452f, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44447a);
        dest.writeString(this.f44448b);
        dest.writeString(this.f44449c);
        dest.writeString(this.f44450d);
        dest.writeString(this.f44451e);
        dest.writeString(this.f44452f);
    }
}
