package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$CustomerConfiguration", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$CustomerConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$CustomerConfiguration> CREATOR = new ou.l0(8);

    /* renamed from: a, reason: collision with root package name */
    public final String f44572a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44573b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$CustomerAccessType f44574c;

    public PaymentSheet$CustomerConfiguration(String id2, String ephemeralKeySecret, PaymentSheet$CustomerAccessType accessType) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(ephemeralKeySecret, "ephemeralKeySecret");
        Intrinsics.g(accessType, "accessType");
        this.f44572a = id2;
        this.f44573b = ephemeralKeySecret;
        this.f44574c = accessType;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$CustomerConfiguration)) {
            return false;
        }
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = (PaymentSheet$CustomerConfiguration) obj;
        return Intrinsics.b(this.f44572a, paymentSheet$CustomerConfiguration.f44572a) && Intrinsics.b(this.f44573b, paymentSheet$CustomerConfiguration.f44573b) && Intrinsics.b(this.f44574c, paymentSheet$CustomerConfiguration.f44574c);
    }

    public final int hashCode() {
        return this.f44574c.hashCode() + b.c0.e(this.f44572a.hashCode() * 31, 31, this.f44573b);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("CustomerConfiguration(id=", this.f44572a, ", ephemeralKeySecret=", this.f44573b, ", accessType=");
        sbW.append(this.f44574c);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44572a);
        dest.writeString(this.f44573b);
        dest.writeParcelable(this.f44574c, i5);
    }
}
