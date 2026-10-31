package com.stripe.android.paymentsheet.paymentdatacollection.polling;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PollingContract.Args(parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt(), parcel.readInt(), parcel.readInt(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PollingContract.Args[i5];
    }
}
