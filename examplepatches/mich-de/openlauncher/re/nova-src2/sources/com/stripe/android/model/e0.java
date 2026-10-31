package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ConsumerPaymentDetails.Passthrough(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() == 0 ? null : ConsumerPaymentDetails.BillingAddress.CREATOR.createFromParcel(parcel), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConsumerPaymentDetails.Passthrough[i5];
    }
}
