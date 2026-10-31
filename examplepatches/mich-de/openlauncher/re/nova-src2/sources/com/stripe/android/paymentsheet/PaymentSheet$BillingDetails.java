package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$BillingDetails", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$BillingDetails implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$BillingDetails> CREATOR = new ou.l0(1);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Address f44509a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44510b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44511c;

    /* renamed from: d, reason: collision with root package name */
    public final String f44512d;

    public /* synthetic */ PaymentSheet$BillingDetails(PaymentSheet$Address paymentSheet$Address, int i5) {
        this((i5 & 1) != 0 ? null : paymentSheet$Address, null, null, null);
    }

    public final boolean b() {
        return (this.f44509a == null && this.f44510b == null && this.f44511c == null && this.f44512d == null) ? false : true;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$BillingDetails)) {
            return false;
        }
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = (PaymentSheet$BillingDetails) obj;
        return Intrinsics.b(this.f44509a, paymentSheet$BillingDetails.f44509a) && Intrinsics.b(this.f44510b, paymentSheet$BillingDetails.f44510b) && Intrinsics.b(this.f44511c, paymentSheet$BillingDetails.f44511c) && Intrinsics.b(this.f44512d, paymentSheet$BillingDetails.f44512d);
    }

    public final int hashCode() {
        PaymentSheet$Address paymentSheet$Address = this.f44509a;
        int iHashCode = (paymentSheet$Address == null ? 0 : paymentSheet$Address.hashCode()) * 31;
        String str = this.f44510b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f44511c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f44512d;
        return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BillingDetails(address=");
        sb2.append(this.f44509a);
        sb2.append(", email=");
        sb2.append(this.f44510b);
        sb2.append(", name=");
        return b.c0.s(sb2, this.f44511c, ", phone=", this.f44512d, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        PaymentSheet$Address paymentSheet$Address = this.f44509a;
        if (paymentSheet$Address == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$Address.writeToParcel(dest, i5);
        }
        dest.writeString(this.f44510b);
        dest.writeString(this.f44511c);
        dest.writeString(this.f44512d);
    }

    public PaymentSheet$BillingDetails(PaymentSheet$Address paymentSheet$Address, String str, String str2, String str3) {
        this.f44509a = paymentSheet$Address;
        this.f44510b = str;
        this.f44511c = str2;
        this.f44512d = str3;
    }
}
