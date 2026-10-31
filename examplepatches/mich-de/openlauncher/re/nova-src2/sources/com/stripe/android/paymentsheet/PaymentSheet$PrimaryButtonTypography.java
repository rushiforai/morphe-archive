package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$PrimaryButtonTypography", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$PrimaryButtonTypography implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$PrimaryButtonTypography> CREATOR = new ou.l0(15);

    /* renamed from: a, reason: collision with root package name */
    public final Integer f44626a;

    /* renamed from: b, reason: collision with root package name */
    public final Float f44627b;

    public PaymentSheet$PrimaryButtonTypography(Integer num, Float f11) {
        this.f44626a = num;
        this.f44627b = f11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$PrimaryButtonTypography)) {
            return false;
        }
        PaymentSheet$PrimaryButtonTypography paymentSheet$PrimaryButtonTypography = (PaymentSheet$PrimaryButtonTypography) obj;
        return Intrinsics.b(this.f44626a, paymentSheet$PrimaryButtonTypography.f44626a) && Intrinsics.b(this.f44627b, paymentSheet$PrimaryButtonTypography.f44627b);
    }

    public final int hashCode() {
        Integer num = this.f44626a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Float f11 = this.f44627b;
        return iHashCode + (f11 != null ? f11.hashCode() : 0);
    }

    public final String toString() {
        return "PrimaryButtonTypography(fontResId=" + this.f44626a + ", fontSizeSp=" + this.f44627b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Integer num = this.f44626a;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        Float f11 = this.f44627b;
        if (f11 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeFloat(f11.floatValue());
        }
    }
}
