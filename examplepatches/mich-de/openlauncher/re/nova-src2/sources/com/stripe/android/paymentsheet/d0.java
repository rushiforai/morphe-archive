package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheet$IntentConfiguration.Mode.Payment(parcel.readLong(), parcel.readString(), parcel.readInt() == 0 ? null : ou.t0.valueOf(parcel.readString()), ou.s0.valueOf(parcel.readString()), parcel.readInt() != 0 ? PaymentSheet$IntentConfiguration.Mode.Payment.PaymentMethodOptions.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheet$IntentConfiguration.Mode.Payment[i5];
    }
}
