package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new BankFormScreenState.ResultIdentifier.PaymentMethod((PaymentMethod) parcel.readParcelable(BankFormScreenState.ResultIdentifier.PaymentMethod.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new BankFormScreenState.ResultIdentifier.PaymentMethod[i5];
    }
}
