package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$CustomPaymentMethod", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$CustomPaymentMethod implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$CustomPaymentMethod> CREATOR = new ou.l0(7);

    /* renamed from: a, reason: collision with root package name */
    public final String f44567a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f44568b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f44569c;

    public PaymentSheet$CustomPaymentMethod(String id2, ResolvableString resolvableString, boolean z11) {
        Intrinsics.g(id2, "id");
        this.f44567a = id2;
        this.f44568b = resolvableString;
        this.f44569c = z11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$CustomPaymentMethod)) {
            return false;
        }
        PaymentSheet$CustomPaymentMethod paymentSheet$CustomPaymentMethod = (PaymentSheet$CustomPaymentMethod) obj;
        return Intrinsics.b(this.f44567a, paymentSheet$CustomPaymentMethod.f44567a) && Intrinsics.b(this.f44568b, paymentSheet$CustomPaymentMethod.f44568b) && this.f44569c == paymentSheet$CustomPaymentMethod.f44569c;
    }

    public final int hashCode() {
        int iHashCode = this.f44567a.hashCode() * 31;
        ResolvableString resolvableString = this.f44568b;
        return Boolean.hashCode(this.f44569c) + ((iHashCode + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CustomPaymentMethod(id=");
        sb2.append(this.f44567a);
        sb2.append(", subtitle=");
        sb2.append(this.f44568b);
        sb2.append(", disableBillingDetailCollection=");
        return a80.m.k(sb2, this.f44569c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44567a);
        dest.writeParcelable(this.f44568b, i5);
        dest.writeInt(this.f44569c ? 1 : 0);
    }
}
