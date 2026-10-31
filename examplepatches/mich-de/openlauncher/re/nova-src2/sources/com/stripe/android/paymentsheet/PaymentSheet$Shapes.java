package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Shapes", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Shapes implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Shapes> CREATOR = new ou.l0(16);

    /* renamed from: d, reason: collision with root package name */
    public static final PaymentSheet$Shapes f44628d;

    /* renamed from: a, reason: collision with root package name */
    public final float f44629a;

    /* renamed from: b, reason: collision with root package name */
    public final float f44630b;

    /* renamed from: c, reason: collision with root package name */
    public final float f44631c;

    static {
        hw.o oVar = hw.q.f60778c;
        float f11 = oVar.f60762a;
        f44628d = new PaymentSheet$Shapes(f11, oVar.f60764c, f11);
    }

    public PaymentSheet$Shapes(float f11, float f12, float f13) {
        this.f44629a = f11;
        this.f44630b = f12;
        this.f44631c = f13;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Shapes)) {
            return false;
        }
        PaymentSheet$Shapes paymentSheet$Shapes = (PaymentSheet$Shapes) obj;
        return Float.compare(this.f44629a, paymentSheet$Shapes.f44629a) == 0 && Float.compare(this.f44630b, paymentSheet$Shapes.f44630b) == 0 && Float.compare(this.f44631c, paymentSheet$Shapes.f44631c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f44631c) + a80.m.d(this.f44630b, Float.hashCode(this.f44629a) * 31, 31);
    }

    public final String toString() {
        return "Shapes(cornerRadiusDp=" + this.f44629a + ", borderStrokeWidthDp=" + this.f44630b + ", bottomSheetCornerRadiusDp=" + this.f44631c + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeFloat(this.f44629a);
        dest.writeFloat(this.f44630b);
        dest.writeFloat(this.f44631c);
    }
}
