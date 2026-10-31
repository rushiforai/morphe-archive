package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new AddressElementActivityContract.Result((AddressLauncherResult) parcel.readParcelable(AddressElementActivityContract.Result.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new AddressElementActivityContract.Result[i5];
    }
}
