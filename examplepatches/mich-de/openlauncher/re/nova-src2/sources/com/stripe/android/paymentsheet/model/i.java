package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import ft.d0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.New.USBankAccount.InstantDebitsInfo((PaymentMethod) parcel.readParcelable(PaymentSelection.New.USBankAccount.InstantDebitsInfo.class.getClassLoader()), parcel.readInt() == 0 ? null : d0.valueOf(parcel.readString()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.New.USBankAccount.InstantDebitsInfo[i5];
    }
}
