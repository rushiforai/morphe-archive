package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Spacing", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Spacing implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Spacing> CREATOR = new ou.l0(17);

    /* renamed from: b, reason: collision with root package name */
    public static final PaymentSheet$Spacing f44644b = new PaymentSheet$Spacing(-1.0f);

    /* renamed from: a, reason: collision with root package name */
    public final float f44645a;

    public PaymentSheet$Spacing(float f11) {
        this.f44645a = f11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentSheet$Spacing) && Float.compare(this.f44645a, ((PaymentSheet$Spacing) obj).f44645a) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f44645a);
    }

    public final String toString() {
        return "Spacing(spacingDp=" + this.f44645a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeFloat(this.f44645a);
    }
}
