package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheetContract;
import com.stripe.android.paymentsheet.state.PaymentElementLoader$InitializationMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSheetContract.Args((PaymentElementLoader$InitializationMode) parcel.readParcelable(PaymentSheetContract.Args.class.getClassLoader()), PaymentSheet$Configuration.CREATOR.createFromParcel(parcel), parcel.readString(), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSheetContract.Args[i5];
    }
}
