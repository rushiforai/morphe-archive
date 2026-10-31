package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.Currency;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ShippingMethod;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ShippingMethod implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ShippingMethod> CREATOR = new ft.q(14);

    /* renamed from: a, reason: collision with root package name */
    public final String f43791a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43792b;

    /* renamed from: c, reason: collision with root package name */
    public final long f43793c;

    /* renamed from: d, reason: collision with root package name */
    public final Currency f43794d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43795e;

    public ShippingMethod(String label, String identifier, long j11, Currency currency, String str) {
        Intrinsics.g(label, "label");
        Intrinsics.g(identifier, "identifier");
        Intrinsics.g(currency, "currency");
        this.f43791a = label;
        this.f43792b = identifier;
        this.f43793c = j11;
        this.f43794d = currency;
        this.f43795e = str;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ShippingMethod)) {
            return false;
        }
        ShippingMethod shippingMethod = (ShippingMethod) obj;
        return Intrinsics.b(this.f43791a, shippingMethod.f43791a) && Intrinsics.b(this.f43792b, shippingMethod.f43792b) && this.f43793c == shippingMethod.f43793c && Intrinsics.b(this.f43794d, shippingMethod.f43794d) && Intrinsics.b(this.f43795e, shippingMethod.f43795e);
    }

    public final int hashCode() {
        int iHashCode = (this.f43794d.hashCode() + b.c0.d(b.c0.e(this.f43791a.hashCode() * 31, 31, this.f43792b), 31, this.f43793c)) * 31;
        String str = this.f43795e;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("ShippingMethod(label=", this.f43791a, ", identifier=", this.f43792b, ", amount=");
        sbW.append(this.f43793c);
        sbW.append(", currency=");
        sbW.append(this.f43794d);
        return b.c0.r(sbW, ", detail=", this.f43795e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43791a);
        dest.writeString(this.f43792b);
        dest.writeLong(this.f43793c);
        dest.writeSerializable(this.f43794d);
        dest.writeString(this.f43795e);
    }
}
