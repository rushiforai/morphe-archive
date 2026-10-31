package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.New.USBankAccount(parcel.readString(), parcel.readInt(), PaymentSelection.New.USBankAccount.Input.CREATOR.createFromParcel(parcel), (BankFormScreenState) parcel.readParcelable(PaymentSelection.New.USBankAccount.class.getClassLoader()), parcel.readInt() == 0 ? null : PaymentSelection.New.USBankAccount.InstantDebitsInfo.CREATOR.createFromParcel(parcel), (PaymentMethodCreateParams) parcel.readParcelable(PaymentSelection.New.USBankAccount.class.getClassLoader()), wu.c.valueOf(parcel.readString()), (PaymentMethodOptionsParams) parcel.readParcelable(PaymentSelection.New.USBankAccount.class.getClassLoader()), (PaymentMethodExtraParams) parcel.readParcelable(PaymentSelection.New.USBankAccount.class.getClassLoader()));
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.New.USBankAccount[i5];
    }
}
