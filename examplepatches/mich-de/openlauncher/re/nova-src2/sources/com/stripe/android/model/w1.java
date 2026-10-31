package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.LinkPaymentDetails;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w1 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new LinkPaymentDetails.Card(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.readString(), ft.b.valueOf(parcel.readString()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new LinkPaymentDetails.Card[i5];
    }
}
