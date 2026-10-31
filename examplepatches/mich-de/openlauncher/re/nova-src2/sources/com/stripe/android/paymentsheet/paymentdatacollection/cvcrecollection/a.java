package com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionContract;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CvcRecollectionContract.Args(parcel.readString(), ft.b.valueOf(parcel.readString()), PaymentSheet$Appearance.CREATOR.createFromParcel(parcel), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CvcRecollectionContract.Args[i5];
    }
}
