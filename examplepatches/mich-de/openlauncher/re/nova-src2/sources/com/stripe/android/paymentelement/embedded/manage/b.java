package com.stripe.android.paymentelement.embedded.manage;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentelement.embedded.manage.ManageResult;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ManageResult.Complete((CustomerState) parcel.readParcelable(ManageResult.Complete.class.getClassLoader()), (PaymentSelection) parcel.readParcelable(ManageResult.Complete.class.getClassLoader()), parcel.readInt() != 0);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ManageResult.Complete[i5];
    }
}
