package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$PrimaryButtonShape", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$PrimaryButtonShape implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$PrimaryButtonShape> CREATOR = new ou.l0(14);

    /* renamed from: a, reason: collision with root package name */
    public final Float f44623a;

    /* renamed from: b, reason: collision with root package name */
    public final Float f44624b;

    /* renamed from: c, reason: collision with root package name */
    public final Float f44625c;

    public PaymentSheet$PrimaryButtonShape(Float f11, Float f12, Float f13) {
        this.f44623a = f11;
        this.f44624b = f12;
        this.f44625c = f13;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$PrimaryButtonShape)) {
            return false;
        }
        PaymentSheet$PrimaryButtonShape paymentSheet$PrimaryButtonShape = (PaymentSheet$PrimaryButtonShape) obj;
        return Intrinsics.b(this.f44623a, paymentSheet$PrimaryButtonShape.f44623a) && Intrinsics.b(this.f44624b, paymentSheet$PrimaryButtonShape.f44624b) && Intrinsics.b(this.f44625c, paymentSheet$PrimaryButtonShape.f44625c);
    }

    public final int hashCode() {
        Float f11 = this.f44623a;
        int iHashCode = (f11 == null ? 0 : f11.hashCode()) * 31;
        Float f12 = this.f44624b;
        int iHashCode2 = (iHashCode + (f12 == null ? 0 : f12.hashCode())) * 31;
        Float f13 = this.f44625c;
        return iHashCode2 + (f13 != null ? f13.hashCode() : 0);
    }

    public final String toString() {
        return "PrimaryButtonShape(cornerRadiusDp=" + this.f44623a + ", borderStrokeWidthDp=" + this.f44624b + ", heightDp=" + this.f44625c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Float f11 = this.f44623a;
        if (f11 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeFloat(f11.floatValue());
        }
        Float f12 = this.f44624b;
        if (f12 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeFloat(f12.floatValue());
        }
        Float f13 = this.f44625c;
        if (f13 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeFloat(f13.floatValue());
        }
    }
}
