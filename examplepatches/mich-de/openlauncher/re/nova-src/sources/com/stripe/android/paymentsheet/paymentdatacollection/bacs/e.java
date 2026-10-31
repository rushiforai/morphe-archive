package com.stripe.android.paymentsheet.paymentdatacollection.bacs;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.paymentdatacollection.bacs.BacsMandateConfirmationResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        parcel.readInt();
        return BacsMandateConfirmationResult.ModifyDetails.f44909a;
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BacsMandateConfirmationResult.ModifyDetails[i5];
    }
}
