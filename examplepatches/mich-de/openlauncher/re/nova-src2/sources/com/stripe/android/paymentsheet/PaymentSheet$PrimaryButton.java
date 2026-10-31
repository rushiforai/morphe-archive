package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$PrimaryButton", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$PrimaryButton implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$PrimaryButton> CREATOR = new ou.l0(12);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$PrimaryButtonColors f44612a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$PrimaryButtonColors f44613b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$PrimaryButtonShape f44614c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$PrimaryButtonTypography f44615d;

    public PaymentSheet$PrimaryButton(PaymentSheet$PrimaryButtonColors colorsLight, PaymentSheet$PrimaryButtonColors colorsDark, PaymentSheet$PrimaryButtonShape shape, PaymentSheet$PrimaryButtonTypography typography) {
        Intrinsics.g(colorsLight, "colorsLight");
        Intrinsics.g(colorsDark, "colorsDark");
        Intrinsics.g(shape, "shape");
        Intrinsics.g(typography, "typography");
        this.f44612a = colorsLight;
        this.f44613b = colorsDark;
        this.f44614c = shape;
        this.f44615d = typography;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$PrimaryButton)) {
            return false;
        }
        PaymentSheet$PrimaryButton paymentSheet$PrimaryButton = (PaymentSheet$PrimaryButton) obj;
        return Intrinsics.b(this.f44612a, paymentSheet$PrimaryButton.f44612a) && Intrinsics.b(this.f44613b, paymentSheet$PrimaryButton.f44613b) && Intrinsics.b(this.f44614c, paymentSheet$PrimaryButton.f44614c) && Intrinsics.b(this.f44615d, paymentSheet$PrimaryButton.f44615d);
    }

    public final int hashCode() {
        return this.f44615d.hashCode() + ((this.f44614c.hashCode() + ((this.f44613b.hashCode() + (this.f44612a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "PrimaryButton(colorsLight=" + this.f44612a + ", colorsDark=" + this.f44613b + ", shape=" + this.f44614c + ", typography=" + this.f44615d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44612a.writeToParcel(dest, i5);
        this.f44613b.writeToParcel(dest, i5);
        this.f44614c.writeToParcel(dest, i5);
        this.f44615d.writeToParcel(dest, i5);
    }
}
