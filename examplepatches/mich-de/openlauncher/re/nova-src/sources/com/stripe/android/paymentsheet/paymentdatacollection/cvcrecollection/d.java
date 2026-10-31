package com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.paymentdatacollection.cvcrecollection.CvcRecollectionResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new CvcRecollectionResult.Confirmed(parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new CvcRecollectionResult.Confirmed[i5];
    }
}
