package com.stripe.android.customersheet;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.customersheet.InternalCustomerSheetResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new InternalCustomerSheetResult.Canceled((PaymentSelection) parcel.readParcelable(InternalCustomerSheetResult.Canceled.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new InternalCustomerSheetResult.Canceled[i5];
    }
}
