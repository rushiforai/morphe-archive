package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$ButtonThemes", "Landroid/os/Parcelable;", "ou/o0", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$ButtonThemes implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$ButtonThemes> CREATOR = new ou.l0(3);

    /* renamed from: a, reason: collision with root package name */
    public final ou.o0 f44520a;

    public PaymentSheet$ButtonThemes(ou.o0 link) {
        Intrinsics.g(link, "link");
        this.f44520a = link;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentSheet$ButtonThemes) && this.f44520a == ((PaymentSheet$ButtonThemes) obj).f44520a;
    }

    public final int hashCode() {
        return this.f44520a.hashCode();
    }

    public final String toString() {
        return "ButtonThemes(link=" + this.f44520a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44520a.name());
    }
}
