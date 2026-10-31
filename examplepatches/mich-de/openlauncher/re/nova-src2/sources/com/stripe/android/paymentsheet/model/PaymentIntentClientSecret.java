package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentIntentClientSecret;", "Lcom/stripe/android/paymentsheet/model/ClientSecret;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class PaymentIntentClientSecret extends ClientSecret {

    @NotNull
    public static final Parcelable.Creator<PaymentIntentClientSecret> CREATOR = new sv.b(21);

    /* renamed from: a, reason: collision with root package name */
    public final String f44796a;

    public PaymentIntentClientSecret(String value) {
        Intrinsics.g(value, "value");
        this.f44796a = value;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof PaymentIntentClientSecret) && Intrinsics.b(this.f44796a, ((PaymentIntentClientSecret) obj).f44796a);
    }

    public final int hashCode() {
        return this.f44796a.hashCode();
    }

    public final String toString() {
        return c0.l("PaymentIntentClientSecret(value=", this.f44796a, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44796a);
    }
}
