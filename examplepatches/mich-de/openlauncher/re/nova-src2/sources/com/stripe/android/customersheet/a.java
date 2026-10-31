package com.stripe.android.customersheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.customersheet.CustomerSheetContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CustomerSheetContract.Args(jr.e.valueOf(parcel.readString()), CustomerSheet$Configuration.CREATOR.createFromParcel(parcel), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CustomerSheetContract.Args[i5];
    }
}
