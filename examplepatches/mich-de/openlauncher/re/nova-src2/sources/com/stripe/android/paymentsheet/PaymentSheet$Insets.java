package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Insets", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$Insets implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Insets> CREATOR = new ou.l0(10);

    /* renamed from: e, reason: collision with root package name */
    public static final PaymentSheet$Insets f44582e = new PaymentSheet$Insets(20.0f, 0.0f, 20.0f, 40.0f);

    /* renamed from: f, reason: collision with root package name */
    public static final PaymentSheet$Insets f44583f;

    /* renamed from: a, reason: collision with root package name */
    public final float f44584a;

    /* renamed from: b, reason: collision with root package name */
    public final float f44585b;

    /* renamed from: c, reason: collision with root package name */
    public final float f44586c;

    /* renamed from: d, reason: collision with root package name */
    public final float f44587d;

    static {
        hw.g gVar = hw.q.f60789p;
        f44583f = new PaymentSheet$Insets(gVar.f60729a, gVar.f60730b, gVar.f60731c, gVar.f60732d);
    }

    public PaymentSheet$Insets(float f11, float f12, float f13, float f14) {
        this.f44584a = f11;
        this.f44585b = f12;
        this.f44586c = f13;
        this.f44587d = f14;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Insets)) {
            return false;
        }
        PaymentSheet$Insets paymentSheet$Insets = (PaymentSheet$Insets) obj;
        return Float.compare(this.f44584a, paymentSheet$Insets.f44584a) == 0 && Float.compare(this.f44585b, paymentSheet$Insets.f44585b) == 0 && Float.compare(this.f44586c, paymentSheet$Insets.f44586c) == 0 && Float.compare(this.f44587d, paymentSheet$Insets.f44587d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f44587d) + a80.m.d(this.f44586c, a80.m.d(this.f44585b, Float.hashCode(this.f44584a) * 31, 31), 31);
    }

    public final String toString() {
        return "Insets(startDp=" + this.f44584a + ", topDp=" + this.f44585b + ", endDp=" + this.f44586c + ", bottomDp=" + this.f44587d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeFloat(this.f44584a);
        dest.writeFloat(this.f44585b);
        dest.writeFloat(this.f44586c);
        dest.writeFloat(this.f44587d);
    }
}
