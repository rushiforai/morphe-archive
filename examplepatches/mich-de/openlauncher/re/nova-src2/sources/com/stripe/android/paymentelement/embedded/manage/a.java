package com.stripe.android.paymentelement.embedded.manage;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentelement.embedded.manage.ManageContract;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.state.CustomerState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new ManageContract.Args((PaymentMethodMetadata) parcel.readParcelable(ManageContract.Args.class.getClassLoader()), (CustomerState) parcel.readParcelable(ManageContract.Args.class.getClassLoader()), (PaymentSelection) parcel.readParcelable(ManageContract.Args.class.getClassLoader()), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ManageContract.Args[i5];
    }
}
