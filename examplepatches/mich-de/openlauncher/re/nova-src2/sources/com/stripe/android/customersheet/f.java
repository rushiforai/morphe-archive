package com.stripe.android.customersheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.customersheet.InternalCustomerSheetResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new InternalCustomerSheetResult.Error((Throwable) parcel.readSerializable());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new InternalCustomerSheetResult.Error[i5];
    }
}
